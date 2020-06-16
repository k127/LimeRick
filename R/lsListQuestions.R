#' Return the ids and info of (sub-)questions of a survey/group
#'
#' @param surveyID ID of the survey
#' @param groupID \emph{(optional)} ID of the group to list questions
#' @param lang \emph{(optional)} Language code for the language - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#' 
#' @return The list of questions
#'
#' @examples \dontrun{
#'   lsListQuestions("123456")
#'   lsListQuestions("123456", lang = "fr")
#'   lsListQuestions("123456", lang = "fr", groupID = 1)
#' }
#'
#' @seealso
#' \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_questions}
#'
#' @export
lsListQuestions = function(surveyID,
                           groupID = NULL,
                           lang = NULL,
                           lsAPIurl = getOption("lsAPIurl"),
                           sessionKey = NULL){

    if (is.null(lsAPIurl))
         stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")

    if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }

    if (is.null(sessionKey))
        stop("Need to have a session key. Use lsSessionKey('get') function.")

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  iGroupID = groupID,
                  sLanguage = lang)

    data = lsAPI(method = "list_questions",
                 params = params,
                 lsAPIurl = lsAPIurl)
    data
}
