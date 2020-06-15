#' Set question properties
#'
#' @param questionID (!) The (numeric) question ID, which is unique for all surveys -- not to be confused with question code
#' @param properties A list with the particular field names as keys and their values to set on that particular question
#'   (see \code{lsListQuestions()} for available properties. \strong{Restricted} properties are:
#'   \code{qid}, \code{gid}, \code{sid}, \code{parent_qid}, \code{language}, \code{type},
#'   \code{question_order} in some condition (with dependecies).
#' @param lang \emph{(optional)} Language code for the language to update - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey}}
#'
#' @return List of succeeded and failed modifications according to internal validation
#'
#' @examples
#' lsSetQuestionProperties(questionID = 10, lang = "fr", properties = list(question = "Âge"))
#'
#' @seealso \itemize{
#'   \item \code{\link[LimeRick]{lsGetProperties}}
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_set_question_properties}
#' }
#'
#' @export
lsSetQuestionProperties = function(questionID,
                                   properties,
                                   lang = NULL,
                                   lsAPIurl = getOption("lsAPIurl"),
                                   sessionKey = NULL) {
  
  if (is.null(lsAPIurl))
    stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")
  
  if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }
  
  if (is.null(sessionKey))
    stop("Need to have a session key. Use lsSessionKey('get') function.")
  
  params = list(sSessionKey = sessionKey,
                iQuestionID = questionID,
                aQuestionData = properties,
                sLanguage = lang)
  
  list = lsAPI(method = "set_question_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
