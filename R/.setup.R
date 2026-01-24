# Load Packages -----

library(here)
library(ggplot2)
library(knitr)
library(magrittr)
library(ragg)
library(showtext)
library(sysfonts)

# Set General Options -----

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  scipen = 10,
  digits = 10,
  stringr.view_n = 6,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# Set Variables -----

set.seed(2026)

# Set `knitr`` -----

clean_cache() |> suppressMessages()

opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  root.dir = here::here(),
  dev = "ragg_png",
  fig.showtext = TRUE
)

# Set `showtext` -----

here("ttf") |> font_paths()

font_add(
  family = "notosans",
  regular = here("ttf", "notosans-regular.ttf"),
  bold = here("ttf", "notosans-bold.ttf"),
  italic = here("ttf", "notosans-italic.ttf"),
  bolditalic = here("ttf", "notosans-bolditalic.ttf")
)

font_add(
  family = "notosansmono",
  regular = here("ttf", "notosansmono-regular.ttf"),
  bold = here("ttf", "notosansmono-bold.ttf")
)

showtext_auto()

# Set `ggplot2` -----

theme_set(
  theme_bw() +
    theme(
      text = element_text(
        color = "black",
        family = "notosans",
        face = "plain"
      ),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      legend.frame = element_blank(),
      legend.ticks = element_line(color = "white")
    )
)
