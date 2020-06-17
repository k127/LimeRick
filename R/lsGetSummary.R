#' Function for getting survey summary
#' todo: documentation
#' @export
lsGetSummary = function(surveyID,
                        lsAPIurl = getOption("lsAPIurl"),
                        sessionKey = NULL){

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  sStatName = "all")

    data = lsAPI(method = "get_summary",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
