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

stringr::str_to_sentence()

# Change index chapter title ----------

chapter_path <- here::here("index.qmd")
content <- readLines(path)
title_begin_index <- grep("%#%$ title begin %#%$", x = content)
title_end_index <- grep("%#%$ title end %#%$", x = content)
chapter_end_index <- length()

new_content <-
  content[seq(1, title_begin_index)] |>
  c("# Welcome") |>
  append(content[seq(title_end_index, chapter_end_index)])

new_content |> writeLines(chapter_path)

# Change reference chapter title ----------

chapter_path <- here::here("qmd", "references.qmd")
content <- readLines(chapter_path)
title_begin_index <- grep("%#%$ title begin %#%$", x = content)
title_end_index <- grep("%#%$ title end %#%$", x = content)
chapter_end_index <- length(content)

new_content <-
  content[seq(1, title_begin_index)] |>
  c("# References {.unnumbered}") |>
  append(content[seq(title_end_index, chapter_end_index)])

new_content |> writeLines(chapter_path)

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
