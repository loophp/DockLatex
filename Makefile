INPUT ?= src/sample/index.tex
LATEXMK_ARGS ?= -shell-escape -interaction=nonstopmode -file-line-error -output-directory=build
OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
DOCKER_COMPOSE = docker-compose
RUN = ${DOCKER_COMPOSE} run texlive
UP = ${DOCKER_COMPOSE} up
LATEXMK_COMMAND = $(RUN) latexmk $(LATEXMK_ARGS)

.PHONY: build view

all : build

build :
	$(LATEXMK_COMMAND) -jobname=$(OUTPUT) $(INPUT)
	$(RUN) chmod 777 build

clean :
	$(RUN) rm -rf build

lint :
	$(RUN) lacheck $(INPUT)
	$(RUN) chktex $(INPUT)

watch:
	$(LATEXMK_COMMAND) -pvc -jobname=$(OUTPUT) $(INPUT)
	$(RUN) chmod 777 build

fresh:
	make clean && make
