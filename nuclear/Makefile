SHELL := bash
.PHONY: limpa figuras
.DEFAULT_GOAL := memoria/memoria.pdf

limpa:
	rm -rf memoria/*.pdf
	rm -rf memoria/figuras/*

figuras_plot_calibracion := $(wildcard memoria/figuras/mostra_*_PLOT.pdf)
figuras_fit_calibracion := $(wildcard memoria/figuras/mostra_*_FITPEAK_*.pdf)
csv_calibracion := $(wildcard memoria/datos/mostra_*.csv)

figuras_plot_angulos := $(wildcard memoria/figuras/angulo_*_dispersor_PLOT.pdf)
figuras_fit_angulos := $(wildcard memoria/figuras/angulo_*_dispersor_FITPEAK_*.pdf)
csv_angulos := $(wildcard memoria/datos/angulo_*_dispersor.csv)

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
	uv run 4_compton.py

memoria/memoria.pdf: memoria/memoria.typ memoria/estilo_memoria.typ $(wildcard memoria/seccions/*.typ) $(wildcard memoria/figuras/*)
	typst compile $(OPCIONS) \
	--input figuras_plot_calibracion="$(figuras_plot_calibracion)" \
	--input figuras_fit_calibracion="$(figuras_fit_calibracion)" \
	--input csv_calibracion="$(csv_calibracion)" \
	--input figuras_plot_angulos="$(figuras_plot_angulos)" \
	--input figuras_fit_angulos="$(figuras_fit_angulos)" \
	--input csv_angulos="$(csv_angulos)" \
	memoria/memoria.typ
