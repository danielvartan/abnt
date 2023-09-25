require(checkmate, quietly = TRUE)
require(cli, quietly = TRUE)

list_files_by_pattern <- function(path = ".",
                                  pattern = NULL,
                                  len = 1,
                                  must_work = TRUE) {
  checkmate::assert_string(path)
  checkmate::assert_directory_exists(path)
  checkmate::assert_string(pattern, null.ok = TRUE)
  checkmate::assert_integerish(len, lower = 1, null.ok = TRUE)
  checkmate::assert_number(len, lower = 1, null.ok = TRUE)
  checkmate::assert_flag(must_work)

  file <-list.files(path, full.names = TRUE, pattern = pattern)

  if (isTRUE(must_work) && length(file) == 0) {
    cli::cli_abort(paste0(
      "No {.strong {cli::col_red('pdf')}} files were found in ",
      "{.strong {cli::col_blue(output_path)}}."
    ))
  }

  if (!is.null(len) && !length(file) == len) {
    cli_string <- ifelse(length(file) > len, "more", "less")

    cli::cli_abort(paste0(
      "{cli_string} than {.strong {len}} ",
      "{.strong {cli::col_red('pdf')}} {cli::qty(len)} file{?s} ",
      "{?was/were} found in {.strong {cli::col_blue(output_path)}}."
    ))
  }

  file
}
