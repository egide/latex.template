#!/usr/bin/make -f
CC    := pdflatex -interaction nonstopmode $< > /dev/null

.PHONY:all
all: lettre.pdf

%.pdf:%.tex
	@echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@${CC}
	@echo -e "\n==============================================================================="
	@texloganalyser -ewr $(subst %.pdf, %.log, $@)



#	@pdflatex -halt-on-error lettre.tex | sed "/^\((\|)\|Package\|\s*Copyri\)/d;/./,/^$$/!d"
