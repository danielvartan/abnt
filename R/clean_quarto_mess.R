require(checkmate, quietly = TRUE)
require(here, quietly = TRUE)

clean_quarto_mess <- function(wd = here::here(), keep = NULL) {
  checkmate::assert_string(wd)
  checkmate::assert_directory_exists(wd, access = "rw")
  checkmate::assert_character(keep, null.ok = TRUE)

  files <- c(
    "index.aux", "index.loa", "index.log", "index.tex", "tesesusp.cls"
  )

  for (i in files[!files %in% keep]) {
    if (checkmate::test_file_exists(file.path(wd, i))) {
      unlink(i)
    }
  }

  dirs <- c(".temp")

  for (i in dirs[!dirs %in% keep]) {
    if (checkmate::test_directory_exists(file.path(wd, i))) {
      unlink(i, recursive = TRUE)
    }
  }

  invisible(NULL)
}
