#' Write .gitignore file
#' 
#' This includes the following line items:
#' .Rproj.user
#' .Rhistory
#' .RData
#' .Ruserdata
#' .xlsx
#' .pdf
#' .html
#' /data
#' /output
#' 
#' The main purpose is to ensure no private data gets posted
#'
#' @export
#'
write_git_ignore <- function() {
  lines <- 
    c(
      ".Rproj.user",
      ".Rhistory",
      ".RData",
      ".Ruserdata", 
      ".xlsx", 
      ".pdf", 
      ".html", 
      "/data", 
      "/output"
    )
  
  writeLines(lines, here::here(".gitignore"))
}

#' Write Directories
#' 
#' This includes:
#' output
#' functions
#' data
#' R
#' tests
#' documentation
#'
#' @export
#' 
write_directories <- function() {
  dirs <- 
    c(
      "output",
      "functions", 
      "data", 
      "R", 
      "tests", 
      "documentation"
    )
  
  lapply(dirs, function(x) dir.create(here::here(x), showWarnings = F))
}

#' Write Library
#' 
#' The standard sourced libraries are already attached:
#' tidyverse, lubridate, magrittr
#'
#' @export
#' 
write_library <- function() {
  lines <- paste0("library(", c("tidyverse", "lubridate", "magrittr"), ")")
  writeLines(lines, here::here("library.R"))
}

#' Write Index
#' 
#' This is the main file for the project which will be used to source
#' all functions, libraries, and data as necessary and run all other 
#' scripts.
#'
#' @export
#' 
write_index <- function() {
  library   <- "source(here::here('library.R'))"
  functions <- "purrr::walk(dir(here::here('functions')), source)"
  lines     <- c(library, functions)
  writeLines(lines, here::here("index.R"))
}

#' Initialilze Project
#' 
#' Write all directories, files, and gitigore
#'
#' @export
#' 
init_project <- function() {
  write_directories()
  write_library()
  write_index()
  write_git_ignore()
}

