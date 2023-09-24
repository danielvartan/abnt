# See <https://github.com/paleolimbot/rbbt>.

suppressMessages(suppressWarnings(library(here)))

source(here::here("R/bbt_write_quarto_bib.R"))

bbt_write_quarto_bib(
  bib_file = here::here("references.json"),
  dir = here::here(c("", "qmd", "tex")),
  pattern = c("\\.qmd$|\\.tex$")
)
