PWD = $(shell pwd)

TEXINPUTS = ${PWD}:
BSTINPUTS = ${PWD}:

SETENVVAR = \
			BSTINPUTS="${BSTINPUTS}" \
			TEXINPUTS="${TEXINPUTS}"

BIBTEX = ${SETENVVAR} bibtex
PDFLATEX = ${SETENVVAR} pdflatex -shell-escape --synctex=1

.PHONY: clean

all: trabalho.pdf

trabalho.pdf: *.tex
	${PDFLATEX} trabalho.tex
	${BIBTEX} trabalho
	${PDFLATEX} trabalho.tex
	${PDFLATEX} trabalho.tex

clean:
	rm -f *.brf *.idx *.aux *.auxlock *.dvi *.lof *.lot *.lox *.toc *.bbl *.blg *.blf *.pyc *.bak *.log *.out *.fdb_latexmk *_latexmk *.synctex.gz trabalho.pdf
