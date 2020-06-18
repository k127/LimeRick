---
title: Pending tasks for next release
---

* [ ] Revert change in NEWS, but move to new release section
* [x] `devtools::spell_check()`
* [ ] Either: `install.packages("formatR") ; formatR::tidy_dir("R")`
* [x] Or: `install.packages("lintr") ; lintr::lint_package()` (see <http://r-pkgs.had.co.nz/r.html#style>)
* [ ] Update readme: contributing / development: workflow & qa (like above)
* [ ] Update readme: rpc functions tested against LS 3.15.x ...
* [x] Update readme: update and test all code examples
* [ ] Update readme badges
* [x] Refactor readme: Tutorial
* [x] Fix function documentations
* [ ] Fix other `devtools::check()` errors, warnings
* [ ] Create _LimeRick Test Survey_ to test against
* [ ] Write some tests
* [ ] Create package website `devtools::build_site()`
* [ ] Set up CI deployment to respective GitHub pages `usethis::use_pkgdown_travis()`
      (<https://pkgdown.r-lib.org/reference/deploy_site_github.html>)
* [ ] Regard funding organization (ISDC)
* [ ] Description file: fix maintainer
* [ ] Description file: fix full authors
* [ ] Description file: fix copyright holder
* [x] Figure out best practice of ownership of abandoned projects (<https://opensource.stackexchange.com/a/558/18588>)
* [x] Talk to current maintainer about maintenance
* [ ] Refactor links in description and readme
* [x] Purge `hello()`
* [ ] Discover license file best practice
* [x] Wrap function doc examples with `\dontrun{}`
* [x] Refactor `@example` / `@examples`
* [ ] Purge usage stats from R/*
* [ ] clear `/man/` and rebuild docs: `devtools::document()`
* [ ] `devtools::build_site()`
* [ ] `devtools::build_readme()` ...

## For each release do

* [ ] *META* Gather more relevant task from the above section
* [ ] Set date in description file
* [ ] Set version in description file
* [ ] Update `NEWS` file (changelog)
* [ ] `devtools::document();devtools::check()`
* [ ] See <http://r-pkgs.had.co.nz/check.html#check-workflow>
* [ ] Build (see respective section)

## Build

* [ ] *META* *TODO* Gather more relevant task from the above sections

## Some vignette / article suggestions

* [ ] Compose a vignette for use case "Bulk translations":
      Fetch all translatables, export and import csv, and update to server
* [ ] Draft a functional workflow: LimeSurvey -> R -> Google Spreadsheet
* [ ] Draft a functional workflow: Google Spreadsheet -> R -> LimeSurvey
* [ ] Connect R to a Google Spreadsheet

### Export all translatables to csv

**TODO**

### Import all translatables from csv

**TODO**

### Translate your surveys with Google Translate API

**TODO**

## Post release

* [ ] Promote package in LimeSurvey forum or alike

## RPC functions to maybe implement

* session_key
  * [x] `get_session_key`
  * [x] `release_session_key`
* properties
  * get
    * [ ] `get_group_properties`
    * [x] `get_language_properties`
    * [ ] `get_participant_properties`
    * [x] `get_question_properties`
    * [x] `get_survey_properties`
  * set
    * [ ] `set_group_properties`
    * [x] `set_language_properties`
    * [ ] `set_participant_properties`
    * [x] `set_question_properties`
    * [ ] `set_quota_properties`
    * [ ] `set_survey_properties`
* list
  * [x] `list_groups`
  * [ ] `list_participants`
  * [x] `list_questions`
  * [x] `list_surveys`
  * [ ] `list_users`
* [ ] `update_response`
