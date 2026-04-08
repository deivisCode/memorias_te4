SHELL := bash
.PHONY: limpa figuras
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

figuras:
	uv run 0_grafica_exemplo.py
	uv run 1_grafica_ruido_bo.py
	uv run 2_grafica_ruido_malo.py

memoria/memoria.pdf: memoria/memoria.typ memoria/estilo_memoria.typ $(wildcard memoria/seccions/*.typ) $(wildcard memoria/figuras/*)
	typst compile $(OPCIONS) memoria/memoria.typ
