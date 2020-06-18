#' List available surveys
#'
# THIS DOESN'T SEEM TO WORK ON THE API SIDE:
# @param username \emph{(optional)} To get all surveys belonging to username, otherwise get all surveys
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey()}}
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
#'
lsListSurveys = function(
#    username = NULL,
                         lsAPIurl = getOption("lsAPIurl"),
                         sessionKey = NULL) {

    params = list(sSessionKey = sessionKey,
                  sUsername = username)

    data = lsAPI(method = "list_surveys",
                 params = params,
                 lsAPIurl = lsAPIurl)
    data
}
