require(checkmate, quietly = TRUE)
require(here, quietly = TRUE)
require(stringr, quietly = TRUE)
require(qpdf, quietly = TRUE)

remove_pdf_cover <- function(output_dir = here::here("docs")) {
  checkmate::assert_directory_exists(output_dir)

  file <-
    list.files(output_dir) |>
    stringr::str_subset("_trimmed\\.pdf$", negate = TRUE)

  new_file <-
    file |>
    stringr::str_remove(".pdf$") |>
    paste0("_trimmed.pdf")

  len <- qpdf::pdf_length(file.path(output_dir, file))

  qpdf::pdf_subset(
    input = file.path(output_dir, file),
    pages = seq(2, len),
    output = file.path(output_dir, new_file)
  )

  suppressWarnings(file.remove(file.path(output_dir, file)))

  invisible(NULL)
}
