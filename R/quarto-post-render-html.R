# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(yaml, quietly = TRUE)

# Set variables ----------

quarto_yml_path <- here::here("_quarto.yml")
quarto_yml_html_path <- here::here("_quarto-html.yml")
quarto_yml_pdf_path <- here::here("_quarto-pdf.yml")

quarto_yml_vars <- yaml::read_yaml(quarto_yml_path)
quarto_yml_html_vars <- yaml::read_yaml(quarto_yml_html_path)
quarto_yml_pdf_vars <- yaml::read_yaml(quarto_yml_pdf_path)

github_user <- "danielvartan"
project_name <- here::here() |> basename() # rstudioapi::getActiveProject()

# Set output variables and create output folders if they don't exist ----------

output_dir_html <- here::here(quarto_yml_html_vars$project$`output-dir`)
output_dir_pdf <- here::here(quarto_yml_pdf_vars$project$`output-dir`)
pdf_dir <- here::here("pdf")

for (i in c(output_dir_html, output_dir_pdf, pdf_dir)) {
  if (!checkmate::test_directory_exists(i)) dir.create(i) |> invisible()
}

# Copy PDF (if exists) to `docs` folder ----------

pdf_file <- list.files(pdf_dir, full.names = TRUE, pattern = ".pdf$")

if (length(pdf_file) == 1) {
  rutils:::copy_file(pdf_file, file.path(output_dir_html, "index.pdf"))
}

# Create robots.txt file ----------

robots_file <- file.path(output_dir_html, "robots.txt")
if (!checkmate::test_file_exists(robots_file)) rutils:::create_file(robots_file)

# Change this part if you will not use GitHub Pages.
writeLines(
  text = c(
    "user-agent: *",
    "allow: /",
    "",
    paste0(
      "Sitemap: https://",
      github_user,
      ".github.io/",
      project_name,
      "/sitemap.xml"
    )
  ),
  con = robots_file
)

# Delete unnecessary files and folders ----------

rutils:::clean_quarto_mess(
  wd = here::here(),
  file = NULL,
  dir = c(".temp", "index_cache", "index_files", "qmd/images"),
  ext = NULL,
  keep = NULL,
  quarto_yaml = NULL
)
