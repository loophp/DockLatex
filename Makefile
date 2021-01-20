INPUT ?= src/sample/index.tex
OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
DOCKER_COMPOSE = docker-compose
UP = ${DOCKER_COMPOSE} up
OUTPUT_DIRECTORY = build
LATEXMK_ARGS ?= -halt-on-error -MP -logfilewarninglist -pdf -shell-escape -interaction=nonstopmode -file-line-error -output-directory=$(OUTPUT_DIRECTORY)
TEXINPUTS = "/home/src//:"
RUN = ${DOCKER_COMPOSE} run -e TEXINPUTS=$(TEXINPUTS) texlive
LATEXMK_COMMAND = $(RUN) latexmk $(LATEXMK_ARGS)

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

.PHONY: build view

all : build

build :
	$(LATEXMK_COMMAND) -jobname=$(OUTPUT) $(INPUT)
	make chmodbuild

latexindent :
	$(RUN) latexindent

clean :
	$(RUN) rm -rf build

lint :
	$(foreach file, $(call rwildcard,$(shell dirname "$(INPUT)"),*.tex), $(RUN) lacheck $(file);)
	$(foreach file, $(call rwildcard,$(shell dirname "$(INPUT)"),*.tex), $(RUN) chktex $(file);)
	$(foreach file, $(call rwildcard,$(shell dirname "$(INPUT)"),*.tex), $(RUN) latexindent $(file);)

chmodbuild:
	$(RUN) chmod 777 build

watch:
	$(LATEXMK_COMMAND) -pvc -jobname=$(OUTPUT) $(INPUT)
	make chmodbuild

fresh:
	make chmodbuild clean build

buildall:
	make clean
	$(foreach file, $(wildcard src/**/index.tex), make build INPUT=$(file);)

