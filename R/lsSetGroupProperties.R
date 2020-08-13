#' Set group properties
#'
#' @param groupID The group ID (which is unique for all surveys,
#'   so no survey ID is required here)
#' @param properties A list with the particular field names as keys and their values to set on that particular group
#'   (see \code{\link{lsListGroups}()} for available properties. \strong{Restricted} properties are:
#'   \code{gid}, \code{sid}.
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return List of succeeded and failed modifications according to internal validation
#'
#' @examples \dontrun{
#'   lsSetGroupProperties(groupID = 10, properties = list(group_name = "Renseignements personnels"))
#'   lsSetGroupProperties(10, properties = list(group_name = "Persönliche Informationen"))
#' }
#'
#' @seealso \code{\link{lsGetGroupProperties}()}
#'
#' @references \itemize{
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_set_group_properties}
#'   \item \url{https://api.limesurvey.org/classes/QuestionGroup.html} (for a list of available properties)
#' }
#'
#' @export
#'
lsSetGroupProperties = function(groupID,
                                properties,
                                lsAPIurl = getOption("lsAPIurl"),
                                sessionKey = NULL) {

  params = list(sSessionKey = sessionKey,
                iGroupID = groupID,
                aGroupData = properties)

  list = lsAPI(method = "set_group_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
