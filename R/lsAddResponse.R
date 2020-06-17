#' Function for adding new responses to the survey
#' todo: documentation
#' @export
lsAddResponse = function(surveyID,
                         response,
                         lsAPIurl = getOption("lsAPIurl"),
                         sessionKey = NULL) {

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    if (missing(response))
        stop("Need to specify new responses to the survey questions.")

    if (!is.list(response))
        stop("New response must be a list.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  aParticipantData = response)

    data = lsAPI(method = "add_response",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
