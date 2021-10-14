# DockLatex

## Requirements

* [Go Task][http go task] or [Makefile][http makefile]
* [Docker][http docker]
* [Docker-compose][http docker-compose]

## Goals

DockLatex offers an easy way to create, build and publish [LaTeX][http latex] documents.

The goals of this project are:

* Automate as much as possible, by using a Makefile or a Taskfile;
* To be agnostic of operating system;
* Provide an easy way to publish documents using 'Github Actions'.

## Usage

### To build a document once

This will try to convert the `INPUT` file into a PDF file.

* `task docker-build INPUT=src/sample/index.tex`
* `make docker-build INPUT=src/sample/index.tex`

### To watch a document and enable hot reload/rebuild

Continually update the PDF files whenever changes are made to source files.

* `task docker-watch INPUT=src/sample/index.tex`
* `make docker-watch INPUT=src/sample/index.tex`

### To run some checks

This will run [lacheck][http lacheck], [chktex][http chktex] and [latexindent][http latexindent] on all the `.tex` files recursively.

* `task docker-lint INPUT=src/sample/index.tex`
* `make docker-lint INPUT=src/sample/index.tex`

### To remove build files

This will delete the `build/` directory, deleting all the resulting PDF files that
were generated.

* `task clean`
* `make clean`

### To convert to another format

#### Convert to Markdown

* `task docker-pandoc INPUT=src/sample/index.tex OUTPUT=build/sample.md`
* `make docker-pandoc INPUT=src/sample/index.tex OUTPUT=build/sample.md`

#### Convert to HTML

* `task docker-pandoc INPUT=src/sample/index.tex OUTPUT=build/sample.html`
* `make docker-pandoc INPUT=src/sample/index.tex OUTPUT=build/sample.html`

You can use any format supported by [Pandoc][http pandoc].

## Documentation

This project helps you to create beautiful PDFs, using [LaTeX][http latex].

Document sources are in `src/`. Each document live in its own unique directory in `src/`.
The entry file *must* be named `index.tex` in order to get built properly.

The resulting PDF files will be in the `build/` directory.

## Examples

The project comes with a handful of LaTeX sample projects:

* `src/analysis` and `src/probability`: [Computer Science Cheat Sheets][computer science cheat sheets] from Flavio Schneider.
* `src/presentation`: A sample presentation
* `src/sample`: A sample page
* `src/umons`: [Latex classes][umons latex classes] form [uMons university][http umons].
* `src/umons-*`: Example documents using uMons classes.
* `src/ucl-beamer`: Sample document using [UCL beamer][http ucl-beamer] templates.

## FAQ

* Why use Docker?

  The use of Docker has been made in order to make that this would work equally on different OS. While Docker is not available on FreeBSD and being a user of FreeBSD it was a hard choice to make.
  Using Docker also help me to keep an up-to-date Texlive installation without all the hassle of updating stuff here and there.

* Why use a Taskfile and a Makefile?

  This project is a work in progress. I have not yet decided between [Go Task][http go task] or [Make][http makefile].

## Todo / Ideas

* ~~Find a proper name~~
* Decide between [Go Task][http go task] and [Makefile][http makefile].
* More documentation on how to use the command and create a new document
* ~~In a LaTex document, find a way to use local paths instead of paths from the root~~
* Should we use a Makefile/Taskfile per document directory?
* Decide which example project(s) to include in the OpenSource version
* ~~Add a changelog~~
* Create proper issues in Github

[http go task]: https://taskfile.dev
[http makefile]: https://www.gnu.org/software/make/
[http docker]: https://www.docker.com/
[http docker-compose]: https://docs.docker.com/compose/
[computer science cheat sheets]: https://github.com/flavioschneider/ethzcheatsheets
[umons latex classes]: https://github.com/Chris00/latex-umons
[http umons]: https://web.umons.ac.be/
[http ucl-beamer]: https://github.com/UCL/ucl-beamer
[http latex]: https://www.latex-project.org/
[http lacheck]: https://ctan.org/pkg/lacheck
[http chktex]: https://ctan.org/pkg/chktex
[http latexindent]: https://github.com/cmhughes/latexindent.pl
[http pandoc]: https://pandoc.org/
