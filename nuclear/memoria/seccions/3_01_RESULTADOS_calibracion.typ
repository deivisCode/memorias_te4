== Calibración <sec:resultados:calibracion>
// :FACER: o das táboas, pa un paquete

Móstranse os axustes a diversos picos das mostras que usamos para a calibración.

#let fig_cal = {
    sys.inputs.at("figuras_fit_calibracion")
        .split(" ")
        .map(x => x.trim("memoria"))
}

#for i in range(fig_cal.len()) {
    figure(
        image( fig_cal.at(i) ),
        caption: fig_cal.at(i).trim("/figuras/").trim(".pdf")
    )
}

En todas as figuras anteriores usouse @couto considerando un fondo polinómico.
Un mellor axuste debería contar cun fondo exponencial.


$
    f(x) = p_3 dot exp([(x-mu)/sigma]^2) \
    + p_0 + p_1 x + p_2 x^2
$

#let csv_cal = {
    sys.inputs.at("csv_calibracion")
        .split(" ")
        .map(x => x.trim("memoria"))
}

Primeiro, os axustes ás gaussianas.

#for i in range(csv_cal.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_cal.at(i) )
                .at(0)
                .slice(3,6)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_cal.at(i) )
                .slice(1)
                .map(x => x.slice(3,6))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            Constantes $p_3, mu, sigma$ da Gaussiana
            #raw(str(csv_cal.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}

Os parámetros do fondo polinómico son os das seguintes táboas.

#for i in range(csv_cal.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_cal.at(i) )
                .at(0)
                .slice(0,3)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_cal.at(i) )
                .slice(1)
                .map(x => x.slice(0,3))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            Constantes $p_0, p_1, p_2$ do fondo polinómico axustado de
            #raw(str(csv_cal.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}

Finalmente, os cálculos de $chi^2$ e os p-valores para todos os picos.

#for i in range(csv_cal.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_cal.at(i) )
                .at(0)
                .slice(6,8)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_cal.at(i) )
                .slice(1)
                .map(x => x.slice(6,8))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            $chi^2$ e p-valores de
            #raw(str(csv_cal.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}

- *FALTA*: escoller as enerxías da base de datos do
  #link("https://www.nndc.bnl.gov/nudat3/")[nndc]
- *FALTA*: repetir análise engadindo os picos de enerxía esperados
- *FALTA*: obter relacion @ec:enerxia_canle. É de esperar unha relación lineal
  da forma $E = a dot "canal" + b$
- *FALTA*: Posiblemente repetir todo o anterior _non_ usando o Europio, por
  recomendación do propio profesorado.
