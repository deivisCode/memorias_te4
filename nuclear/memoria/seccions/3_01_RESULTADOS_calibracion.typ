== Calibración

Móstranse os axustes a diversos picos das mostras que usamos para a calibración.

#let fig_cal = {
    sys.inputs.at("figuras_fits_calibracion")
        .split(" ")
        .map(x => x.trim("memoria"))
}

#for i in range(fig_cal.len()) {
    figure(
        image( fig_cal.at(i) ),
        caption: fig_cal.at(i).trim("/figuras/").trim(".pdf")
    )
}

Agora, na mesma orde, os parámetros axustados dos picos simples gausianos.
Táboas con varias filas refírense aos varios picos considerados. $p_3, mu, sigma$
da ecuación

$
    f(x) = p_3 dot exp([(x-mu)/sigma]^2) + "Fondo"(x).
$

sendo $"Fondo"(x) = a + b x + c x^2$ (parámetros intermedios calculados, pero
que non se mostran).

#let csv_cal = {
    sys.inputs.at("csv_calibracion")
        .split(" ")
        .map(x => x.trim("memoria"))
}

#for i in range(csv_cal.len()) {
    set text(size: 0.8em)
    // [#csv(csv_cal.at(i)).slice(1)]
    figure(
        table(
            // columns: (1fr, 1fr, 1fr, 1fr, 1fr),
            columns: (1fr, 1fr, 1fr, 1fr, 1fr),
            stroke: none,
            table.hline(),
            ..csv( csv_cal.at(i) )
                .at(0)    // encabezados
                .slice(3) // 4 últimos valores
                .map(x => eval(x)),
            table.hline(stroke: 0.6pt),
            ..csv( csv_cal.at(i) )
                .slice(1)             // valores
                .map(x => x.slice(3)) // pero so os 4 últimos (son varias filas, por eso o map)
                .flatten(),
            table.hline(),
        ),
        caption: csv_cal.at(i).trim("/datos/").trim(".csv")
    )
    v(1em)
}
