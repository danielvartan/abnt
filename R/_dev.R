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

# TODO
#
# * Fix spacing (\baselineskip).
# * Fix SCSS. Mobile menu is appearing with white or transparent color.
# * Fix caption sizes and spacing.

# * Fix spacing in `figure` environment.
# * Fix quinary section after skip.
# * Find why the title of LoF, LoT, ToC and Abstract do not align with others.
# * Fix title page spacing.
# * Add command tag sub function.
# * Fix title and table captions making the caption name (e.g., "Figure -")
#   become tabular.
# * Fix References section bookmark (see R package {xmpdf}).
# * Fix spacing in `theorem` environment.
# * Fix spacing
# * Include `\ABNTEXchapterupperifneeded{}` in the References section config.
# * Fix '\tightlist' settings.
# * Fix indentation of unordered and ordered lists.
# * Change table font sizes to be accordingly with figure font sizes.
# * Add code post-chapters, pre-appendices and pre-annexes automatically.
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
# * Fix code background on dark theme.
