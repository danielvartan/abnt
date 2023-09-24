
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tesesusp

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
<!-- badges: end -->

## Overview

This [Quarto](https://quarto.org) format will help you create documents
for thesis or dissertations published by the Univesity of São Paulo
(USP). For more about producing USP thesis or dissertations documents,
see <https://teses.usp.br>.

This format is based on [`abntex2`](https://www.abntex.net.br/) suite
and the
[`abntex2ppgsi`](https://www.overleaf.com/project/64f7bdf1641ad4a3a8482800)
template.

The template that accompany the format extension is based on the \[R
programming language\]. You can use [other Quarto supported
languages](https://quarto.org/docs/computations/python.html), but some
adaptions will be necessary.

See an example of this Quarto format in action at
<https://github.com/danielvartan/mastersthesis>.

## Creating a new thesis

To create a new thesis from scratch, use the following command:

``` bash
quarto use template danielvartan/tesesusp
```

This will install the extension and create an example `qmd` file and
bibiography that you can use as a starting place.

## Installation for existing document

You may also use this format with an existing Quarto project or
document. From the quarto project or document directory, run the
following command to install this format:

``` bash
quarto add danielvartan/tesesusp
```

## Usage

To apply the format, you can use the format name `tesesusp`. For
example:

`quarto render --to tesesusp`

or in your document yaml

``` yaml
format:
  tesesusp:
    keep-tex: true    
```

<!-- You can view a preview of the rendered template at <https://quarto-journals.github.io/elsevier/>. -->

## Format Options

<!-- See <https://github.com/quarto-journals/elsevier>. -->
<!-- See <https://quarto.org/docs/extensions/formats.html>. -->

*TODO*: If your format has options that can be set via document
metadata, describe them.
