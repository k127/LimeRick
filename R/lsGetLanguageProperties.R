#' Get survey language properties
#'
#' @param surveyID ID of the Survey
#' @param properties array|null  \emph{(optional)} A list with the particular properties to get, default to all attributes
#' @param lang \emph{(optional)} Language code for the language to update - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey}}
#'
#' @return A list in case of success containing the requested values
#'
#' @examples
#' lsGetLanguageProperties(123456)
#' lsGetLanguageProperties(123456, lang = "fr")
#' lsGetLanguageProperties(123456, properties = list("surveyls_email_confirm"))
#' lsGetLanguageProperties(123456, lang = "fr", properties = list("surveyls_email_confirm"))
#'
#' @seealso \itemize{
#'   \item \code{\link[LimeRick]{lsSetLanguageProperties}}
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_language_properties}
#' }
#'
#' @export
lsGetLanguageProperties = function(surveyID,
                                   lang = NULL,
                                   properties = NULL,
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
    aSurveyLocaleSettings = properties,
    sLang = lang
  )
  
  list = lsAPI(method = "get_language_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
