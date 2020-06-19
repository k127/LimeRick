#' Set question properties
#'
#' @param questionID The question ID (which is unique for all surveys,
#'   so no survey ID is required here) -- not to be confused with the question code
#' @param properties A list with the particular field names as keys and their values to set on that particular question
#'   (see \code{\link{lsListQuestions}()} for available properties. \strong{Restricted} properties are:
#'   \code{qid}, \code{gid}, \code{sid}, \code{parent_qid}, \code{language}, \code{type},
#'   \code{question_order} in some condition (with dependencies).
# [Potential LimeSurvey API BUG]
#' @param lang Language code for the survey language (\strong{Note:} The API expects
#'   one of the survey languages as part of the request rather than falling back to
#'   the default language of the survey. However, you can look up that default
#'   language using \code{\link{lsGetSurveyProperties}()})
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return List of succeeded and failed modifications according to internal validation
#'
#' @examples \dontrun{
#'   lsSetQuestionProperties(questionID = 10, lang = "fr", properties = list(question = "Âge"))
#'   lsSetQuestionProperties(10, "de", properties = list(question = "Alter"))
#' }
#'
#' @seealso \code{\link{lsGetQuestionProperties}()}
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_set_question_properties}
#'
#' @export
#'
lsSetQuestionProperties = function(questionID,
                                   lang,
                                   properties,
                                   lsAPIurl = getOption("lsAPIurl"),
                                   sessionKey = NULL) {

  params = list(sSessionKey = sessionKey,
                iQuestionID = questionID,
                aQuestionData = properties,
                sLanguage = lang)

  list = lsAPI(method = "set_question_properties",
               params = params,
               lsAPIurl = lsAPIurl)

  list
}
