= Metodoloxía

== Conceptos

Estudaremos a dispersión de Compton de fotóns dunha fonte radioactiva de
Cesio137 sobre un bloque cilíndrico de metacrilato. Para a detección usamos un
detector centellador (especificacións nos anexos) que mide os pulsos dun dun
fotodetector; ditos pulsos son aplificados e logo os sinais sepáranse por
canles e cárganse nun ordenador automáticamente en forma de Contas/nºCanle.

Como exemplo dos datos que temos á nosa disposición véxase a figura
@fig:exemplo_datos

#figure(
    image(
        // :FACER: grafica pero que non sexa de tasa
        // :FACER: comezar grafica no 0
        "/figuras/mostra_cs137_PLOT.pdf"
    ),
    caption : [
        Exemplo orientativo dos datos que obtemos da montaxe experimental
        usando a fonte de Cesio. Nas abcisas, o número da canle do detector e
        no eixo a taxa de deteccións por unidade de tempo. En realidade, todas
        as gráficas deste traballo presentan unha agrupación en clases de 15
        elementos#footnote[En inglés, _rebining_.], tema que trataremos máis
        adiante.
    ]
) <fig:exemplo_datos>

O traballo de laboratorio consiste, pois, nos puntos:
-  *Calibración* do detector, xa que necesitamos unha relación entre os canles
   e a enerxía dos fotóns.
- *Eficiencia* do detector, xa que non todos os fotóns emitidos chegan ao
  detector nin depositan nel súa enerxía.
- *Disperión Compton*, onde realizamos a propia experiencia de Compton.

Imos ver unhas notas sobre estes puntos.
