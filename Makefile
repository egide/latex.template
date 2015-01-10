
CC=pdflatex -interaction nonstopmode @< > /dev/null

%.pdf:%.tex
	@echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@$(CC) ; $(CC)
	@echo -e "\n==============================================================================="
	@texloganalyser -ewr lettre.log



%	@pdflatex -halt-on-error lettre.tex | sed "/^\((\|)\|Package\|\s*Copyri\)/d;/./,/^$$/!d"
