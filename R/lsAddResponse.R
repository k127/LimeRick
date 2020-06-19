#' Add a response to the survey responses collection
#'
#' @param surveyID ID of the survey
#' @param response The actual response. A list of answers, where the keys must
#'   follow the format \code{paste0(surveyID, "X", groupID, "X", questionID)}
#'   e.g. \code{"527317X1X11"}. To obtain these group and question IDs,
#'   see \code{\link{lsListGroups}()} and \code{\link{lsListQuestions}()}
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return The response ID or an list with status message (can include result_id)
#'
#' @examples \dontrun{
#'   lsAddResponse("123456", list("326623X37X288" = "This answer comes via RPC",
#'                                "326623X38X289" = "This one also"))
#' }
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_add_response}
#'
#' @export
#'
lsAddResponse = function(surveyID,
                         response,
                         lsAPIurl = getOption("lsAPIurl"),
                         sessionKey = NULL) {

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    if (missing(response))
        stop("Need to specify new responses to the survey questions.")

    if (!is.list(response))
        stop("New response must be a list.")

    # check list item keys for specific format
    keyPattern = "^\\d+X\\d+X\\d+$"
    if (sum(grepl(keyPattern, names(response)) == FALSE) > 0)
        stop("One or more keys in the response parameter (see param doc) do not follow the pattern: ",
             paste0(names(response), collapse = ", "))

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  aParticipantData = response)

    data = lsAPI(method = "add_response",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
