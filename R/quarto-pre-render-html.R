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

rutils:::find_between_tags_and_apply(
  wd = here::here(),
  dir = c("", "qmd"),
  pattern = "\\.qmd$",
  ignore = "^_",
  begin_tag = "%:::% .common h1 begin %:::%",
  end_tag = "%:::% .common h1 end %:::%",
  fun = function(x) {
    pattern <- "(?<=# )(.*?)(?= \\{)|(?<=# ).+"
    old_string <- stringr::str_extract_all(x, pattern)
    new_string <- stringr::str_to_sentence(old_string)

    stringr::str_replace_all(x, pattern, new_string)
  }
) |>
  rutils:::shush()

# Update Quarto files ----------

update_par_pre_render_pdf <- list(
  index_title = list(
    from = here::here("index.qmd"),
    to = here::here("index.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = "# Welcome {.unnumbered}"
  ),
  reference_title = list(
    from = here::here("qmd", "references.qmd"),
    to =here::here("qmd", "references.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = "# References {.unnumbered}"
  )
)

for (i in update_par_pre_render_pdf) {
  rutils:::update_quarto_file(
    from = i$from,
    to = i$to,
    begin_tag = i$begin_tag,
    end_tag = i$end_tag,
    value = i$value,
    wd = here::here()
  )
}

# Copy images folder to `./qmd` (solve issues related to relative paths)
# ----------

dir_path <- here::here("qmd", "images")

if (!checkmate::test_directory_exists(dir_path)) {
  dir.create(dir_path) |> invisible()
}

for (i in rutils:::list_files(here::here("images"), full.names = TRUE)) {
  rutils:::copy_file(
    from = i,
    to = file.path(dir_path, basename(i))
    )
}

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
