INPUT ?= src/sample/index.tex
OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
INPUT_DIR = $(shell dirname "$(INPUT)")
MAKEFILE_DIR = $(shell pwd)
DOCKER_COMPOSE = docker-compose
UP = ${DOCKER_COMPOSE} up
OUTPUT_DIRECTORY = /home/build
LATEXMK_ARGS ?= -cd -halt-on-error -MP -logfilewarninglist -pdf -shell-escape -interaction=nonstopmode -file-line-error -output-directory=$(OUTPUT_DIRECTORY)
TEXINPUTS = "/home/$(INPUT_DIR)//:/home/src//:"
RUN = ${DOCKER_COMPOSE} run -e TEXINPUTS=$(TEXINPUTS) texlive
LATEXMK_COMMAND = $(RUN) latexmk $(LATEXMK_ARGS)

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
	$(RUN) lacheck $(INPUT)
	$(RUN) chktex $(INPUT)

chmodbuild:
	$(RUN) chmod 777 build

watch:
	$(LATEXMK_COMMAND) -pvc -jobname=$(OUTPUT) $(INPUT)
	make chmodbuild

fresh:
	make chmodbuild clean build
