# Load Packages -----

library(beepr)
library(here)
library(fs)
library(magrittr)
library(quartor) # github.com/danielvartan/quartor
library(showtext)
library(stringr)
library(yaml)

# Delete Images Folder to `qmd` -----

dir_path <- here("qmd", "images")

if (dir.exists(dir_path)) {
  dir_path |> dir_delete()
}

# Create Output Folder If It Doesn't Exist -----

output_dir <-
  here("_quarto.yml") |>
  read_yaml() |>
  extract2("project") |>
  extract2("output-dir") |>
  here()

if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Stop `showtext` -----

showtext_auto(enable = FALSE)

# Copy and Rename the PDF file (If Exists) to `output_dir` Folder -----

pdf_file <-
  output_dir |>
  list.files(
    full.names = TRUE,
    pattern = "\\.pdf$"
  )

if (length(pdf_file) == 1) {
  pdf_file |>
    file_copy(
      new_path = output_dir |> file.path("index.pdf"),
      overwrite = TRUE
    )

  pdf_file |>
    file_copy(
      new_path = here("docs", "abnt.pdf"),
      overwrite = TRUE
    )

  file_delete(pdf_file)
}

# Copy and Rename the TeX file (If Exists) to `output_dir` Folder -----

tex_file <-
  here() |>
  list.files(
    full.names = TRUE,
    pattern = "\\.tex$"
  )

if (length(tex_file) == 1) {
  tex_file |>
    file_copy(
      new_path = output_dir |> file.path("index.tex"),
      overwrite = TRUE
    )
}

# Copy Other Files (If They Exist) to `output_dir` Folder -----

files <- c(
  "index.log",
  "index.bbl",
  "index.blg"
)

for (i in files) {
  i_file <-
    here() |>
    list.files(
      full.names = TRUE,
      pattern = str_escape(i)
    )

  if (length(i_file) == 1) {
    i_file |>
      file_copy(
        new_path = output_dir |>
          file.path(
            str_replace(i, "index", "abnt")
          ),
        overwrite = TRUE
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
  ) |>
    append(
      x = _,
      list.dirs("qmd")[-1]
    ),
  ext = c(
    "aux",
    "bbx",
    "bcf-SAVE-ERROR",
    "cbx",
    "dbx",
    "fdb_latexmk",
    "lbx",
    "loa",
    "log",
    "otf",
    "pdf",
    "scss",
    "tex",
    "xdv"
  ),
  ignore = NULL,
  wd = here()
)

# Check If the Script Ran Successfully -----

beep(1)

Sys.sleep(3)
