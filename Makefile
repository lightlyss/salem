PDF = pdflatex
BIB = bibtex
XE = xelatex

.PHONY: clean

default:
	$(MAKE) salem.pdf

%.pdf: %.tex preamble.tex cover.tex chapters/ch*.tex
	$(PDF) $<
	$(PDF) $<

clean:
	$(RM) *.aux *.bbl *.blg *.lof *.log *.lot *.pdf *.toc *.out
