#import("/estilo_memoria.typ"): *
= Resultados

Comezamos ca medición de $G_0$ tal e como se comentou. Obtemos os resultados e
axustes da figura @fig:g_0

== Conductancia intrínseca

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

== Fluxo total

Agora podemos realizar os axustes ás ecuacións @ec:equivalente @ec:independente.

#{
    set align(center)
    table(
        columns: 4,
        stroke: none,
        table.hline(),
        table.header([Modelo], [a], [b], [m]),
        table.hline(stroke: 0.6pt),
        [Equiv.], valor("a_fluxo_total_eq"), valor("b_fluxo_total_eq"), valor("m_fluxo_total_eq"),
        [Indep.], valor("a_fluxo_total_in"), valor("b_fluxo_total_in"), valor("m_fluxo_total_in"),
        table.hline(),
    )
}

#figure(
    image("/figuras/axuste_fluxo_total.pdf"),
    caption : [Axuste no caso de fluxo total.]
) <fig:axuste-total>

== Fluxo parcial

#{
    set align(center)
    table(
        columns: 4,
        stroke: none,
        table.hline(),
        table.header([Modelo], [a], [b], [m]),
        table.hline(stroke: 0.6pt),
        [Equiv.], valor("a_fluxo_parcial_eq"), valor("b_fluxo_parcial_eq"), valor("m_fluxo_parcial_eq"),
        [Indep.], valor("a_fluxo_parcial_in"), valor("b_fluxo_parcial_in"), valor("m_fluxo_parcial_in"),
        table.hline(),
    )
}

#figure(
    image("/figuras/axuste_fluxo_parcial.pdf"),
    caption : [Axuste no caso de fluxo parcial.]
) <fig:axuste-parcial>

== Fluxo nulo

#{
    set align(center)
    table(
        columns: 4,
        stroke: none,
        table.hline(),
        table.header([Modelo], [a], [b], [m]),
        table.hline(stroke: 0.6pt),
        [Equiv.], valor("a_fluxo_nulo_eq"), valor("b_fluxo_nulo_eq"), valor("m_fluxo_nulo_eq"),
        [Indep.], valor("a_fluxo_nulo_in"), valor("b_fluxo_nulo_in"), valor("m_fluxo_nulo_in"),
        table.hline(),
    )
}

#figure(
    image("/figuras/axuste_fluxo_nulo.pdf"),
    caption : [Axuste no caso de fluxo nulo.]
) <fig:axuste-nulo>

== Comparativa

#figure(
    caption: [
        Comparativa dos distindos modelos nas experiencias con fluxo total,
        parcial e nulo (por filas)
    ],
    {
        set align(center)
        set text(size:0.9em)
        table(
            columns: 5,
            stroke: none,
            align: (center + horizon, left + horizon, right + horizon, right + horizon, right),
            table.hline(),
            table.header([],[Modelo], [a], [b], [m]),
            table.hline(stroke: 0.6pt),
            table.cell(x:0, y:1, rowspan:2, rotate(-90deg, reflow:true, [Total])),
            table.cell(x:0, y:3, rowspan:2, rotate(-90deg, reflow:true, [Parcial])),
            table.cell(x:0, y:5, rowspan:2, rotate(-90deg, reflow:true, [Nulo])),
            [Equiv.] , valor("a_fluxo_total_eq") , valor("b_fluxo_total_eq") , valor("m_fluxo_total_eq") ,
            [Indep.] , valor("a_fluxo_total_in") , valor("b_fluxo_total_in") , valor("m_fluxo_total_in") ,
            table.hline(stroke: 0.2pt + luma(60%)),
            [Equiv.] , valor("a_fluxo_parcial_eq") , valor("b_fluxo_parcial_eq") , valor("m_fluxo_parcial_eq") ,
            [Indep.] , valor("a_fluxo_parcial_in") , valor("b_fluxo_parcial_in") , valor("m_fluxo_parcial_in") ,
            table.hline(stroke: 0.2pt + luma(60%)),
            [Equiv.] , valor("a_fluxo_nulo_eq") , valor("b_fluxo_nulo_eq") , valor("m_fluxo_nulo_eq") ,
            [Indep.] , valor("a_fluxo_nulo_in") , valor("b_fluxo_nulo_in") , valor("m_fluxo_nulo_in") ,
            table.hline(),

        )
    }
)
