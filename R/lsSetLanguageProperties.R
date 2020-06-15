#' Set survey language properties
#'
#' @param surveyID ID of the survey
#' @param properties A list with the particular field names as keys and their values to set on that particular survey
#' @param lang \emph{(optional)} Language code for the language to update - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey}}
#'
#' @return \code{OK} if save successful otherwise error text
#'
#' @examples
#' lsSetLanguageProperties(123456, properties = list(
#'   surveyls_email_confirm = "Hallo, this text comes from LimeRick"))
#' lsSetLanguageProperties(123456, lang = "fr", properties = list(
#'   surveyls_email_confirm = "Bonjour, this text comes from LimeRick"))
#'
#' @seealso \itemize{
#'   \item \code{\link[LimeRick]{lsGetLanguageProperties}}
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_set_language_properties}
#' }
#'
#' @export
lsSetLanguageProperties = function(surveyID,
                                   properties,
                                   lang = NULL,
                                   lsAPIurl = getOption("lsAPIurl"),
                                   sessionKey = NULL) {
  
  if (is.null(lsAPIurl))
    stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")
  
  if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }
  
  if (is.null(sessionKey))
    stop("Need to have a session key. Use lsSessionKey('get') function.")
  
  params = list(
    sSessionKey = sessionKey,
    iSurveyID = surveyID,
    aSurveyLocaleData = properties,
    sLanguage = lang
  )
  
  list = lsAPI(method = "set_language_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
