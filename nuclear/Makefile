SHELL := bash
.PHONY: limpa
.DEFAULT_GOAL := memoria/memoria.pdf


limpa:
	rm -rf memoria/*.pdf
	rm -rf memoria/figuras/*

OPCIONS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--input rama=$(shell git rev-parse --abbrev-ref HEAD) \
	--input hash=$(shell git rev-parse --short HEAD) \
	--input dirt=$(shell test -z "$$(git status --porcelain)" && echo "limpo" || echo "sucio")

memoria/memoria.pdf: memoria/memoria.typ
