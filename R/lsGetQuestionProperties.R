#' Get properties of a question in a survey
#'
#' Get properties of a survey. All internal properties of a survey are available.
#'
#' @param surveyID ID of the survey
#' @param lang \emph{(optional)} Language code for the language - if not given the base language of the particular survey is used
#' @param properties \emph{(optional)} A vector with the particular property names to request, otherwise get all settings
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#'
#' @return A list of question properties or a single property
#'
#' @examples \dontrun{
#'   lsGetQuestionProperties("13", lang = "en")
#'   lsGetQuestionProperties("13", lang = "en", properties = list("mandatory"))
#' }
#'
#' @seealso \itemize{
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_question_properties}
#'   \item \url{https://api.limesurvey.org/classes/Question.html} (for a list of available properties)
#' }
#'
#' @export
lsGetQuestionProperties = function(questionID,
                                   languageCode = NULL,
                                   properties = NULL,
                                   lsAPIurl = getOption("lsAPIurl"),
                                   sessionKey = NULL) {

    if (is.null(questionID))
        stop("Need to specify questionID.")

    params = list(sSessionKey = sessionKey,
                  iQuestionID = as.character(questionID),
                  aQuestionSettings = properties,
                  sLanguageCode = languageCode)

if (FALSE) {
    # this list should be dropped.
    # at the time of writing, there are even more (23) settings available.
    # no need to keep track here.
        aQuestionSettings = list(
            "available_answers", "subquestions", "attributes", "attributes_lang",
            "answeroptions","defaultvalue", "qid", "parent_qid", "sid",
            "gid", "type", "question", "preg", "help", "other", "mandatory",
            "question_order", "language", "scale_id", "same_default",
            "relevance", "modulename")
}

    data = lsAPI(method = "get_question_properties",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
