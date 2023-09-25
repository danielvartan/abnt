require(checkmate, quietly = TRUE)
require(here, quietly = TRUE)
require(yaml, quietly = TRUE)

clean_quarto_mess <- function(wd = here::here(),
                              keep = NULL,
                              quarto_yaml = NULL) {
  checkmate::assert_string(wd)
  checkmate::assert_directory_exists(wd, access = "rw")
  checkmate::assert_character(keep, null.ok = TRUE)
  checkmate::assert_string(quarto_yaml, null.ok = TRUE)

  if (!is.null(quarto_yaml)) {
    checkmate::assert_file_exists(quarto_yaml, access = "r", extension = "yml")
    quarto_vars <- yaml::read_yaml("_quarto.yml")

    if (isTRUE(quarto_vars$format$`tesesusp-pdf`$`keep-tex`)) {
      keep <- keep |> append("index.tex")
    }
  }

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
