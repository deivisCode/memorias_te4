SHELL := bash
.PHONY: limpa figuras
.DEFAULT_GOAL := memoria/memoria.pdf

limpa:
	rm -rf memoria/*.pdf
	rm -rf memoria/figuras/*

figuras_fits_calibracion := $(wildcard memoria/figuras/mostra_*_FITPEAK_*.pdf)
csv_calibracion := $(wildcard memoria/datos/*.csv)

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
	uv run 3_calibracion.py

memoria/memoria.pdf: memoria/memoria.typ memoria/estilo_memoria.typ $(wildcard memoria/seccions/*.typ) $(wildcard memoria/figuras/*)
	echo $(figuras_fits_calibracion)
	typst compile $(OPCIONS) \
	--input figuras_fits_calibracion="$(figuras_fits_calibracion)" \
	--input csv_calibracion="$(csv_calibracion)" \
	memoria/memoria.typ
