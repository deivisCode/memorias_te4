== Compton

Usamos a fonte de Cesio 137 FG-A (véxase a táboa @tab:datos-mostras) e seguimos
o comentado na metodoloxía.

- *FALTA*: espectros con dispersor (cambiar canles-> enerxía ca relación
  @ec:enerxia_canle)
- *FALTA*: espectros sen dispersor
- *FALTA*: espectros compton (resta)
- *FALTA*: axuste @ec:compton. $E' = f(theta)$, axustando $E$ e $theta_0$

Axustes para os ángulos.

- *FALTA*: facelo para _todos_ os picos relevantes. Fai falla usar fondo
  exponencial ou é imposible axustar

#let fig_fit_ang = {
    sys.inputs.at("figuras_fit_angulos")
        .split(" ")
        .map(x => x.trim("memoria"))
}
#for i in range(fig_fit_ang.len()) {
    figure(
        image( fig_fit_ang.at(i) ),
        caption: [
            Axuste para os datos \
            #fig_fit_ang.at(i).trim("/figuras/").trim(".pdf")
        ]
    )
}

Resultados dos axustes

#let csv_angulos = {
    sys.inputs.at("csv_angulos")
        .split(" ")
        .map(x => x.trim("memoria"))
}

#for i in range(csv_angulos.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_angulos.at(i) )
                .at(0)
                .slice(3,6)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_angulos.at(i) )
                .slice(1)
                .map(x => x.slice(3,6))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            Constantes $p_3, mu, sigma$ da Gaussiana para
            #raw(str(csv_angulos.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}

Parámetros do fondo polinómico

#for i in range(csv_angulos.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_angulos.at(i) )
                .at(0)
                .slice(0,3)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_angulos.at(i) )
                .slice(1)
                .map(x => x.slice(0,3))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            Constantes $p_0, p_1, p_2$ do fondo polinómico axustado de
            #raw(str(csv_angulos.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}

Finalmente, os Chi e p-valores

#for i in range(csv_angulos.len()) {
    v(1em)
    figure(
        table(
            columns: (1fr, 1fr),
            stroke: none,
            table.hline(stroke: 0.3pt),
            ..csv( csv_angulos.at(i) )
                .at(0)
                .slice(6,8)
                .map(x => eval(x)),
            table.hline(stroke: 0.3pt + luma(80%)),
            ..csv( csv_angulos.at(i) )
                .slice(1)
                .map(x => x.slice(6,8))
                .flatten(),
            table.hline(stroke: 0.3pt),
        ),
        caption: [
            $chi^2$ e p-valores de
            #raw(str(csv_angulos.at(i).trim("/datos/").trim(".csv")))
        ]
    )
}
