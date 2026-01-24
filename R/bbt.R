# Load Packages -----

library(here)
library(quartor) # github.com/danielvartan/quartor

# Run `rbbt` -----

#' **IMPORTANT**
#'
#' Uncheck the option "Apply title-casing to titles" in Zotero Better BibTeX
#' preferences (Edit > Settings > Better BibTeX > Miscellaneous).
#'
#' (2024-08-25)
#' This function should work with any version of BetterBibTeX (BBT) for Zotero.
#' Verify if @wmoldham PR was merged in the `rbbt` package (see issue #47
#' <https://github.com/paleolimbot/rbbt/issues/47>). If not, install `rbbt` from
#' @wmoldham fork `remotes::install_github("wmoldham/rbbt", force = TRUE)`.

bbt_write_quarto_bib(
  bib_file = here("references.bib"),
  dir = c(".", "qmd"),
  pattern = "\\.qmd$",
  wd = here()
)
