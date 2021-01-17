# (NoNameFoundYet)

## Dependencies

* [Go Task][http go task] or [Makefile][http makefile]
* [Docker][http docker]
* [Docker-compose][http docker-compose]

## Goals

This project is an easy and quick way to build and publish Latex documents.

The goals of this project are:

* Automatize as much as possible all the things through makefile/taskfile.
* Should be operating system agnostic
* Provide an easy way to publish documents through Github Actions

## Usage

* To build a document once:
  * `task build INPUT=src/sample/index.tex`
  * `make build INPUT=src/sample/index.tex`

* To watch a document and enable hot reload/rebuild:
  * `task watch INPUT=src/sample/index.tex`
  * `make watch INPUT=src/sample/index.tex`

* To remove build files:
  * `task clean`
  * `make clean`

* To run some checks:
  * `task lint INPUT=src/sample/index.tex`
  * `make lint INPUT=src/sample/index.tex`

The resulting PDF file will be in the `build` directory.

## Examples

The project comes with various Latex projects:

* `src/analysis` and `src/probability`: [Computer Science Cheat Sheets][computer science cheat sheets] from Flavio Schneider.
* `src/presentation`: A sample presentation
* `src/sample`: A sample page
* `src/umons`: [Latex classes][umons latex classes] form [uMons university][http umons].
* `src/umons-*`: Example documents using uMons classes.
* `src/ucl-beamer`: Sample document using [UCL beamer][http ucl-beamer] templates.

## FAQ

* Why using Docker?

  The use of Docker has been made in order to make that this would work equally on different OS. While Docker is not available on FreeBSD and being a user of FreeBSD it was a hard choice to make.
  Using Docker also help me to keep an up-to-date Texlive installation without all the hassle of updating stuff here and there.

## Todo / Ideas

* Decide between Go Task and Makefile
* Document the use of the commands
* In a LaTex document, find a way to use local paths instead of paths from the root
* Use Makefile/Taskfile per Latex project directory?

[http go task]: https://taskfile.dev
[http makefile]: https://www.gnu.org/software/make/
[http docker]: https://www.docker.com/
[http docker-compose]: https://docs.docker.com/compose/
[computer science cheat sheets]: https://github.com/flavioschneider/ethzcheatsheets
[umons latex classes]: https://github.com/Chris00/latex-umons
[http umons]: https://web.umons.ac.be/
[http ucl]: https://github.com/UCL/ucl-beamer