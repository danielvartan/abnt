suppressMessages(suppressWarnings(library(here)))

source(here::here("R/remove_pdf_cover.R"))

remove_pdf_cover(output_dir = here::here("preview"))
