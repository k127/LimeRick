#' Get all answer options for a question in a survey
#'
#' (This convenience function is not directly mapped to a remote procedure.)
#'
#' @param questionID ID of the question
#' @param lang \emph{(optional)} Language code for the language - if not given the base language of the particular survey is used
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#'
#' @return A table of answer options
#'
#' @examples \dontrun{
#'   lsGetQuestionProperties("13", lang = "en")
#'   lsGetQuestionProperties("13", lang = "en", properties = list("mandatory"))
#' }
#'
#' @seealso
#' \link{\code{lsGetQuestionProperties()}}
#'
#' @export
ls_getAnswerOptions = function(questionID,
                               lang = NULL,
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

        answerOptionsDF[i,]$answerCode = names(answerOptionsList[i])
        answerOptionsDF[i,]$answerText = answerOptionsList[[i]]$answer
    }

    answerOptionsDF
}
