#' Export responses
#'
#' @param surveyID ID of the survey
# @param documentType \emph{(optional)} ...TODO...
#' @param lang \emph{(optional)} Language code for the language to be used (This affects headers if \code{headingType} is not \code{"code"})
#' @param completionStatus \emph{(optional)} Response completion status. One out of \code{"complete"}, \code{"incomplete"}, \code{"all"}
#' @param headingType \emph{(optional)} Type of the column headers (mainly questions). One out of \code{"code"}, \code{"full"}, \code{"abbreviated"}
#' @param responseType \emph{(optional)} Answer codes (\code{"short"}) where applicable, or full answer texts (\code{"long"})
#' @param lsAPIurl \emph{(optional)} The URL of the \emph{LimeSurvey RemoteControl 2} JSON-RPC API
#' @param sessionKey \emph{(optional)} Authentication token, see \code{\link{lsSessionKey()}}
#'
#' @return A data frame with the survey responses
#'
#' @examples \dontrun{
#'   lsExportResponses("123456", completionStatus = "incomplete", headingType = "abbreviated")
#' }
#'
#' @seealso
#' \url{https://api.limesurvey.org/classes/remotecontrol_handle.html#method_export_responses}
#'
#' @export
lsExportResponses = function(surveyID,
                             #documentType = "csv",  # currently not supported
                             lang = NULL,
                             completionStatus = "all",
                             headingType = "code",
                             responseType = "short",
                             #fromResponseID = NULL, # currently not supported
                             #toResponseID = NULL,   # currently not supported
                             #fields = NULL,         # currently not supported
                             lsAPIurl = getOption("lsAPIurl"),
                             sessionKey = NULL) {

    # LimeSurvey plugins can provide other document types
    # availableCoreDocumentTypes = c("pdf", "csv", "xls", "doc", "json")

    # todo: wokring with other document types (JSON especially; is a bit
    # problematic)

    completionStati = c("all", "complete", "incomplete")
    completionStatus = match.arg(completionStatus, completionStati)

    headingTypes = c("code", "full", "abbreviated")
    headingType = match.arg(headingType, headingTypes)

    responseTypes = c("short", "long")
    responseType = match.arg(responseType, responseTypes)

    # TODO test responseTypes

    # TODO implement fromResponseID, toResponseID, fields

    # TODO where are the interview, group, question times??

    # TODO fix data types

    params = list(sSessionKey = sessionKey,
                  iSurveyID = surveyID,
                  sDocumentType = "csv",
                  sLanguageCode = lang,
                  sCompletionStatus = completionStatus,
                  sHeadingType = headingType,
                  sResponseType = responseType

                  # todo: there is a problem with API with setting this params
                  # to NULL: Error: Argument 'txt' must be a JSON string, URL or
                  # file.

                  # sFromResponseID = NULL,
                  # sToResponseID = NULL,
                  # sFields = NULL
                  )

    data = lsAPI(method = "export_responses",
                 params = params,
                 lsAPIurl = lsAPIurl)

    # decoding data from base64 format
    data = rawToChar(base64enc::base64decode(data))

    # importing data from CSV format into data frame
    # (!) this specific format is tested against LimeSurvey 3.22.15:
    # CSV field separator is a semicolon (";")!
    df = read.csv(textConnection(data),
                  encoding = "UTF-8",
                  quote = "'\"",
                  sep = ";",
                  na.strings = c("", "\"\""),
                  stringsAsFactors = FALSE)

    df
}
