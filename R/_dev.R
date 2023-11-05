# # For development use only (comment the code after use (Ctrl + Shift + C)).
#
# .rs.restartR()
# .libPaths()
# cffr::cff_validate()
# knitr::clean_cache()
# knitr:::webshot_available()
# lintr::use_lintr()
# lintr::lint_dir("R")
# normalizePath(readClipboard(), "/", mustWork = FALSE)
# renv::init()
# utils::install.packages("renv", dependencies = TRUE)
# renv:::renv_download_method()
# options(renv.download.override = utils::download.file)
# renv::equip()
# renv::activate()
# renv::deactivate()
# renv::status()
# renv::dependencies("R/quarto-setup.R")
# renv::install()
# renv::update()
# renv::restore()
# renv::snapshot()
# rutils:::bbt_scan_citation_keys()
# rutils:::bbt_write_quarto_bib()
# rutils:::set_quarto_speel_check()
# rutils:::gather_words_from_spell_check(pattern = "\\.qmd$|\\.Rmd$")
# rutils:::spell_check_quarto(pattern = "\\.qmd$|\\.Rmd$")
# rutils:::update_quarto_wordlist(pattern = "\\.qmd$|\\.Rmd$")
# rutils:::clean_quarto_mess()
# rutils:::quarto_status("drafting")
# spelling::spell_check_files("index.qmd")
# urlchecker::url_check()
# urlchecker::url_update()

# # Pandoc
#
# rutils:::object_pandoc_convert(
#   x =  rutils:::get_value_between_tags(
#     x = here::here("qmd/errata.qmd"),
#     begin_tag = "%:::% errata body begin %:::%",
#     end_tag = "%:::% errata body end %:::%"
#   )
# )

# # Quarto (see <https://quarto.org/docs/projects/quarto-projects.html>)
#
# source(here::here("R", "quarto-pre-render-pdf.R"))
# source(here::here("R", "quarto-pre-render-html.R"))
#
# quarto render
# quarto render --profile pdf
# quarto render --profile html
# quarto publish gh-pages

# TODO
#
# * Fix spacings (\baselineskip).
# * Fix SCSS. Mobile menu is appearing with white or transparent color.
# * Fix spacing between after titles (use Photoshop).
# * Fix quinary section.
# * Fix case changing in references titles.
# * Fix title page spacing.
# * Add figure using the ABNT format.
# * Add table using the ABNT format.
# * Add command tag sub function.
# * Fix references bookmarks.
# * Fix '\tightlist' settings.
# * Organize template code into tex files by section.
# * Fix title and table captions making the caption name (e.g., "Figure -")
#   become tabular.
# * Change table font sizes to be accordingly with figure font sizes.
# * Add code post-chapters and pre-appendices automatically.
# * Add numbers and letters before chapter's and appendices bookmarks.
# * Refactor code for creating ambient variables in
#   'quarto-pre-render-common.R' . Transform code into function and then add
#   it in the {rutils} package.
# * Add function to auto generate the visit date in the thesis reference
#   located in '_index-html.qmd'.
# * Create and separate settings for a "pure" abntex2's template and a USP's
#   template. Do it by creating a setting variable in the yml file.
# * Create a hex logo and review badges.
# * Add <https://fair-software.eu/>.
# * Add <https://www.bestpractices.dev/en/projects/6244 badge>.
# * Find a way to create double captions (top and bottom).
# * Fix code background on dark theme.
