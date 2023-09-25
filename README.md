
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tesesusp

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

`tesesusp` is a [Quarto](https://quarto.org) format designed for theses
and dissertations of the University of São Paulo (USP). It is based on
the [`abntex2`](https://www.abntex.net.br/) suite, the
[`abntex2ppgsi`](https://www.overleaf.com/project/64f7bdf1641ad4a3a8482800)
template, and on [USP guidelines for creating thesis and dissertation
documents](https://teses.usp.br/index.php?option=com_content&view=article&id=52&Itemid=67&lang=en).

This format extension also includes a [Quarto
book](https://quarto.org/docs/books/) template based on the [R
programming language](https://www.r-project.org/). While you can use
[other Quarto supported
languages](https://quarto.org/docs/computations/python.html) with this
format, some adaptations may be necessary.

For more detailed information about USP guidelines, please visit
<https://teses.usp.br>

You can see a preview of the template output in the `docs` folder or by
accessing the repository website:
<https://danielvartan.github.io/tesesusp>.

<!-- To see a practical example of this Quarto format, you can refer to <https://github.com/danielvartan/mastersthesis>. -->

## Instalation

To create a new thesis from scratch, use the following command:

``` bash
quarto use template danielvartan/tesesusp
```

This command will install the extension and generate an example `qmd`
file and bibliography that you can use as a starting point.

You can also use this format with an existing Quarto project or
document. To do so, navigate to the Quarto project or document directory
and run the following command:

``` bash
quarto add danielvartan/tesesusp
```

## Usage

To apply the format, you can use the format name followed by the output
type: `tesesusp-pdf`. For example:

`quarto render --to tesesusp-pdf`

You can also set the template in your document `yaml`:

``` yaml
format:
  tesesusp-pdf
```

Since USP guidelines are plentiful, some formatting had to be made by
inventive/non-conventional ways. The easy way to start using `tesesusp`
is cloning this repository and building on top of its [Quarto
book](https://quarto.org/docs/books/). You can also use this book to
publish a `html` version of your thesis.

At the moment, the pre-textual pages must be set using the
`yaml`configuration and two [LaTeX](https://www.latex-project.org/)
files that can be found in the `tex` folder. For citation managing, this
template works with [Zotero](https://www.zotero.org/) a pre-render
script (see `R/quarto-pree-render.R`), along with the
[`rbbt`](https://github.com/paleolimbot/rbbt) R package.

## Format options

<!-- See <https://github.com/quarto-journals/elsevier>. -->
<!-- See <https://quarto.org/docs/extensions/formats.html>. -->

Most customizing options available in the Quarto system works with this
format. Here are some of them.

### Typography

You can set the document typography using the `mainfont` key. Example:”

``` yaml
format:
  tesesusp-pdf:
    mainfont: Arial
```

[USP guidelines for creating thesis and dissertation
documents](https://teses.usp.br/index.php?option=com_content&view=article&id=52&Itemid=67&lang=en)
recommends a `12pt` for the body text, but don’t specify a font type.
`Arial` (default) and `Times New Roman` are two common options. Any font
available in the [`fontspec`](https://ctan.org/pkg/fontspec) LaTeX
package should work.

### Language and hyphenation

At the moment, this Quarto format supports only the English language.

If you know your way thought LaTeX, you can change the order of
languages in the `\RequirePackage[spanish, brazil, english]{babel}`
command present in `_extensions/tesesusp/tesesusp.cls`. This way, the
last one will become the main language of the document.

<!-- ## Sections -->
<!-- How to add or remove sections. -->
<!-- ## Bibliographical style -->
<!-- Main bib style == APA. How to change it. -->
