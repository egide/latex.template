#!/usr/bin/make -f
CCO       := -interaction nonstopmode
CCS       := > /dev/null
CC        := pdflatex ${CCO} $< ${CCS}
SOURCE    := lettre.pdf

.PHONY:all
all: force ${SOURCE}

%.pdf:%.tex
	@echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@${CC}
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
