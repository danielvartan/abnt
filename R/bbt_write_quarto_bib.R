# See <https://github.com/paleolimbot/rbbt>.

require(checkmate, quietly = TRUE)
require(rbbt, quietly = TRUE)
require(stringr, quietly = TRUE)

bbt_write_quarto_bib <- function(bib_file, dir, pattern = "\\.qmd$") {
  checkmate::assert_string(bib_file)
  checkmate::assert_path_for_output(bib_file, overwrite = TRUE)
  checkmate::assert_character(dir)
  for (i in dir) checkmate::assert_directory_exists(i)
  checkmate::assert_string(pattern)

  keys <-
    dir |>
    lapply(function(x) {
      setdiff(
        list.files(x, full.names = TRUE),
        list.dirs(x, recursive = FALSE, full.names = TRUE)
      ) |>
        stringr::str_subset(pattern)
    }) |>
    unlist() |>
    rbbt::bbt_detect_citations() |>
    sort()

  keys <-
    keys[!keys %in% bbt_types] |>
    stringr::str_subset("^fig-|^sec-", negate = TRUE)

  rbbt::bbt_write_bib(
    path = bib_file,
    keys = keys,
    overwrite = TRUE
    )

  invisible(NULL)
}

bbt_types <- c(
  "article", "booklet", "conference", "inbook", "incollection", "inproceedings",
  "manual", "mastersthesis", "misc", "phdthesis", "proceedings", "techreport",
  "unpublished"
)
