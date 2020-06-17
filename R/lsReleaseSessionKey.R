#' Close the RPC session
#' 
#' Closes a previously opened JSON-RPC session ("Log out").
#'
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#'
#' @return \code{OK}
#'
#' @examples \dontrun{
#'   lsReleaseSessionKey()
#' }
#'
#' @seealso \itemize{
#'   \item \code{\link{lsGetSessionKey()}}
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_release_session_key}
#' }
#'
#' @export
lsReleaseSessionKey = function(lsAPIurl = getOption("lsAPIurl")) {

    response = lsAPI(method = "release_session_key",
                     lsAPIurl = lsAPIurl)

    lsSessionCache$sessionKey = NULL

    response
}
