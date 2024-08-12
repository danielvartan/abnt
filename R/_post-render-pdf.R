# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)

source(here::here("R", "_post-render-common.R"))

# Copy and rename the PDF file (if exists) to `output_dir_pdf` folder -----

pdf_file <- list.files(output_dir_pdf, full.names = TRUE, pattern = "\\.pdf$")

if (length(pdf_file) == 1) {
  rutils:::copy_file(pdf_file, file.path(output_dir_pdf, "index.pdf"))
  rutils:::copy_file(pdf_file, file.path(output_dir_html, "index.pdf"))
  rutils:::delete_file(pdf_file)
}

# Copy and rename the TeX file (if exists) to `output_dir_pdf` folder -----

tex_file <- list.files(here::here(), full.names = TRUE, pattern = ".tex$")

if (length(tex_file) == 1) {
  rutils:::copy_file(tex_file, file.path(output_dir_pdf, "index.tex"))
}

# Delete unnecessary files and folders -----

source(here::here("R", "_post-render-clean.R"))
