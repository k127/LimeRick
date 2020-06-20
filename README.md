LimeRick
================

<!-- README.md is generated from README.Rmd. Please edit this file -->

<!--
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://choosealicense.com/licenses/mit/)[![Last-changedate](https://img.shields.io/badge/last%20change-18439-yellowgreen.svg)](/commits/master)



[![Project Status: active](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/LimeRick)](https://cran.r-project.org/package=LimeRick)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/LimeRick?)](https://github.com/metacran/cranlogs.app)
-->

**Bridge between R and LimeSurvey**

This package is a *[LimeSurvey](http://limesurvey.org) RemoteControl 2*
JSON-RPC API Client for R.

## Motivation

  - need for a bridge that **connects very closely** two open source
    projects (R and LimeSurvey)
  - need for an **advanced tool** that allow for:
      - **quickly importing** responses into R from active online
        surveys
      - **automatically accessing** properties of survey and questions
      - **monitoring** survey status and responses directly from R
      - **adding new responses** to a survey directly from R
      - **simplifying workflow** for reproducible analysis <br/> (by
        providing in advance structured data schema)
      - developing **data products** based on **real-time** declarative
        data collection <br/> (e.g. continuous online tracking studies)
      - collecting meta-data of respondents interactions with online
        surveys <br/> on **unique low-granular level**

## Tutorial

### Installing from GitHub

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("k127/LimeRick")
```

### Loading the installed package

``` r
library(LimeRick)
#> 
#> Welcome to LimeRick package version: 0.2.0
#> 
#> Package website: http://k127.github.io/LimeRick
#> 
#> Changelog: news(package = "LimeRick")
#> Package help: help(LimeRick)
#> 
#> If you find this package useful cite it please. Thank you!
#> See: citation("LimeRick")
#> 
#> To suppress this message use:
#> suppressPackageStartupMessages(library(LimeRick))
#> 
#> First you need to set login parameters and obtain a session key. 
#> See the lsGetSessionKey() function help page (?lsGetSessionKey).
```

### Configuring access to a survey

``` r
# Set the LimeSurvey RemoteControl 2 JSON-RPC API URL
options(lsAPIurl = "https://survey.example.com/index.php/admin/remotecontrol")

# Set LimeSurvey credentials
options(lsUser = "LimeRickDemo")
options(lsPass = "LimeRickDemo")
```

### Low-level API function calls vs. function wrappers

``` r
# Compare a low level API call …
lsAPI(method = "get_session_key", params = list(admin = getOption("lsUser"),
                                                password = getOption("lsPass")))

# … to this Higher level API call
lsGetSessionKey()
```

### Setting a connection to a survey

``` r
# Get session key for the user and save it to the lsSessionCache environment
lsGetSessionKey()

# If you work with a specific locale at LimeSurvey you maybe want to set it
Sys.setlocale("LC_ALL", "Polish")
```

### Listing available surveys

``` r
# List available surveys
(surveyList = lsListSurveys())

# Extract the ID of the first survey in the list
surveyID = surveyList$sid[1] 
```

### Listing survey questions

``` r
questionList = lsListQuestions(surveyID, lang = "en")
```

### Accessing survey or question properties

We can access all available question and survey properties. For example:

``` r
# Is the survey active? (Y - Yes)
lsGetSurveyProperties(surveyID)$active

# What is the main text of a given question?
lsGetQuestionProperties(13, lang = "en")$question

# Is the question mandatory? (Y - Yes)
lsGetQuestionProperties(13, lang = "en")$mandatory
```

### Checking survey response summary

``` r
lsGetSummary(surveyID)
```

### Export responses

``` r
d = lsExportResponses(surveyID, completionStatus = "complete")
tail(d)
```

### Adding responses to the survey

``` r
# Show possible options for a particular question
ls_getAnswerOptions(questionID = 13, lang = "en")

# Create a response using question codes: surveyID+"X"+groupID+"X"+questionID
response = list('123456X1X12' = "LimeRick",
                '123456X1X17' = "Adding feedback directly from R",
                '123456X2X28' = "A2",# Academia
                '123456X2X29' = "174" # Poland
                )

# Add the above response to the survey
lsAddResponse(surveyID, response)
```

## See also

  - Limesurvey GmbH. / LimeSurvey: An Open Source survey tool
    /LimeSurvey GmbH, Hamburg, Germany. URL <http://www.limesurvey.org>
