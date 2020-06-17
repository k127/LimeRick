#' Get survey summary, regarding token usage and survey participation
#'
#' @param surveyID ID of the survey
#' @param status \emph{(optional)} To request a specific status (\code{"completed_responses"},
#'   \code{"incomplete_responses"}, \code{"full_responses"}, \code{"token_count"}, \code{"token_invalid"},
#'   \code{"token_sent"}, \code{"token_opted_out"}, \code{"token_completed"}, \code{"token_screenout"})
#'   as string or \code{"all"} as a list
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#'
#' @return A string if \code{status} is provided and not \code{"all"},
#'   otherwise a list containing all available values
#'
#' @examples \dontrun{
#'   lsGetSummary("123456")
#' }
#'
#' @seealso
#' \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_summary}
#'
#' @export
lsGetSummary = function(surveyID,
                        status = "all",
                        lsAPIurl = getOption("lsAPIurl"),
                        sessionKey = NULL){

    stati = c("all", "completed_responses", "incomplete_responses",
              "full_responses", "token_count", "token_invalid", "token_sent",
              "token_opted_out", "token_completed", "token_screenout")

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    if (!status %in% stati)
        stop("Status must be one out of:", paste0(stati, collapse = ", "))

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  sStatName = status)

    data = lsAPI(method = "get_summary",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
