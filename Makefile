#!/usr/bin/make -f
CCO       = -interaction nonstopmode
CCS       = > /dev/null
CC        = pdflatex ${CCO} $< ${CCS}
SOURCE    = EcoleLecture.pdf

.PHONY:all
all: force ${SOURCE} clean

%.pdf:%.tex
	@${CC}
	@${CC}
	@texloganalyser -ewr $(patsubst %.pdf, %.log, $@)
	@echo "Compilation de $@ terminée"

.PHONY:force
force:
	touch $(patsubst %.pdf, %.tex, ${SOURCE})
	@echo "Force la compilation des cibles"

.PHONY:clean
clean:
	find . -iregex ".*\.\(aux\|log\|toc\|dvi\|ps\|out\)" -delete
	@echo "Fichiers temporaires supprimés"

.PHONY:mrpropre
mrpropre: clean
	@rm -vf ${SOURCE}
	@echo "Fichiers cibles supprimés"

