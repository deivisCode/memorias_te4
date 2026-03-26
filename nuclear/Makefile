SHELL := bash
.PHONY: limpa
.DEFAULT_GOAL := memoria/memoria.pdf

limpa:
	rm -rf memoria/*.pdf
	rm -rf memoria/figuras/*

OPCIONS := \
	--format pdf               \
	--root ./memoria           \
	--pdf-standard 2.0         \
	--diagnostic-format short  \
	--ignore-system-fonts      \
	--ignore-embedded-fonts    \
	--font-path=memoria/.fontes

memoria/memoria.pdf: memoria/memoria.typ memoria/estilo_memoria.typ $(wildcard memoria/seccions/*.typ)
	typst compile $(OPCIONS) memoria/memoria.typ
