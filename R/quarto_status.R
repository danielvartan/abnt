require(cli, quietly = TRUE)

# use '#| output: asis'
quarto_status <- function(type) {
  status <- switch(
    type,
    polishing = paste0(
      "should be readable but is currently undergoing final polishing"
    ),
    restructuring = paste0(
      "is undergoing heavy restructuring and may be confusing or incomplete"
    ),
    drafting = paste0(
      "is currently a dumping ground for ideas, and I don't recommend", " ",
      "reading it"
    ),
    complete = "is largely complete and just needs final proof reading",
    cli::cli_abort("Invalid {.strong {cli::col_red('type')}}.")
  )

  class <- switch(
    type,
    polishing = "note",
    restructuring = "important",
    drafting = "important",
    complete = "note"
  )

  cat(paste0(
    "\n",
    "::: {.callout-", class, "}", "\n",
    "You are reading the work-in-progress of this thesis.", " ",
    "This chapter ", status, ".", "\n",
    ":::",
    "\n"
  ))
}
