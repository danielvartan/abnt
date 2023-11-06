
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

`abnt` is a format in the [Quarto](https://quarto.org) system
specifically tailored for the creation of theses and dissertations that
align with the guidelines established by the Brazilian Association of
Technical Standards ([ABNT](https://www.abnt.org.br/)). It’s based on
the [`abntex2`](https://www.abntex.net.br/) class in the
[LaTeX](https://www.latex-project.org/) framework, which belongs to the
[`memoir`](https://www.ctan.org/pkg/memoir) class type.

This format also includes a dedicated [Quarto
book](https://quarto.org/docs/books/) template designed for use with the
[R programming language](https://www.r-project.org/). Although it is
possible to employ [other programming languages supported by
Quarto](https://quarto.org/docs/computations/python.html) with this
format, some adjustments may be required.

It’s worth noting that ABNT standards are not publicly accessible. They
can be acquired [here](https://www.abntcatalogo.com.br). If you are
affiliated with a federal or state university in Brazil, you may have
access to [Target GEDWeb](https://www.gedweb.com.br), a service for
managing standards and other regulatory documents. Members of the
University of São Paulo ([USP](https://www5.usp.br/)) can access ABNT
standards on GEDWeb
[here](https://uspdigital.usp.br/wsusuario/gedweb.jsp).

You can view a sample of the [printed
output](https://danielvartan.github.io/abnt/index.pdf) in the `pdf`
folder or by visiting the [repository
website](https://danielvartan.github.io/abnt).

For a practical demonstration of this Quarto format in use, you can
refer to the [example
repository](https://github.com/danielvartan/mastersthesis).

## Prerequisites

To effectively use \`abnt, it’s important to have some familiarity with
the tools and languages involved. This includes the [R programming
language](https://www.r-project.org) and the
[LaTeX](https://www.latex-project.org) framework, as well as being
acquainted with the [Quarto](https://quarto.org) system and
[abntex2](https://www.abntex.net.br),
[memoir](https://www.ctan.org/pkg/memoir), and
[biblatex](https://www.ctan.org/pkg/biblatex) LaTeX packages.

It’s crucial to understand that, while this Quarto format allows for the
integration of other programming languages, its core structure is based
on [R](https://www.r-project.org) and
[LaTeX](https://www.latex-project.org). Therefore, if you wish to make
any customizations, you’ll need to work within these languages.
Additionally, although not mandatory, we recommend using the free and
open-source reference manager [Zotero](https://www.zotero.org).

For those less familiar with R, we strongly encourage you to explore
resources such as Hadley Wickham and Garrett Grolemund’s free and online
book, [R for Data Science](https://r4ds.had.co.nz), and consider the
Coursera course from John Hopkins University, [Data Science: Foundations
using
R](https://www.coursera.org/specializations/data-science-foundations-r)
(free for audit students).

To become well-versed in LaTeX, we suggest reading Tobias Oetiker’s et
al. free and online book, [The Not So Short Introduction to
LaTeX](https://tobi.oetiker.ch/lshort/lshort.pdf). You can also explore
other excellent and free resources for learning LaTeX, such as [Learn
LaTeX.org](https://www.learnlatex.org/en) and Winston Chang’s [LaTeX
Cheat Sheet](http://wch.github.io/latexsheet/).

Lastly, if you’ve opted for a Quarto format, you likely values open
science and reproducibility. In this case, we recommend implementing
this format in a research compendium online repository. For guidance on
this, please refer to the article by Ben Marwick, Carl Boettiger &
Lincoln Mullen, [Packaging Data Analytical Work Reproducibly Using R
(and Friends)](https://doi.org/10.1080/00031305.2017.1375986).

## Installation

While Quarto provides various features for customization, they still do
not suffice to seamlessly adapt to ABNT standards. Some formatting
adjustments required the use of unconventional methods and multiple
layers of processing.

A convenient way to begin using `abnt` is by cloning this repository and
building upon its [Quarto book](https://quarto.org/docs/books/). By
doing so, make sure to install the
[`renv`](https://rstudio.github.io/renv/index.html) R package and run
`renv::restore()` afterward. This will ensure that you have all the
necessary package dependencies ready for use.

## Usage

To render your thesis, you can use the format name followed by a dash
and the desired output type:

``` bash
quarto render --to abnt-pdf
```

Alternatively, you can utilize the
[`quarto`](https://quarto-dev.github.io/quarto-r/) R package’s
[`quarto_render()`](https://quarto-dev.github.io/quarto-r/reference/quarto_render.html)
function as an interface.

Currently, `abnt` offers two output formats: `pdf` (the default format)
and an `html` template for publishing a web-based thesis book in
addition to the print version.

You can also specify the format in your document’s `yml` configuration
as follows:

``` yaml
format:
  abnt-pdf
```

## Formating options

Most customization options available in the Quarto system are compatible
with this format. For more details, refer to the [extension YAML
file](https://github.com/danielvartan/abnt/blob/main/_extensions/abnt/_extension.yml)
and the [PDF
Options](https://quarto.org/docs/reference/formats/pdf.html) section in
the [Quarto guide](https://quarto.org/docs/reference/formats/pdf.html).

For additional formatting information, see the `abnt` [print
output](https://danielvartan.github.io/abnt/index.pdf) and the [web
output](https://danielvartan.github.io/abnt/).

Please note that some documentation may still be missing. We are
actively working to provide complete documentation. If you have
questions, ideas to share, or need assistance, feel free to use the
[GitHub discussion repository
tab](https://github.com/danielvartan/abnt/discussions). We and the
community will do our best to assist you.

## Citation

If you choose to utilize the `abnt` format in your research, we kindly
request that you consider citing it. Building and maintaining this free
and open-source Quarto format has required substantial effort, and your
citation is appreciated. The citation details are provided below.

[APA](https://apastyle.apa.org/) style:

    Vartanian, D. (2023). {abnt}: Quarto format for ABNT theses and dissertations.
    https://github.com/danielvartan/abnt/

[BibTeX](https://www.bibtex.org/) entry:

    @unpublished{vartanian2023,
      author = {Daniel Vartanian},
      title = {{abnt}: Quarto format for ABNT theses and dissertations},
      url = {https://github.com/danielvartan/abnt/},
      year = {2023}
    }

## Contributing

We warmly welcome contributions from the community, which includes bug
reports and other enhancements to improve the `abnt` format.

Please take a moment to familiarize yourself with our [Guidelines for
Contributing](https://github.com/danielvartan/abnt/blob/main/.github/CONTRIBUTING.md).

## Acknowledgments

This Quarto project owes its existence to the contributions of dedicated
developers from the [`abntTeX`](https://www.abntex.net.br/) community.

The initial development of `abnt` was made possible through a
scholarship generously provided by the [Coordination for the Improvement
of Higher Education Personnel (CAPES)](https://www.gov.br/capes/) and
the [University of São Paulo (USP)](http://usp.br/) (Grant number:
88887.703720/2022-00) (❤️).

<br>

You can become a supporter of `abnt` too!

Click [here](https://github.com/sponsors/danielvartan) to make a
donation. When making your donation, please specify your support for the
`abnt` format in the donation message.
