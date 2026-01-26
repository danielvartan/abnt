# Load Packages -----

library(fs)
library(here)
library(quartor) # github.com/danielvartan/quartor

# Copy Images Folder to `qmd` -----

# Solve issues with relative paths.

dir_path <- here("qmd", "images")

if (!dir.exists(dir_path)) {
  dir.create(dir_path) |> invisible()
}

for (i in dir_ls(here("images"), type = "file")) {
  file_copy(
    path = i,
    new_path = file.path(dir_path, basename(i)),
    overwrite = TRUE
  )
}

# Update Quarto Files -----

swap_list <- list(
  title_page = list(
    from = here("qmd", "title-page.qmd"),
    to = here("tex", "include-in-header.tex"),
    begin_tag = "%:::% title-page body begin %:::%",
    end_tag = "%:::% title-page body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  cataloging_record = list(
    from = here("qmd", "cataloging-record.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% cataloging-record body begin %:::%",
    end_tag = "%:::% cataloging-record body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  errata_reference = list(
    from = here("qmd", "errata.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% errata reference begin %:::%",
    end_tag = "%:::% errata reference end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  errata_body = list(
    from = here("qmd", "errata.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% errata body begin %:::%",
    end_tag = "%:::% errata body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  approval_sheet = list(
    from = here("qmd", "approval-sheet.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% approval-sheet body begin %:::%",
    end_tag = "%:::% approval-sheet body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  inscription_body = list(
    from = here("qmd", "inscription.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% inscription body begin %:::%",
    end_tag = "%:::% inscription body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  acknowledgments_body = list(
    from = here("qmd", "acknowledgments.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% acknowledgments body begin %:::%",
    end_tag = "%:::% acknowledgments body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  epigraph_body = list(
    from = here("qmd", "epigraph.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% epigraph body begin %:::%",
    end_tag = "%:::% epigraph body end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  vernacular_abstract_reference = list(
    from = here("qmd", "vernacular-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract reference begin %:::%",
    end_tag = "%:::% vernacular-abstract reference end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  vernacular_abstract_body = list(
    from = here("qmd", "vernacular-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract body begin %:::%",
    end_tag = "%:::% vernacular-abstract body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  vernacular_abstract_keywords = list(
    from = here("qmd", "vernacular-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% vernacular-abstract keywords begin %:::%",
    end_tag = "%:::% vernacular-abstract keywords end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  foreign_abstract_reference = list(
    from = here("qmd", "foreign-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract reference begin %:::%",
    end_tag = "%:::% foreign-abstract reference end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  foreign_abstract_body = list(
    from = here("qmd", "foreign-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract body begin %:::%",
    end_tag = "%:::% foreign-abstract body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  foreign_abstract_keywords = list(
    from = here("qmd", "foreign-abstract.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% foreign-abstract keywords begin %:::%",
    end_tag = "%:::% foreign-abstract keywords end %:::%",
    value = NULL,
    quarto_render = FALSE
  ),
  list_of_abbreviations = list(
    from = here("qmd", "list-of-abbreviations.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% list-of-abbreviations body begin %:::%",
    end_tag = "%:::% list-of-abbreviations body end %:::%",
    value = NULL,
    quarto_render = TRUE
  ),
  list_of_symbols = list(
    from = here("qmd", "list-of-symbols.qmd"),
    to = here("tex", "include-before-body.tex"),
    begin_tag = "%:::% list-of-symbols body begin %:::%",
    end_tag = "%:::% list-of-symbols body end %:::%",
    value = NULL,
    quarto_render = TRUE
  )
)

for (i in swap_list) {
  swap_value_between_files(
    from = i$from,
    to = i$to,
    begin_tag = i$begin_tag,
    end_tag = i$end_tag,
    value = i$value,
    quarto_render = i$quarto_render,
    cite_method = "biblatex"
  )
}
