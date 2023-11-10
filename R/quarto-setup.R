## Based on <https://github.com/hadley/r4ds/blob/main/_common.R>.

# library(checkmate, quietly = TRUE)
# library(extrafont)
# library(here, quietly = TRUE)
# library(kableExtra, quietly = TRUE)
# library(knitr, quietly = TRUE)
# library(ggplot2, quietly = TRUE)
# lybrary(yaml)

# Load libraries

library(dplyr, quietly = FALSE, verbose = FALSE)
library(ggplot2, quietly = FALSE, verbose = FALSE)

# Set variables -----

set.seed(2023)
env_vars <- yaml::read_yaml(here::here("_variables.yml"))
base_size <- 10

env_vars$base_size <- base_size

# Load fonts -----

extrafont::font_import(
  paths = NULL,
  recursive = TRUE,
  prompt = FALSE,
  pattern = paste0(
    "^(?i)", stringr::str_extract(env_vars$sansfont, "(?i)^.[a-zÀ-ÿ]+"), "*"
  )
  ) |>
  rutils:::shush()

extrafont::loadfonts(quiet = TRUE)

# Set knitr -----

knitr::clean_cache()

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  root.dir = here::here()
)

# Set general options -----

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  # cli.num_colors = 0,
  # cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# Set `ggplot2` -----

if (env_vars$format == "pdf") {
  ggplot2::theme_set(
    ggplot2::theme_gray(
      base_size = base_size,
      base_family = env_vars$sansfont,
      base_line_size = base_size / 22, # `ggplot2::theme_gray` default
      base_rect_size = base_size / 22 # `ggplot2::theme_gray` default
    )
  )
}

if (env_vars$format == "html") {
  ggplot2::theme_set(
    ggplot2::theme_gray(
      base_size = base_size,
      base_family = env_vars$sansfont,
      base_line_size = base_size/22, # `ggplot2::theme_gray` default
      base_rect_size = base_size/22 # `ggplot2::theme_gray` default
    )
  )
}
