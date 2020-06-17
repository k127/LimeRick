#' Function for getting answer options for the question
#' todo: documentation
#' @export
#'
#'



lsGetAnswerOptions = function(surveyID,
                              questionID,
                              lsAPIurl = getOption("lsAPIurl"),
                              sessionKey = NULL) {

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    if (is.null(questionID))
        stop("Need to specify questionID.")

    properties = lsGetProperties("question", surveyID, questionID)

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
