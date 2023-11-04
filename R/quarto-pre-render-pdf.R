# library(here)
# library(rutils)
# lybrary(yaml)

source(here::here("R", "quarto-pre-render-common.R"))

# Update Quarto files -----

swap_list <- list(
  index_h1 = list(
    from = here::here("index.qmd"),
    to = here::here("index.qmd"),
    begin_tag = "%:::% .common h1 begin %:::%",
    end_tag = "%:::% .common h1 end %:::%",
    value = "# Introduction",
    quarto_render = FALSE
  ),
  index_pdf = list(
    from = here::here("qmd/introduction.qmd"),
    to = here::here("qmd/_index-pdf.qmd"),
    begin_tag = "%:::% index pdf begin %:::%",
    end_tag = "%:::% index pdf end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  title_page = list(
    from = here::here("qmd/_config.qmd"),
    to = here::here("tex/include-in-header.tex"),
    begin_tag = "%:::% title-page body begin %:::%",
    end_tag = "%:::% title-page body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  cataloging_record = list(
    from = here::here("qmd/_config.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% cataloging-record body begin %:::%",
    end_tag = "%:::% cataloging-record body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  errata_body = list(
    from = here::here("qmd/errata.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% errata body begin %:::%",
    end_tag = "%:::% errata body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  approval_sheet_header = list(
    from = here::here("qmd/_config.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% approval-sheet header begin %:::%",
    end_tag = "%:::% approval-sheet header end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  inscription_body = list(
    from = here::here("qmd/inscription.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% inscription body begin %:::%",
    end_tag = "%:::% inscription body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  acknowledgments_body = list(
    from = here::here("qmd/acknowledgments.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% acknowledgments body begin %:::%",
    end_tag = "%:::% acknowledgments body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  epigraph_body = list(
    from = here::here("qmd/epigraph.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% epigraph body begin %:::%",
    end_tag = "%:::% epigraph body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  vernacular_abstract_reference = list(
    from = here::here("qmd/vernacular-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract reference begin %:::%",
    end_tag = "%:::% vernacular-abstract reference end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  vernacular_abstract_body = list(
    from = here::here("qmd/vernacular-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract body begin %:::%",
    end_tag = "%:::% vernacular-abstract body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  vernacular_abstract_keywords = list(
    from = here::here("qmd/vernacular-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract keywords begin %:::%",
    end_tag = "%:::% vernacular-abstract keywords end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  foreign_abstract_reference = list(
    from = here::here("qmd/foreign-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract reference begin %:::%",
    end_tag = "%:::% foreign-abstract reference end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  foreign_abstract_body = list(
    from = here::here("qmd/foreign-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract body begin %:::%",
    end_tag = "%:::% foreign-abstract body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  foreign_abstract_keywords = list(
    from = here::here("qmd/foreign-abstract.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract keywords begin %:::%",
    end_tag = "%:::% foreign-abstract keywords end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  list_of_abbreviations = list(
    from = here::here("qmd/list-of-abbreviations.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-abbreviations body begin %:::%",
    end_tag = "%:::% list-of-abbreviations body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  list_of_symbols = list(
    from = here::here("qmd/list-of-symbols.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-symbols body begin %:::%",
    end_tag = "%:::% list-of-symbols body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  list_of_terms = list(
    from = here::here("qmd/list-of-terms.qmd"),
    to = here::here("tex/include-before-body.tex"),
    begin_tag = "%:::% list-of-terms body begin %:::%",
    end_tag = "%:::% list-of-terms body end %:::%",
    value = NULL,
    quarto_render = TRUE
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
  format = "pdf"
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
