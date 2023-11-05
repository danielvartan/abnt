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

# Add/update environment variables -----

var_list <- list(
  # variable = value
  format = "html"
)

rutils:::add_or_update_env_var(
  var = var_list,
  yml_file = here::here("_variables.yml")
)
