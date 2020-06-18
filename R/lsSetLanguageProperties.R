#' Set survey language properties
#'
#' @param surveyID ID of the survey
#' @param properties A list with the particular field names as keys and their values to set on that particular survey
#' @param lang \emph{(optional)} Language code for the language to update - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey()}}
#'
#' @return \code{OK} if save successful otherwise error text
#'
#' @examples \dontrun{
#'   lsSetLanguageProperties("123456", properties = list(
#'     surveyls_email_confirm = "Hallo, this text comes from LimeRick"))
#'
#'   lsSetLanguageProperties("123456", lang = "fr", properties = list(
#'     surveyls_email_confirm = "Bonjour, this text comes from LimeRick"))
#' }
#'
#' @seealso \itemize{
#'   \item \code{\link{lsGetLanguageProperties()}}
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_set_language_properties}
#' }
#'
#' @export
#'
lsSetLanguageProperties = function(surveyID,
                                   properties,
                                   lang = NULL,
                                   lsAPIurl = getOption("lsAPIurl"),
                                   sessionKey = NULL) {

  params = list(sSessionKey = sessionKey,
                iSurveyID = surveyID,
                aSurveyLocaleData = properties,
                sLanguage = lang)

  list = lsAPI(method = "set_language_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
