# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)

source(here::here("R", "quarto-post-render-common.R"))

# Copy and rename the PDF file (if exists) to `output_dir_pdf` folder -----

pdf_file <- list.files(output_dir_pdf, full.names = TRUE, pattern = "\\.pdf$")

if (length(pdf_file) == 1) {
  rutils:::copy_file(pdf_file, file.path(output_dir_pdf, "index.pdf"))
  rutils:::copy_file(pdf_file, file.path(output_dir_html, "index.pdf"))
  rutils:::delete_file(pdf_file)
}

# Copy TeX file (if exists) to `output_dir_pdf` folder -----

tex_file <- list.files(here::here(), full.names = TRUE, pattern = ".tex$")

if (length(tex_file) == 1) {
  rutils:::copy_file(tex_file, file.path(output_dir_pdf, "index.tex"))
}

# Delete unnecessary files and folders -----

rutils:::clean_quarto_mess(
  file = NULL,
  dir = c(".temp", "index_cache", "index_files"),
  ext = c("aux", "bbx", "cbx", "dbx", "fdb_latexmk", "lbx", "loa", "log",
          "otf", "pdf", "tex", "xdv"),
  ignore = NULL,
  wd = here::here()
)
