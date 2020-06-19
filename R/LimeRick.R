#' Bridge between LimeSurvey and R
#'
#' This package is a \emph{\href{https://www.limesurvey.org/}{LimeSurvey} RemoteControl 2} JSON-RPC API Client for R.
#'
#' This package enables close connection between R and LimeSurvey
#' — an open source applocation for online interviewing.
#' Using the LimeSurvey API for bidirectional data exchange allows for:
#' \itemize{
#'   \item importing survey responses into R,
#'   \item adding new responses to the survey directly from R,
#'   \item automatically accessing surveys and question properties,
#'   \item developing data products based on real time declarative data collection.
#' }
#'
#' @references \itemize{
#'   \item \url{https://k127.github.io/LimeRick/} (package homepage)
#'   \item \url{https://github.com/k127/LimeRick/} (source code)
#'   \item \url{https://github.com/k127/LimeRick/issues/} (issue tracker)
#' }
#'
#' @docType package
#' @name LimeRick
#'
NULL

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


#' Setting a new environment to hold the session parameters.
#'
#' The \code{lsSessionCache} environment is crated upon the package loading
#' and stores session data like session key or timestamp when the session started.
#' The environment is accessed directly only by package functions not by a package user.
#'
# This line hides this function doc from the reference manual since it's
# "of interest to other developers extending your package, but not most users"
# (http://r-pkgs.had.co.nz/man.html#roxygen-comments)
#' @keywords internal
#'
#' @references \url{https://github.com/cloudyr/limer/blob/master/R/get_session_key.R}
#'
lsSessionCache <- new.env(parent = emptyenv())
lsSessionCache$check <- "OK"
