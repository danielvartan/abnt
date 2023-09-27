# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(stringr)
# lybrary(yaml)

# Scan Quarto files for citations and add them to references.json ----------

rutils:::bbt_write_quarto_bib(
  wd = here::here(),
  bib_file = "references.json",
  dir = c("", "qmd"),
  pattern = c("\\.qmd$")
)

# Transform titles ----------

rutils:::find_and_apply(
  wd = here::here(),
  dir = c("", "qmd"),
  pattern = "\\.qmd$",
  ignore = NULL,
  begin_tag = "&&& title begin &&&",
  end_tag = "&&& title end &&&",
  fun = stringr::str_to_sentence
)

# Change index chapter title ----------

chapter_path <- here::here("index.qmd")

rutils:::transform_value_between_tags(
  x = readLines(chapter_path),
  fun = "# Welcome {.unnumbered}",
  begin_tag = "&&& title begin &&&",
  end_tag = "&&& title end &&&"
)|>
  writeLines(chapter_path)

# Change reference chapter title ----------

chapter_path <- here::here("qmd", "references.qmd")

rutils:::transform_value_between_tags(
  x = readLines(chapter_path),
  fun = "# References {.unnumbered}",
  begin_tag = "&&& title begin &&&",
  end_tag = "&&& title end &&&"
)|>
  writeLines(chapter_path)

# Create environment variables ----------

env_vars_file <- here::here("_variables.yml")

if (!checkmate::test_file_exists(env_vars_file)) {
  rutils:::create_file(env_vars_file)
}

env_vars <- list(
  # variable = value
  format = "html"
)

env_vars |> yaml::write_yaml(env_vars_file)
