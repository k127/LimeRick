#' Get properties of a group of a survey
#'
#' Get properties of a survey. All internal properties of a survey are available.
#'
#' @param groupID ID of the group
# [from get question props, not sure if bug occurs here as well:][LimeSurvey API BUG]
#' @param lang Language code for the survey language which affects the group
#'   title amongst other properties (\strong{Note:} The API expects
#'   one of the survey languages as part of the request rather than falling back to
#'   the default language of the survey. However, you can look up that default
#'   language using \code{\link{lsGetSurveyProperties}()})
#' @param properties \emph{(optional)} A vector with the particular property names to request, otherwise get all settings
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return A list of group properties or a single property
#'
#' @examples \dontrun{
#'   lsGetGroupProperties("13", lang = "en")
#'   lsGetGroupProperties("13", properties = list("mandatory"))
#' }
#'
#' @seealso \code{\link{lsSetGroupProperties}()}
#'
#' @references \itemize{
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_group_properties}
#'   \item \url{https://api.limesurvey.org/classes/QuestionGroup.html} (for a list of available properties)
#' }
#'
#' @export
#'
lsGetGroupProperties = function(groupID,
                                lang = NULL,
                                properties = NULL,
                                lsAPIurl = getOption("lsAPIurl"),
                                sessionKey = NULL) {

    if (is.null(groupID))
        stop("Need to specify groupID")

    params = list(sSessionKey = sessionKey,
                  iGroupID = as.character(groupID),
                  aGroupSettings = properties,
                  sLanguage = lang)

    data = lsAPI(method = "get_group_properties",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
