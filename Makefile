#!/usr/bin/make -f
CCO       = -interaction nonstopmode
CCS       = > /dev/null
CC        = pdflatex ${CCO} $< ${CCS}
SOURCE    = EcoleLecture.pdf

.PHONY:all force clean mrpropre
all: force ${SOURCE} clean

%.pdf:%.tex
	@${CC} ; ${CC}
	@echo -e "\n\n\n\n\n\n==============================="
	@texloganalyser -ewr $(patsubst %.pdf, %.log, $@)
	@echo "Compilation de $@ terminée"

force:
	touch $(patsubst %.pdf, %.tex, ${SOURCE})
	@echo "Force la compilation des cibles"

clean:
	find . -iregex ".*\.\(aux\|log\|toc\|dvi\|ps\|out\)" -delete
	@echo "Fichiers temporaires supprimés"

mrpropre: clean
	@rm -vf ${SOURCE}
	@echo "Fichiers cibles supprimés"

