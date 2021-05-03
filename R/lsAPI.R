#' Low level API calls
#'
#' Fire a request against the \emph{LimeSurvey RemoteControl 2} JSON-RPC API.
#'
#' @param method The API method name
#' @param params A list of \code{method}'s parameters (make sure to keep the element order as specified in API doc)
#' @param lsAPIurl \emph{(optional)} The API URL
#'
#' @return Whatever the API responds to this method specific request
#'
#' @examples \dontrun{
#'   lsAPI("get_summary", params = list(iSurveyID = "123456", sStatName = "all"))
#' }
#'
#' @references \url{https://api.limesurvey.org/classes/remotecontrol_handle.html}
#'
#' @export
#'
lsAPI = function(method,
                 params = NULL,
                 lsAPIurl = getOption("lsAPIurl")) {

    if (is.null(lsAPIurl))
        stop("Need to specify LimeSurvey API URL (lsAPIurl). \nYou can do it once by options(lsAPIurl = 'your_api_url').")

    if (missing(method))
        stop("Need to specify method function for the LimeSurvey API.")

    # add session key if missing in params
    # (!) note that the session key must be the first element in params
    if (!method %in% c("get_session_key", "release_session_key")) {

        if (is.null(params$sSessionKey) & is.null(lsSessionCache$sessionKey))
            stop("Need a session key. Either provide in function argument param or set environment with lsGetSessionKey()")

        if (is.null(params)) # list is null
            params = list(sSessionKey = lsSessionCache$sessionKey)

        # this case is rather rare since there should be a session key NULL placeholder
        # in the high level calling functions's param object to keep the argument order
        if (!"sSessionKey" %in% names(params)) # key does not exists
            params = c(list(sSessionKey = lsSessionCache$sessionKey), params) # session key probably must _prepend_ list

        if (is.null(params$sSessionKey)) # key does exist, but is null
            params$sSessionKey = lsSessionCache$sessionKey
    }

    # preparing the body of the API call in JSON format
    bodyJSON = list(method = method,
                    id = " ",
                    params = params)

    bodyJSON = jsonlite::toJSON(bodyJSON, auto_unbox = TRUE)

    # the API call
    # apiResponse = httr::POST(lsAPIurl,
    #                          httr::content_type_json(),
    #                          body = bodyJSON
    #                          )
    # RETRY() function allows you to retry a request multiple times
    # until it succeeds, if you you are trying to talk to an unreliable service
    apiResponse = httr::RETRY("POST", lsAPIurl,
                              httr::content_type_json(),
                              body = bodyJSON)

    # checking status code;
    # surprisingly API returns code 200 event if something is not OK (wrong password)
    if (httr::status_code(apiResponse) == 200) {

        content = httr::content(apiResponse, as = "text", encoding = "UTF-8")

        if (!is.character(content) && is.null(content$result))
            stop("Server is responding but not in a proper way. Please check the API URL.")

        apiResult = jsonlite::fromJSON(content)$result

        # we need also check the response status
        if (class(apiResult) == "list" && !is.null(apiResult$status) && apiResult$status != "OK") {

            # throwing an error and stopping execution of the script
            stop(apiResult$status)

        } else {

            apiResult
        }

    } else {

        cat("Status code is not 200! \n")
        stop(httr::http_status(apiResponse)$message)
    }
}
