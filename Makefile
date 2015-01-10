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
	@echo "Compilation de $@ terminée"

.PHONY:force
force:
	touch ${SOURCE}
	@echo "Force la compilation des cibles"

.PHONY:clean
clean:
	find . -iregex ".*\.\(aux\|log\|toc\|dvi\|ps\|out\)" -delete
	@echo "Fichiers temporaires supprimés"

.PHONY:mrpropre
mrpropre: clean
	@rm -vf ${SOURCE}
	@echo "Fichiers cibles supprimés"

#	@pdflatex -halt-on-error lettre.tex | sed "/^\((\|)\|Package\|\s*Copyri\)/d;/./,/^$$/!d"
