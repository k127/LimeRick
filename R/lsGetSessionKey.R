#' Create and return a session key
#'
#' Creates a new JSON-RPC session key. This is mandatory for all following \emph{LimeSurvey RemoteControl 2} function calls.
#'
#' @param username \emph{(optional)} The LimeSurvey user name
#' @param password \emph{(optional)} The LimeSurvey password
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param setEnvir Sets a session key environment variable so that it doesn't have to be passed as an argument to other functions
#'
#' @return \itemize{
#'   \item On success: the session key.
#'   \item On error: \itemize{
#'     \item For protocol-level errors (invalid format etc), an error message.
#'     \item For invalid user name and password, returns a null error and the result body contains a 'status' name-value pair with the error message.
#' }}
#'
#' @examples \dontrun{
#'   lsGetSessionKey()
#' }
#'
#' @seealso \code{\link{lsReleaseSessionKey()}}
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_session_key}
#'
#' @export
#'
lsGetSessionKey = function(lsAPIurl = getOption("lsAPIurl"),
                           username = getOption("lsUser"),
                           password = getOption("lsPass"),
                           setEnvir = TRUE) {

    params = list(admin = username,
                  password = password)

    key = lsAPI(method = "get_session_key",
                params,
                lsAPIurl = lsAPIurl)

    if (setEnvir) {
        assign("sessionKey", key, envir = lsSessionCache)
        assign("sessionStart", Sys.time(), envir = lsSessionCache)
    }

    key
}
