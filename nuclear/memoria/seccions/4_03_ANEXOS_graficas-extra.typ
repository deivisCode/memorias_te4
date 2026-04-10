#pagebreak()
== Gráficas extra

=== Espectros para as calibracións

#columns({
    let fig_plot_cal = {
        sys.inputs.at("figuras_plot_calibracion")
            .split(" ")
            .map(x => x.trim("memoria"))
    }
    for i in range(fig_plot_cal.len()) {
        figure(
            image( fig_plot_cal.at(i) ),
            caption: fig_plot_cal.at(i).trim("/figuras/").trim(".pdf")
        )
    }
})

#pagebreak()
=== Espectros para os ángulos de Compton
#columns({
    let fig_plot_ang = {
        sys.inputs.at("figuras_plot_angulos")
            .split(" ")
            .map(x => x.trim("memoria"))
    }
    for i in range(fig_plot_ang.len()) {
        figure(
            image( fig_plot_ang.at(i) ),
            caption: fig_plot_ang.at(i).trim("/figuras/").trim(".pdf")
        )
    }
})
