# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(yaml, quietly = TRUE)

# Set variables ----------

quarto_yml_path <- here::here("_quarto.yml")
quarto_yml_html_path <- here::here("_quarto-html.yml")
quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")

quarto_yml_vars <- yaml::read_yaml(quarto_yml_path)
quarto_yml_html_vars <- yaml::read_yaml(quarto_yml_html_path)
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)

github_user <- "danielvartan"
project_name <- here::here() |> basename() # rstudioapi::getActiveProject()

# Set output variables and create output folders if they don't exist ----------

output_dir_html <- here::here(quarto_yml_html_vars$project$`output-dir`)
output_dir_pdf <- here::here(quarto_yml_pdf_vars$project$`output-dir`)

for (i in c(output_dir_html, output_dir_pdf)) {
  if (!checkmate::test_directory_exists(i)) dir.create(i) |> invisible()
}

# Copy PDF file (if exists) to `docs` folder ----------

pdf_file <- list.files(output_dir_pdf, full.names = TRUE, pattern = ".pdf$")

if (length(pdf_file) == 1) {
  rutils:::remove_pdf_cover(pdf_file)

  rutils:::copy_file(pdf_file, file.path("pdf", "index.pdf"))
  rutils:::copy_file(pdf_file, file.path(output_dir_html, "index.pdf"))

  list.files(here::here(), full.names = TRUE, pattern = ".tex$") |>
    rutils:::copy_file(file.path("pdf", "index.tex"))
}

# Delete unnecessary files and folders ----------

rutils:::clean_quarto_mess(
  wd = here::here(),
  file = NULL,
  dir = c(".temp", "index_files"),
  ext = c("aux", "cls", "loa", "log", "pdf", "tex"),
  keep = NULL,
  quarto_yaml = NULL
)
