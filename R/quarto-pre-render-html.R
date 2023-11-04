# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# lybrary(yaml)

source(here::here("R", "quarto-pre-render-common.R"))

# Update Quarto files -----

swap_list <- list(
  index_title = list(
    from = here::here("index.qmd"),
    to = here::here("index.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = "# Welcome {.unnumbered}",
    quarto_render = FALSE
  )
)

for (i in swap_list) {
  rutils:::swap_value_between_files(
    from = i$from,
    to = i$to,
    begin_tag = i$begin_tag,
    end_tag = i$end_tag,
    value = i$value,
    quarto_render = i$quarto_render,
    cite_method = "biblatex"
  )
}

# Copy images folder to `./qmd` (solve issues related to relative paths)
# -----

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

# Add/change environment variables -----

quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)
env_vars_file_path <- here::here("_variables.yml")

if (!checkmate::test_file_exists(env_vars_file_path)) {
  rutils:::create_file(env_vars_file_path)
}

env_vars_file_vars <- yaml::read_yaml(env_vars_file_path)

new_vars <- list(
  # variable = value
  format = "html"
)

for (i in names(new_vars)) {
  if (!i %in% names(env_vars_file_vars)) {
    x <- list(x = new_vars[[i]])
    names(x) <- i
    env_vars_file_vars <- append(env_vars_file_vars, x)
  } else {
    env_vars_file_vars[[i]] <- new_vars[[i]]
  }
}

env_vars_file_vars |> yaml::write_yaml(env_vars_file_path)
