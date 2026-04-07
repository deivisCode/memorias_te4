= Resultados
== Conceptos

Como xa se comentou, no laboratorio imos obter datos da forma da figura @fig:exemplo_datos. Os datos orixinais están nunha serie de aproximadamente \~8000 canles, pero é preciso combinalos#footnote[En inglés, _rebinning_.] en clases (véxase $section 3.3.3$@tratamento), proceso que usando @couto se fai automáticamente en clases de 10 elementos. Todos os espectros tratados usan este _rebinning_ e tamén a taxa de contas por unidade de tempo. Móstrase un exemplo orientativo dos datos crus que devolve o ordenador do laboratorio ma figura @fig:exemplo_datos

#figure(
    image(
        // :FACER: comezar grafica no 0
        "/figuras/mostra_cs137_exemplo.pdf"
    ),
    caption : [
        Exemplo orientativo dos datos que obtemos para a mostra de Cesio 137
        FG-A. Nas abcisas, o número da canle do detector e no eixo vertical o
        número de contas de cada canle. Aquí non se mostra nin agrupacións en
        clases nen taxas para mostrar fielmente o que nos devolve o ordenador.
    ]
) <fig:exemplo_datos>
