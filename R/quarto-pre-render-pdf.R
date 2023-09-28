# library(here)
# library(rmarkdown)
# library(rutils)
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
    new_string <- stringr::str_to_upper(old_string)

    stringr::str_replace_all(x, pattern, new_string)
  }
) |>
  rutils:::shush()

# Includes chapter 1 content in `_index-pdf.qmd` ----------

content <- readLines(here::here("qmd", "introduction.qmd"))
begin_clip_index <- grep("%:::% chapter-1 clip begin %:::%", x = content)
end_clip_index <- grep("%:::% chapter-1 clip end %:::%", x = content)

content[seq(begin_clip_index, end_clip_index)] |>
  writeLines(here::here("qmd", "_index-pdf.qmd"))

# Update Quarto files ----------

update_par_pre_render_pdf <- list(
  index_h1 = list(
    from = here::here("index.qmd"),
    to = here::here("index.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = "# INTRODUCTION"
  ),
  reference_h1 = list(
    from = here::here("qmd", "references.qmd"),
    to =here::here("qmd", "references.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = c(
      "# REFERENCES [^1] {.unnumbered}",
      "",
      "[^1]: According to the APA style - American Psychological Association."
    )
  ),
  title_page = list(
    from = here::here("qmd/_config.qmd"),
    to = here::here("tex/include-in-header.tex"),
    begin_tag = "%:::% title-page body begin %:::%",
    end_tag = "%:::% title-page body end %:::%",
    value = NULL
  ),
  errata_body = list(
    from = here::here("qmd/errata.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% errata body begin %:::%",
    end_tag = "%:::% errata body end %:::%",
    value = NULL
  ),
  approval_sheet_header = list(
    from = here::here("qmd/_config.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% approval-sheet header begin %:::%",
    end_tag = "%:::% approval-sheet header end %:::%",
    value = NULL
  ),
  inscription_body = list(
    from = here::here("qmd/inscription.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% inscription body begin %:::%",
    end_tag = "%:::% inscription body end %:::%",
    value = NULL
  ),
  acknowledgments_body = list(
    from = here::here("qmd/acknowledgments.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% acknowledgments body begin %:::%",
    end_tag = "%:::% acknowledgments body end %:::%",
    value = NULL
  ),
  epigraph_body = list(
    from = here::here("qmd/epigraph.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% epigraph body begin %:::%",
    end_tag = "%:::% epigraph body end %:::%",
    value = NULL
  ),
  vernacular_abstract_body = list(
    from = here::here("qmd/vernacular-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract body begin %:::%",
    end_tag = "%:::% vernacular-abstract body end %:::%",
    value = NULL
  ),
  foreign_abstract = list(
    from = here::here("qmd/foreign-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract body begin %:::%",
    end_tag = "%:::% foreign-abstract body end %:::%",
    value = NULL
  ),
  list_of_abbreviations = list(
    from = here::here("qmd/list-of-abbreviations.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-abbreviations body begin %:::%",
    end_tag = "%:::% list-of-abbreviations body end %:::%",
    value = NULL
  ),
  list_of_symbols = list(
    from = here::here("qmd/list-of-symbols.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-symbols body begin %:::%",
    end_tag = "%:::% list-of-symbols body end %:::%",
    value = NULL
  ),
  list_of_terms = list(
    from = here::here("qmd/list-of-terms.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-terms body begin %:::%",
    end_tag = "%:::% list-of-terms body end %:::%",
    value = NULL
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
