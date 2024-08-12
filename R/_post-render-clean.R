# library(rutils, quietly = TRUE)
# library(here, quietly = TRUE)

dir_list <-
  c(".temp", "index_cache", "index_files") |>
  append(x = _, list.dirs("qmd")[-1])

rutils:::clean_quarto_mess(
  file = NULL,
  dir = dir_list,
  ext = c(
    "aux", "bbx", "cbx", "dbx", "fdb_latexmk", "lbx", "loa", "log", "pdf",
    "scss", "tex", "xdv"
  ),
  ignore = NULL,
  wd = here::here()
)
