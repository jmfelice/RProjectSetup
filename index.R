source(here::here('library.R'))
purrr::walk(dir(here::here('functions')), source)

usethis::edit_r_buildignore()
