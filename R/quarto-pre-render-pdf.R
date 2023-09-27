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

find_and_apply <- function(wd = here::here(),
                           dir = c("", "qmd"),
                           pattern = "\\.qmd$",
                           ignore = NULL,
                           begin_tag = "%#%$ title begin %#%$",
                           end_tag = "%#%$ title end %#%$",
                           fun = stringr::str_to_upper) {
  checkmate::assert_string(wd)
  checkmate::assert_directory_exists(wd, access = "rw")
  checkmate::assert_character(dir)
  for (i in dir) checkmate::assert_directory_exists(file.path(wd, i))
  checkmate::assert_string(pattern)
  checkmate::assert_string(ignore, null.ok = TRUE)
  checkmate::assert_string(begin_tag)
  checkmate::assert_string(end_tag)
  checkmate::assert_function(fun)

  dir |>
    lapply(function(x) {
      setdiff(
        list.files(file.path(wd, x), full.names = TRUE),
        list.dirs(file.path(wd, x), recursive = FALSE, full.names = TRUE)
      ) |>
        stringr::str_subset(pattern)
    }) |>
    unlist() |>
    lapply(function(x) {
      content <- readLines(here::here(x))
      begin_index <- grep(begin_tag, x = content)
      end_index <- grep(end_tag, x = content)

      content[inbetween_integers(begin_index, end_index)] |>
        fun() |>
        writeLines(x)
    })
}

# Includes chapter 1 content in `_index-pdf.qmd` ----------

writeLines("", here::here("qmd", "_index-pdf.qmd"))

content <- readLines(here::here("qmd", "introduction.qmd"))
begin_section_index <- grep("%#%$ clip 1 begin  %#%$", x = content)
chapter_end_index <- length(content)
clipped_content <- content[seq(begin_section_index, chapter_end_index)]

clipped_content |> writeLines(here::here("qmd", "_index-pdf.qmd"))

# Change index chapter title ----------

chapter_path <- here::here("index.qmd")
content <- readLines(here::here("index.qmd"))
title_begin_index <- grep("%#%$ title begin %#%$", x = content)
title_end_index <- grep("%#%$ title end %#%$", x = content)
chapter_end_index <- grep("%#%$ chapter end %#%$", x = content)

new_content <-
  content[seq(1, title_begin_index)] |>
  c("# INTRODUCTION") |>
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
  c(
    "# REFERENCES [^1] {.unnumbered}",
    "",
    "[^1]: According to the APA style - American Psychological Association."
  ) |>
  append(content[seq(title_end_index, chapter_end_index)])

new_content |> writeLines(chapter_path)

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
