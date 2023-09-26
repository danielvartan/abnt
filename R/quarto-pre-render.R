# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)

rutils:::bbt_write_quarto_bib(
  bib_file = here::here("references.json"),
  dir = here::here(c("", "qmd", "tex")),
  pattern = c("\\.qmd$|\\.tex$")
)
