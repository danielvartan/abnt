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

# # Quarto (see <https://quarto.org/docs/projects/quarto-projects.html>)
#
# source(here::here("R", "quarto-pre-render-pdf.R"))
# source(here::here("R", "quarto-pre-render-html.R"))
#
# quarto render
# quarto render --profile pdf
# quarto render --profile html
# quarto publish gh-pages

# # LaTeX
#
# \BeforeBeginEnvironment{}{} # {etoolbox}
# \AtBeginEnvironment{}{}
# \AtEndEnvironment{}{}
# \AfterEndEnvironment{}{}

# TODO:
#
# * Fix SCSS. Mobile menu is appearing with white or transparent color.
# * Fix spacing in `figure` environment.
# * Fix quinary section after skip.
# * Add command tag sub function.
# * Fix title and table captions making the caption name (e.g., "Figure -")
#   become tabular.
# * Create errata table (c.f. Funaro et al., 2020).
# * Fix References section bookmark (see R package {xmpdf}).
# * Fix spacing in `theorem` environment.
# * Fix References and Glossary, and Parts spacing on TOC (underlying reasons).
# * Include `\ABNTEXchapterupperifneeded{}` in the References section config.
# * Fix '\tightlist' settings.
# * Fix caption spacing after tables.
# * Set indentation of unordered and ordered list (see ABNT norms).
# * Add post- and pre-chapters code automatically.
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
# * Fix code background on dark theme.
# * Refactor format using Quarto filters.
# * Use `etoolbox` and pre, app or patch to edit `abntex2` commands.
# * Find a proper solution for the title streching issue.
# * Fix the source caption formatting for HTML output.
# * Fix the dark theme SCSS.
# * Finish translating `english-abnt-author-date.csl`.
# * Add DOI field into ABNT CSL files.
