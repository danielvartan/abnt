## Based on https://github.com/hadley/r4ds/blob/main/_common.R

set.seed(2023)

require(checkmate, quietly = TRUE)
require(here)
require(knitr, quietly = TRUE)
require(ggplot2, quietly = TRUE)

source(here::here("R/quarto_status.R"))

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  fig.show = "hold"
)

# From <https://stackoverflow.com/questions/74193542/
#       quarto-dataframe-printing-and-styling>

knit_print.data.frame = function(x, ...) {
  res <- paste(
    c(
      "",
      "",
      knitr::kable(x, digits = 3) |> kableExtra::kable_styling()
    ),
    collapse = "\n"
    )

  knitr::asis_output(res)
}

registerS3method(
  "knit_print",
  "data.frame",
  knit_print.data.frame,
  envir = asNamespace("knitr")
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

ggplot2::theme_set(ggplot2::theme_gray(12))
