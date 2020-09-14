INVITES=einladung
MERGED=printA4.tex
SHELL=/bin/zsh

invites:
	latex $(INVITES).tex
	dvips -Ppdf -G0 $(INVITES).dvi
	ps2pdf $(INVITES).ps

merged:
	latexmk -pdf $(MERGED)


.PHONY: all
all: invites merged
	
.PHONY: clean
clean:
	latexmk -c $(INVITES) $(MERGED)
