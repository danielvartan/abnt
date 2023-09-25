require(checkmate, quietly = TRUE)
require(here, quietly = TRUE)
require(stringr, quietly = TRUE)
require(qpdf, quietly = TRUE)

remove_pdf_cover <- function(input_file, output_file = input_file) {
  checkmate::assert_string(input_file, pattern = ".pdf$")
  checkmate::assert_file_exists(input_file, access = "r")
  checkmate::assert_string(output_file, pattern = ".pdf$")
  checkmate::assert_directory_exists(dirname(file), access = "w")

  if (input_file == output_file) {
    temp_file <- tempfile()
    file.copy(input_file, temp_file)
    input_file <- temp_file
  }

  len <- qpdf::pdf_length(input_file)

  qpdf::pdf_subset(
    input = input_file,
    pages = seq(2, len),
    output = output_file
  )

  if (exists("temp_file")) suppressWarnings(file.remove(temp_file))

  invisible(NULL)
}
