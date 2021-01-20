INPUT ?= src/sample/index.tex
OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
DOCKER_COMPOSE = docker-compose
UP = ${DOCKER_COMPOSE} up
OUTPUT_DIRECTORY = /home/build
LATEXMK_ARGS ?= -cd -halt-on-error -MP -logfilewarninglist -pdf -shell-escape -interaction=nonstopmode -file-line-error -output-directory=$(OUTPUT_DIRECTORY)
TEXINPUTS = "/home/src//:"
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
	${RUN} latexindent -s -w $(INPUT)


chmodbuild:
	$(RUN) chmod 777 build

watch:
	$(LATEXMK_COMMAND) -pvc -jobname=$(OUTPUT) $(INPUT)
	make chmodbuild

fresh:
	make chmodbuild clean build
