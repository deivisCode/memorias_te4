#import("/estilo_memoria.typ"): *

= Anexos

#let datos_G_intrinseca = csv("/datos/G_intrinseca.dat")
#let datos_fluxo_ambiental_nulo = csv("/datos/fluxo_ambiental_nulo.dat")
#let datos_fluxo_ambiental_parcial = csv("/datos/fluxo_ambiental_parcial.dat")
#let datos_fluxo_ambiental_total = csv("/datos/fluxo_ambiental_total.dat")
#set table(row-gutter: -2pt)

== Datos para a condutancia intrínseca

#table(
    columns: (1fr, 1fr),
    stroke: none,
    table.hline(),
    ..datos_G_intrinseca.slice(0, 1).at(0).map(x => [#x]),
    table.hline(stroke: 0.6pt),
    ..datos_G_intrinseca.slice(1).flatten(),
    table.hline(),
)

== Datos no caso dun fluxo ambiental nulo

#table(
    columns: (1fr, 1fr, 1fr),
    stroke: none,
    table.hline(),
    ..datos_fluxo_ambiental_nulo.slice(0, 1).at(0).map(x => [#x]),
    table.hline(stroke: 0.6pt),
    ..datos_fluxo_ambiental_nulo.slice(1).flatten(),
    table.hline(),
)

== Datos no caso dun fluxo ambiental parcial

#table(
    columns: (1fr, 1fr, 1fr),
    stroke: none,
    table.hline(),
    ..datos_fluxo_ambiental_parcial.slice(0, 1).at(0).map(x => [#x]),
    table.hline(stroke: 0.6pt),
    ..datos_fluxo_ambiental_parcial.slice(1).flatten(),
    table.hline(),
)

== Datos no caso dun fluxo ambiental total

#table(
    columns: (1fr, 1fr, 1fr),
    stroke: none,
    table.hline(),
    ..datos_fluxo_ambiental_total.slice(0, 1).at(0).map(x => [#x]),
    table.hline(stroke: 0.6pt),
    ..datos_fluxo_ambiental_total.slice(1).flatten(),
    table.hline(),
)
