#' Get all answer options for a question in a survey
#'
#' (This convenience function is not directly mapped to a remote procedure.)
#'
#' @param questionID ID of the question
# [LimeSurvey API BUG]
#' @param lang Language code for the survey language (\strong{Note:} The API expects
#'   one of the survey languages as part of the request rather than falling back to
#'   the default language of the survey. However, you can look up that default
#'   language using \code{\link{lsGetSurveyProperties}()})
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey}()}
#'
#' @return A table of answer options
#'
#' @examples \dontrun{
#'   lsGetQuestionProperties("13", "en")
#'   lsGetQuestionProperties(questionID = "13", lang = "en", properties = list("mandatory"))
#' }
#'
#' @seealso \code{\link{lsGetQuestionProperties}()}
#'
#' @export
#'
ls_getAnswerOptions = function(questionID,
                               lang,
                               lsAPIurl = getOption("lsAPIurl"),
                               sessionKey = NULL) {

    if (is.null(questionID))
        stop("Need to specify questionID.")

    properties = lsGetQuestionProperties(questionID, lang = lang, properties = list("answeroptions"))

    answerOptionsList = properties$answeroptions

    if (!is.list(answerOptionsList))
        stop("No available answer options for this specific question.")

    nAnswers = NROW(answerOptionsList)

    answerOptionsDF = data.frame(answerCode = character(nAnswers),
                                 answerText = character(nAnswers),
                                 stringsAsFactors = FALSE)

    for (i in 1:nAnswers) {

        answerOptionsDF[i, ]$answerCode = names(answerOptionsList[i])
        answerOptionsDF[i, ]$answerText = answerOptionsList[[i]]$answer
    }

    answerOptionsDF
}
