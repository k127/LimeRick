#' List available surveys
#'
# THIS DOESN'T SEEM TO WORK ON THE API SIDE:
# @param username \emph{(optional)} To get all surveys belonging to username, otherwise get all surveys
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
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
#' @seealso
#' \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_surveys}
#'
#' @export
lsListSurveys = function(
#    username = NULL,
                         lsAPIurl = getOption("lsAPIurl"),
                         sessionKey = NULL) {

    if (is.null(lsAPIurl))
         stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")

    if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }

    if (is.null(sessionKey))
        stop("Need to have a session key. Use lsSessionKey('get') function.")

    params = list(sSessionKey = sessionKey,
                  sUsername = username)

    data = lsAPI(method = "list_surveys",
                 params = params,
                 lsAPIurl = lsAPIurl)
    data
}
