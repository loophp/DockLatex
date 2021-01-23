# DockLatex

## Dependencies

* [Go Task][http go task] or [Makefile][http makefile]

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

## Todo

* Decide between Go Task and Makefile
* Document the use of the commands

[http go task]: https://taskfile.dev
[http makefile]: https://www.gnu.org/software/make/
