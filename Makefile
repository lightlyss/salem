PDF = pdflatex
PDFFLAGS = -halt-on-error -interaction=nonstopmode

.PHONY: clean

default:
	$(MAKE) salem.pdf

%.pdf: src/%.tex src/preamble.tex src/cover.tex src/chapters/*.tex
	TEXINPUTS="./src//:$(TEXINPUTS)" $(PDF) $(PDFFLAGS) $<
	TEXINPUTS="./src//:$(TEXINPUTS)" $(PDF) $(PDFFLAGS) $<

clean:
	$(RM) *.aux *.bbl *.blg *.lof *.log *.lot *.pdf *.toc *.out
