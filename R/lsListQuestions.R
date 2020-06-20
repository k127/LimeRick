#' Return the ids and info of (sub-)questions of a survey/group
#'
#' @param surveyID ID of the survey
#' @param groupID \emph{(optional)} ID of the group to list questions
# [LimeSurvey API BUG]
#' @param lang Language code for the survey language (\strong{Note:} The API expects
#'   one of the survey languages as part of the request rather than falling back to
#'   the default language of the survey. However, you can look up that default
#'   language using \code{\link{lsGetSurveyProperties}()})
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return The list of questions
#'
#' @examples \dontrun{
#'   lsListQuestions("123456", lang = "fr")
#'   lsListQuestions("123456", lang = "fr", groupID = 1)
#' }
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_questions}
#'
#' @export
#'
lsListQuestions = function(surveyID,
                           lang,
                           groupID = NULL,
                           setTypes = TRUE,
                           lsAPIurl = getOption("lsAPIurl"),
                           sessionKey = NULL){

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  iGroupID = groupID,
                  sLanguage = lang)

    data = lsAPI(method = "list_questions",
                 params = params,
                 lsAPIurl = lsAPIurl)

    if (setTypes) data <- ls_setFieldTypes(data, list(
        qid = "integer",
        parent_qid = "integer",
        sid = "character",
        type = "factor",
        title = "character",
        question = "character",
        #preg # TODO
        help = "character",
        #other # for now, keep ["Y", "N"] # TODO map to logical
        #mandatory # for now, keep ["Y", "N"] # TODO map to logical
        question_order = "integer",
        language = "factor",
        scale_id = "integer",
        same_default = "integer",
        relevance = "character",
        #modulename # TODO
        gid = "integer"
    ))

    data
}
