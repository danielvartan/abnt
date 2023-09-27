# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(stringr)
# lybrary(yaml)

# Scan Quarto files for citations and add them to references.json ----------

rutils:::bbt_write_quarto_bib(
  wd = here::here(),
  bib_file = "references.json",
  dir = c("", "qmd", "tex"),
  pattern = c("\\.qmd$|\\.tex$")
)

# Transform titles ----------
stringr::str_to_upper
rutils:::find_and_apply(
  wd = here::here(),
  dir = c("", "qmd"),
  pattern = "\\.qmd$",
  ignore = NULL,
  begin_tag = "&&& title begin &&&",
  end_tag = "&&& title end &&&",
  fun = function(x) {
    pattern <- "(?<=# )(.*?)(?= \\{)|(?<=# ).+"
    old_string <- stringr::str_extract_all(x, pattern)
    new_string <- stringr::str_to_upper(old_string)

    stringr::str_replace_all(x, pattern, new_string)
  }
)

# Includes chapter 1 content in `_index-pdf.qmd` ----------

content <- readLines(here::here("qmd", "introduction.qmd"))
begin_clip_index <- grep("&&& clip 1 begin &&&", x = content)
end_clip_index <- grep("&&& clip 1 end &&&", x = content)

content[seq(begin_clip_index, end_clip_index)] |>
  writeLines(here::here("qmd", "_index-pdf.qmd"))

# Change index chapter title ----------

chapter_path <- here::here("index.qmd")

rutils:::transform_value_between_tags(
  x = readLines(chapter_path),
  fun = "# INTRODUCTION",
  begin_tag = "&&& title begin &&&",
  end_tag = "&&& title end &&&"
)|>
  writeLines(chapter_path)

# Change reference chapter title ----------

chapter_path <- here::here("qmd", "references.qmd")

rutils:::transform_value_between_tags(
  x = readLines(chapter_path),
  fun = c(
    "# REFERENCES [^1] {.unnumbered}",
    "",
    "[^1]: According to the APA style - American Psychological Association."
  ),
  begin_tag = "&&& title begin &&& ",
  end_tag = "&&& title end &&& "
)|>
  writeLines(chapter_path)

# Create environment variables ----------

env_vars_file <- here::here("_variables.yml")

if (!checkmate::test_file_exists(env_vars_file)) {
  rutils:::create_file(env_vars_file)
}

env_vars <- list(
  # variable = value
  format = "pdf"
)

env_vars |> yaml::write_yaml(env_vars_file)
