.onAttach <- function(libname, pkgname) {

    packageStartupMessage(paste("\nWelcome to LimeRick package version:",
                                 utils::packageVersion("LimeRick")))

    packageStartupMessage("\nPackage website: http://k127.github.io/LimeRick")

    packageStartupMessage("\nChangelog: news(package = \"LimeRick\")")
    packageStartupMessage("Package help: help(LimeRick)")

    packageStartupMessage("\nIf you find this package useful cite it please. Thank you! ")
    packageStartupMessage("See: citation(\"LimeRick\")")

    packageStartupMessage("\nTo suppress this message use:\nsuppressPackageStartupMessages(library(LimeRick))")

    packageStartupMessage("\nFirst you need to set login parameters and obtain a session key. \nSee the lsGetSessionKey() function help page (?lsGetSessionKey).\n")
}

#' Bridge between LimeSurvey and R
#'
#' The \code{LimeRick} package enables close connection between R and LimeSurvey
#' -- one of the most open source scripts for computer aided web interviewing.
#' Using the LimeSurvey RemoteControl2 JSON-RPC API for two way data exchange
#' allows for:
#' \itemize{
#'   \item importing on-line survey responses into R,
#'   \item adding new responses to the survey directly from R,
#'   \item automatically accessing surveys and question properties,
#'   \item implementing passive measurement surveys,
#'   \item developing data products based on real time declarative data collection.
#' }
#'
#' This package is a \emph{LimeSurvey RemoteControl 2} JSON-RPC API Client.
#'
#' The \code{\link{lsSessionCache}} environment is crated upon the package loading
#' and stores session data like session key or timestamp when the session started.
#' The environment is accessed directly only by package functions not by a package user.
#'
#' If you need help with your research or commercial projects,
#' feel free to contact me via my homepage contact form:
#' \url{http://www.wais.kamil.rzeszow.pl}.

#'
#' @docType package
#'
#' @name LimeRick
#'
#'

# @importFrom magrittr "%>%"
# @import utils

#' @seealso
#' \itemize{
#'   \item \url{http://www.wais.kamil.rzeszow.pl/LimeRick} [the package homepage]
#'   \item \url{https://github.com/kalimu/LimeRick} [source code & development version of the package]
#'   \item \url{http://limesurvey.org} [LimeSurvey homepage]
#' }
#'

# Setting a new environment to hold the session parameters.
    # Based on https://github.com/cloudyr/limer/blob/master/R/get_session_key.R

    lsSessionCache <- new.env(parent = emptyenv())
    lsSessionCache$check <- "OK"

NULL
