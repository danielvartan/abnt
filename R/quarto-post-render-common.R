# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(yaml, quietly = TRUE)

# Set variables -----

quarto_yml_path <- here::here("_quarto.yml")
quarto_yml_html_path <- here::here("_quarto-html.yml")
quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")

quarto_yml_vars <- yaml::read_yaml(quarto_yml_path)
quarto_yml_html_vars <- yaml::read_yaml(quarto_yml_html_path)
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)

github_user <- "danielvartan"
project_name <- here::here() |> basename() # rstudioapi::getActiveProject()

# Create output folders if they don't exist -----

output_dir_pdf <- here::here(quarto_yml_pdf_vars$project$`output-dir`)
output_dir_html <- here::here(quarto_yml_html_vars$project$`output-dir`)

for (i in c(output_dir_html, output_dir_pdf)) {
  if (!checkmate::test_directory_exists(i)) dir.create(i)
}
