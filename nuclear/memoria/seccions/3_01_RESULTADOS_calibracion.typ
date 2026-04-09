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

#let csv_cal = {
    sys.inputs.at("csv_calibracion")
        .split(" ")
        .map(x => x.trim("memoria"))
}


#block(
    width: 200%,
    for i in range(csv_cal.len()) {
        set text(size: 0.8em)
        table(
            columns: 8,
            ..csv( csv_cal.at(i) ).at(0).map(x => eval(x)),
            ..csv( csv_cal.at(i) ).slice(1).flatten(),

        )
    }
)
