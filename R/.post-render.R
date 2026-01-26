# Load Packages -----

library(beepr)
library(here)
library(fs)
library(magrittr)
library(quartor) # github.com/danielvartan/quartor
library(showtext)
library(stringr)
library(yaml)

# Stop `showtext` -----

showtext_auto(enable = FALSE)

# Delete Images Folder from `qmd` -----

dir_path <- here("qmd", "images")

if (dir.exists(dir_path)) {
  dir_path |> dir_delete()
}

# Get Output Folder from `_quarto.yml` -----

output_dir <-
  here("_quarto.yml") |>
  read_yaml() |>
  extract2("project") |>
  extract2("output-dir") |>
  here()

if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Copy and Rename the PDF file (If Exists) -----

pdf_file <-
  output_dir |>
  dir_ls(
    type = "file",
    regexp = "\\.pdf$"
  ) |>
  magrittr::extract(1)

if (length(pdf_file) == 1) {
  pdf_file |>
    file_copy(
      new_path = here("docs", "abnt.pdf"),
      overwrite = TRUE
    )

  pdf_file |>
    file_move(
      new_path = output_dir |> file.path("index.pdf")
    )
}

# Copy and Rename the TeX file (If Exists) to `output_dir` Folder -----

tex_file <-
  here() |>
  dir_ls(
    type = "file",
    regexp = "\\.tex$"
  ) |>
  magrittr::extract(1)

if (length(tex_file) == 1) {
  tex_file |>
    file_copy(
      new_path = output_dir |> file.path("index.tex"),
      overwrite = TRUE
    )
}

# Copy Other Files (If They Exist) to `output_dir` Folder -----

files <- c(
  "index.aux",
  "index.bbl",
  "index.bcf",
  "index.blg",
  "index.idx",
  "index.ilg",
  "index.ind",
  "index.lof",
  "index.log",
  "index.lot",
  "index.pdf",
  "index.run.xml",
  "index.tex"
)

for (i in files) {
  i_file <-
    here() |>
    dir_ls(
      type = "file",
      regexp = paste0(str_escape(i), "$")
    )

  if (length(i_file) == 1) {
    i_file |>
      file_move(
        new_path = output_dir |> file.path(i)
      )
  }
}

# Delete Unnecessary Files and Folders -----

quartor:::clean_quarto_mess(
  file = c(".luarc.json"),
  dir = c(
    ".temp",
    "index_cache",
    "index_files",
    "site_libs"
  ),
  ext = c(
    "aux",
    "bbl",
    "bbx",
    "bcf-SAVE-ERROR",
    "bcf",
    "blg",
    "cbx",
    "dbx",
    "fdb_latexmk",
    "idx",
    "ilg",
    "ind",
    "lbx",
    "loa",
    "lof",
    "log",
    "lot",
    "otf",
    "pdf",
    "scss",
    "tex",
    "toc",
    "xdv",
    "xml"
  ),
  ignore = NULL,
  wd = here()
)

# Check If the Script Ran Successfully -----

beep(1)

Sys.sleep(3)
