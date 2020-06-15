#' Function for listing surveys, groups or questions
#' todo: documentation
#' @export
#'
#'



lsList = function(action = "surveys",
                  surveyID = NULL,
                  lsAPIurl = getOption("lsAPIurl"),
                  sessionKey = NULL,
                  usageStats = getOption("LimeRickStats")
                  ){

    if (is.null(lsAPIurl))
         stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")

    if (is.null(sessionKey)) { sessionKey = lsSessionCache$sessionKey }

    if (is.null(sessionKey))
        stop("Need to have a session key. Use lsSessionKey('get') function.")

    if (action == "questions")
        stop("action = \"questions\" is unsupported. Please use function lsListQuestion() instead.")

    if (!action %in% c("surveys", "groups"))
        stop("Wrong action parameter. Available are: 'surveys', 'groups'.")

    # setting parameters for API call
    if (action == "surveys") {

     #   params = list(sSessionKey = sessionKey)
        method = "list_surveys"
        params = NULL

    } else {

        if (is.null(surveyID))
            stop("Need to specify surveyID.")

        params = list(sSessionKey = sessionKey,
                      iSurveyID = surveyID)

        method = "list_groups"
    }

    data = lsAPI(method = method,
                 params = params,
                 lsAPIurl = lsAPIurl)
    data
}
