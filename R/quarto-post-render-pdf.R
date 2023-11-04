# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(yaml, quietly = TRUE)

source(here::here("R", "quarto-post-render-common.R"))

# Copy PDF file (if exists) to `docs` folder -----

pdf_file <- list.files(output_dir_pdf, full.names = TRUE, pattern = "\\.pdf$")

if (length(pdf_file) == 1) {
  rutils:::copy_file(pdf_file, file.path(pdf_dir, "index.pdf"))
  rutils:::copy_file(pdf_file, file.path(output_dir_html, "index.pdf"))

  list.files(here::here(), full.names = TRUE, pattern = ".tex$") |>
    rutils:::copy_file(file.path("pdf", "index.tex"))
}

# Delete unnecessary files and folders -----

rutils:::clean_quarto_mess(
  wd = here::here(),
  file = NULL,
  dir = c(".temp", "index_cache", "index_files"),
  ext = c("aux", "bbx", "cbx", "cls", "dbx", "fdb_latexmk", "lbx", "loa",
          "log", "pdf", "scss", "tex", "xdv"),
  keep = NULL,
  quarto_yaml = NULL
)
