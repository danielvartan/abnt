
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abnt

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
<!-- badges: end -->

## Overview

`abnt` is a [Quarto](https://quarto.org) format designed for technical
and scientific documents that adhere to the standards of the Brazilian
Association of Technical Standards ([ABNT](https://www.abnt.org.br/)).
Currently, it is exclusively tailored for theses and dissertations. The
format is built upon the [`abntex2`](https://www.abntex.net.br/) suite
and the
[`abntex2ppgsi`](https://www.overleaf.com/project/64f7bdf1641ad4a3a8482800)
template.

This format extension also includes a [Quarto
book](https://quarto.org/docs/books/) template designed for use with the
[R programming language](https://www.r-project.org/). While you can
utilize [other Quarto supported
languages](https://quarto.org/docs/computations/python.html) with this
format, some adaptations may be necessary.

It’s important to notice that the ABNT standards are not publicly
available. They can be purchased
[here](https://www.abntcatalogo.com.br). If you are a member of a
Brazil’s federal or state university, you may have access to [Target
GEDWeb](https://www.gedweb.com.br), a system for managing standards and
other regulatory documents. For example, members of the University of
São Paulo can access ABNT standards on GEDWeb
[here](https://uspdigital.usp.br/wsusuario/gedweb.jsp).

You can preview the template output in the `pdf` folder or by accessing
the repository website: <https://danielvartan.github.io/abnt>.

To see a practical example of this Quarto format in action, you can
refer to <https://github.com/danielvartan/mastersthesis>.

## Installation

To create a new thesis from scratch, use the following command:

``` bash
quarto use template danielvartan/abnt
```

<!-- Needs testing -->

This command will install the extension and generate an example `qmd`
file and bibliography that you can use as a starting point.

You can also use this format with an existing Quarto project or
document. To do so, navigate to the Quarto project or document directory
and run the following command:

``` bash
quarto add danielvartan/abnt
```

## Usage

To apply this format, use the format name followed by the output type:

`quarto render --to abnt-pdf`

At the moment, `abnt` have two outputs formats available: `pdf` (the
official one) and a `html` template to publish web thesis along with the
print version.

You can also set the format in your document `yml`:

``` yaml
format:
  abnt-pdf
```

Since USP and ABNT guidelines are plentiful, some formatting had to be
made by inventive/non-conventional ways (to put it mildly). The easy way
to start using `abnt` is cloning this repository and building on top of
its [Quarto book](https://quarto.org/docs/books/). If you do this, don’t
forget to install [`renv`](https://rstudio.github.io/renv/index.html)
and run `renv::restore()` after.

## Format options

<!-- See <https://github.com/quarto-journals/elsevier>. -->
<!-- See <https://quarto.org/docs/extensions/formats.html>. -->

Most customization options available in the Quarto system work with this
format. Here are some of them.

### Typography

You can set the document typography using the `mainfont` key. Example:”

``` yaml
format:
  abnt-pdf:
    mainfont: Arial
```

[USP guidelines for creating thesis and dissertation
documents](https://teses.usp.br/index.php?option=com_content&view=article&id=52&Itemid=67&lang=en)
recommends a `12pt` font size for the body text without specifying a
font type. Common options include `Arial` (default) and
`Times New Roman`. Any font available in your system should work.

### Language and hyphenation

At the moment, this Quarto format only supports the English language.

If you’re familiar with LaTeX, you can change the order of languages in
the `\RequirePackage[spanish, brazil, english]{babel}` command found in
`_extensions/abnt/abnt.cls`. By doing so, the last one in the list will
become the main language of the document.

### Pre-textual pages

At the moment, the pre-textual pages can only be configured using the
`yml` configuration and two [LaTeX](https://www.latex-project.org/)
files located in the `tex` folder.

### Citation management

This template works with [Zotero](https://www.zotero.org/) and the
[Better BiBTeX](https://github.com/retorquere/zotero-better-bibtex)
plugin. You must have both installed to render citations.

When rendering the document, the Zotero server must be running;
therefore, Zotero must be open. A pre-render script (see
`R/quarto-pree-render.R`), created using the
[`rbbt`](https://github.com/paleolimbot/rbbt) R package, will scan all
`qmd` and `tex` files searching for BibTeX citations (e.g.,
`@watson1953`). If they match with your Zotero database, the citations
will then be written to the `references.json` file.

<!-- How to add or remove sections. -->
<!-- ## Citation style -->
<!-- Cache issues. Use cache refresh -->

## Acknowledgments

This Quarto project would not be possible without the work of great
developers on the [`abntTeX`](https://www.abntex.net.br/) team, as well
as the contributions from the [Graduate Program on Information
Systems](http://ppgsi.each.usp.br/templates/) and the [Graduate Program
in Modeling Complex Systems](https://sites.usp.br/scx/apresentacao/) at
the [University of Sao Paulo (USP)](http://usp.br/).

The initial development of `abnt` was supported by a scholarship
provided by the [Coordination for the Improvement of Higher Education
Personnel (CAPES)](https://www.gov.br/capes/) and by the [University of
Sao Paulo (USP)](http://usp.br/) (Grant number: 88887.703720/2022-00)
(❤️).

<br>

Become an `abnt` supporter!

Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please indicate the `abnt` format in your donation message.
