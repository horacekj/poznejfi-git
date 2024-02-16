IMAGES=$(wildcard images/*)

all: git.pdf

%.pdf: %.tex $(IMAGES) Makefile
	TEXINPUTS=support: pdflatex -interaction=batchmode $< # The initial typesetting.
	TEXINPUTS=support: texfot pdflatex $<

rmaux:
	rm -f *.aux *.log *.bcf *.nav *.out *.run.xml *.snm *.toc

clean: rmaux
	rm -f git.pdf

.PHONY: all clean rmaux
