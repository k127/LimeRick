#' List available surveys
#'
# THIS DOESN'T SEEM TO WORK ON THE API SIDE:
# @param username \emph{(optional)} To get all surveys belonging to username, otherwise get all surveys
#' @param setTypes \emph{(optional)} Fix field types of returned data frame
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return An dataframe with
#'   \code{sid} the ids of survey,
#'   \code{surveyls_title} the title of the survey,
#'   \code{startdate} start date,
#'   \code{expires} expiration date,
#'   \code{active} if survey is active (Y) or not (!Y)
#'
#' @examples \dontrun{
#'   lsListSurveys()
#' }
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_surveys}
#'
#' @export
#'
lsListSurveys = function(
#    username = NULL,
                         setTypes = TRUE,
                         lsAPIurl = getOption("lsAPIurl"),
                         sessionKey = NULL) {

    params = list(sSessionKey = sessionKey,
                  #sUsername = username
                  sUsername = NULL)

    data = lsAPI(method = "list_surveys",
                 params = params,
                 lsAPIurl = lsAPIurl)

    if (setTypes) data <- ls_setFieldTypes(data, list(
      sid = "character",
      surveyls_title = "character",
      startdate = "datetime",
      expires = "datetime"
      #active # for now, keep ["Y", "N"] # TODO map to logical
    ))

    data
}
