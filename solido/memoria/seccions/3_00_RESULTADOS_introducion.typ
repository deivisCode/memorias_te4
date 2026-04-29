#import("/estilo_memoria.typ"): *
= Resultados

Comezamos ca medición de $G_0$ tal e como se comentou. Obtemos os resultados e
axustes da figura @fig:g_0

#figure(
    image("/figuras/axuste_G_intrinseca.pdf"),
    caption: [Axuste á ecuación @ec:axuste_g_0]
) <fig:g_0>

Obtemos os seguintes datos,

#{
    set align(center)
    table(
        columns: 2,
        stroke: none,
        table.hline(),
        table.header([Pendente ($G_0$)], [Ordenada na orixe]),
        table.hline(stroke: 0.6pt),
        valor("G_0"), valor("ordeada_G_0"),
        table.hline(),
    )
}
