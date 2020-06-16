#' Get survey groups
#'
#' @param surveyID ID of the survey containing the groups
#' @param lang \emph{(optional)} Language code for the language -- if not given, due to a bug in the API, instead of just the base language of the particular survey, all languages are returned
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#' 
#' @return The ids and all attributes of all survey groups
#'
#' @examples \dontrun{
#'   lsListGroups("123456")
#'   lsListGroups("123456", lang = "fr")
#' }
#'
#' @seealso
#' \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_groups}
#'
#' @export
lsListGroups = function(surveyID,
                        lang = NULL,
                        lsAPIurl = getOption("lsAPIurl"),
                        sessionKey = NULL) {

    if (is.null(lsAPIurl))
         stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")

    if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }

    if (is.null(sessionKey))
        stop("Need to have a session key. Use lsSessionKey('get') function.")

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  sLanguage = lang)

    data = lsAPI(method = "list_groups",
                 params = params,
                 lsAPIurl = lsAPIurl)
    
    ########################
    # !! as tested against API of LS 3.22.15, the language parameter seems disregarded.
    #    So, as a work around we can drop any obs with language != lang.
    
    if (!is.null(lang)) data <- data[data[, "language"] == lang,]
    ########################
    
    data
}
