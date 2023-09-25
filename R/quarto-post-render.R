suppressMessages(suppressWarnings(library(here)))
library(yaml)

source(here::here("R/clean_quarto_mess.R"))
source(here::here("R/list_files_by_pattern.R"))
source(here::here("R/remove_pdf_cover.R"))

quarto_vars <- yaml::read_yaml("_quarto.yml")
output_path <- here::here(quarto_vars$project$`output-dir`)
file <- list_files_by_pattern(output_path, pattern = ".pdf$")

remove_pdf_cover(file, here::here("docs/preview.pdf"))
clean_quarto_mess()
