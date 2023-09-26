# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)
# library(yaml, quietly = TRUE)

quarto_yml_path <- here::here("_quarto.yml")
quarto_vars <- yaml::read_yaml(quarto_yml_path)
output_dir <- quarto_vars$project$`output-dir`
pdf_file <- list.files(output_dir, full.names = TRUE, pattern = ".pdf$")

output_dir_docs <- here::here("docs")
output_dir_pdf <- here::here("pdf")
project_name <- here::here() |> basename() # rstudioapi::getActiveProject()

for (i in c(output_dir_docs, output_dir_pdf)) {
  if (!checkmate::test_directory_exists(i)) dir.create(i) |> invisible()
}

if (length(pdf_file) == 1) {
  rutils:::copy_file(pdf_file, file.path(output_dir_docs, "preview.pdf"))
  rutils:::remove_pdf_cover(file.path(output_dir_docs, "preview.pdf"))

  rutils:::copy_file(
    pdf_file,
    file.path(output_dir_pdf, paste0(project_name, ".pdf"))
    )
  rutils:::remove_pdf_cover(
    file.path(output_dir_pdf, paste0(project_name, ".pdf"))
    )

  list.files(here::here(), full.names = TRUE, pattern = ".tex$") |>
    rutils:::copy_file(file.path(output_dir_pdf, paste0(project_name, ".tex")))
}

rutils:::clean_quarto_mess(
  wd = here::here(),
  file = NULL,
  dir = c(".temp"),
  ext = c("aux", "cls", "loa", "log", "pdf", "tex"),
  keep = NULL,
  quarto_yaml = NULL
)
