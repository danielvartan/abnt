# library(checkmate)
# library(here)
# library(lubridate)
# library(rutils)
# lybrary(stringr)
# lybrary(yaml)

# Unfreeze documents -----

quarto_yml_path <- here::here("_quarto.yml")
quarto_yml_vars <- yaml::read_yaml(quarto_yml_path)

unfreeze_files <- c(
  here::here("index.qmd")
)

if (!is.null(quarto_yml_vars$execute$freeze)) {
  if (as.character(quarto_yml_vars$execute$freeze) %in% c("TRUE", "auto")) {
    for (i in unfreeze_files) rutils:::unfreeze_quarto_file(i)
  }
}

# Create environment variables -----

quarto_yml_path <- here::here("_quarto.yml")
quarto_yml_html_path <- here::here("_quarto-html.yml")
quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")
quarto_yml_extension_path <- here::here("_extensions", "abnt", "_extension.yml")

quarto_yml_vars <- yaml::read_yaml(quarto_yml_path)
quarto_yml_html_vars <- yaml::read_yaml(quarto_yml_html_path)
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)
quarto_yml_extension_vars <- yaml::read_yaml(quarto_yml_extension_path)

env_vars_file_path <- here::here("_variables.yml")

if (!checkmate::test_file_exists(env_vars_file_path)) {
  rutils:::create_file(env_vars_file_path)
}

env_vars <- list()

var_files <- c(
  "quarto_yml_vars", "quarto_yml_html_vars", "quarto_yml_pdf_vars",
  "quarto_yml_extension_vars"
)

var_patterns <- c(
  "academic-title", "academic-degree", "area-of-concentration", "author",
  "^book.url$", "cosupervisor", "date", "keyword", "language", "location",
  "mainfont", "monofont", "program", "sansfont", "school", "supervisor",
  "title","type-of-work", "university", "version-note"
)

for (i in var_files){
  values <- unlist(get(i))

  for (j in var_patterns) {
    test <- grepl(j, names(values))

    if (any(test, na.rm = TRUE)) {
      if (grepl("\\.", j)) {
        j <- sub("^.+\\.", "", j)

        if (grepl("\\$$", j)) j <- sub("\\$$", "", j)
      }

      if (j == "date") {
        if (!grepl("\\d{4}", values[test][1]) &&
            !any(values[test][1] == "today", na.rm = TRUE)) {
          next()
        } else if (any(values[test][1] == "today", na.rm = TRUE)) {
          env_vars[[j]] <- as.character(Sys.Date())
          env_vars[["year"]] <- as.character(lubridate::year(Sys.Date()))
          next()
        } else {
          env_vars[["year"]] <-
            as.character(stringr::str_extract(values[test][1], "\\d{4}"))
        }
      }

      if (j == "language" &&
          !grepl("^[a-z]{2}$|^[a-z]{2}\\-[a-zA-Z]{2}$", values[test][1])) {
        next()
      }

      if (j == "author") {
        if (!grepl(" ", values[test][1])) {
          env_vars[["author-surname"]] <- values[test][1]
          env_vars[["author-given-name"]] <- values[test][1]
        } else{
          env_vars[["author-surname"]] <-
            stringr::str_extract(values[test][1], "(?i)(?<= )[a-zÀ-ÿ]+$")

          env_vars[["author-given-name"]] <-
            stringr::str_extract(values[test][1], "^(?i)[a-zÀ-ÿ]+(?= )")

          env_vars[["author-minus-surname"]] <-
            stringr::str_extract(values[test][1], "^.+(?= )")
        }

        env_vars[["author-initials"]] <-
          rutils:::extract_initials(values[test][1])
      }

      env_vars[[j]] <- values[test][1] |> unname()
    }
  }
}

env_vars |> yaml::write_yaml(env_vars_file_path)

# Scan Quarto files for citations and add them to references.bib -----

quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)

if (isTRUE(quarto_yml_pdf_vars$format$`abnt-pdf`$zotero)) {
  rutils:::bbt_write_quarto_bib(
    bib_file = "references.bib",
    dir = c("", "qmd", "tex"),
    pattern = c("\\.qmd$|\\.tex$"),
    wd = here::here()
  )
}
