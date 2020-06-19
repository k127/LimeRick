#' Get survey properties
#'
#' Get properties of a survey. All internal properties of a survey are available.
#'
#' @param surveyID ID of the survey
#' @param properties \emph{(optional)} A vector with the particular property names to request, otherwise get all settings
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsGetSessionKey()}}
#'
#' @return A list of survey properties or a single property
#'
#' @examples \dontrun{
#'   lsGetSurveyProperties("123456")
#'   lsGetSurveyProperties("123456", properties = list("anonymized"))
#'   lsGetSurveyProperties("123456", properties = list("adminemail",
#'                                                     "anonymized"))
#' }
#'
#' @references \itemize{
#'   \item \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_get_survey_properties}
#'   \item \url{https://api.limesurvey.org/classes/Survey.html} (for a list of available properties)
#' }
#'
#' @export
#'
lsGetSurveyProperties = function(surveyID,
                                 properties = NULL,
                                 lsAPIurl = getOption("lsAPIurl"),
                                 sessionKey = NULL) {

    if (is.null(surveyID))
        stop("Need to specify surveyID.")

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  aSurveySettings = properties)

if (FALSE) {
    # this list should be dropped.
    # at the time of writing, there are even more (60) settings available.
    # no need to keep track here.
                  aSurveySettings = list('sid', 'owner_id', 'admin', 'active',
                                         'expires', 'startdate', 'adminemail',
                                         'anonymized', 'faxto', 'format', 'savetimings',
                                         'template', 'language', 'additional_lanuages',
                                         'datestamp', 'usecookie', 'allowregister',
                                         'allowsave', 'autonumber_start', 'autoredirect',
                                         'allowprev', 'printanswers','ipaddr',
                                         'refurl', 'datecreated', 'publicstatistics',
                                         'publicgraphs', 'listpublic', 'htmlemail',
                                         'sendconfirmation', 'tokenanswerpersistence',
                                         'assessments', 'usecaptcha', 'usetokens',
                                         'bounce_email', 'attributedescriptions',
                                         'emailresponseto', 'emailnotificationto',
                                         'tokenlength', 'showxquestions', 'showgroupinfo',
                                         'shownoanswer', 'showqnumcode', 'bouncetime',
                                         'bounceprocessing', 'bounceaccounttype',
                                         'bounceaccounthost', 'bounceaccountpass',
                                         'bounceaccountencrption', 'bounceaccountuser',
                                         'showwelcome', 'showprogress', 'questionindex',
                                         'navigationdelay', 'nokeyboard',
                                         'alloweditaftercompletion', 'googleanalyticsstyle',
                                         'googleanalyticsapikey')
}

    data = lsAPI(method = "get_survey_properties",
                 params = params,
                 lsAPIurl = lsAPIurl)

    data
}
