#!/usr/bin/make -f
CC        := pdflatex -interaction nonstopmode $< > /dev/null
SOURCE    := lettre.pdf

.PHONY:all
all: force ${SOURCE}

%.pdf:%.tex
	@echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@${CC}
	@echo -e "\n==============================================================================="
	@texloganalyser -ewr $(subst %.pdf, %.log, $@)

.PHONY:force
force:
	touch ${SOURCE}

#	@pdflatex -halt-on-error lettre.tex | sed "/^\((\|)\|Package\|\s*Copyri\)/d;/./,/^$$/!d"
