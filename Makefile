.PHONY: all
all: relatorio.pdf

neverclean := *.pdf
-include latex.make
