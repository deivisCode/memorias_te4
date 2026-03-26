#import("/estilo_memoria.typ"): *


#let seccions = {
    include("/seccions/1_00_INTRODUCCION_introduccion.typ")
    include("/seccions/2_00_METODOLOXIA_conceptos.typ")
    include("/seccions/2_01_METODOLOXIA_calibracion.typ")
    include("/seccions/2_02_METODOLOXIA_eficiencia.typ")
    include("/seccions/2_03_METODOLOXIA_proceso-experimental.typ")
    include("/seccions/3_00_RESULTADOS_conceptos.typ")
    include("/seccions/3_01_RESULTADOS_calibracion.typ")
    include("/seccions/3_02_RESULTADOS_resolucion.typ")
    include("/seccions/3_03_RESULTADOS_eficiencias.typ")
    include("/seccions/3_04_RESULTADOS_compton.typ")
    include("/seccions/3_05_RESULTADOS_seccion-eficaz.typ")
    include("/seccions/4_00_ANEXOS_datos-mostras.typ")
    include("/seccions/4_01_ANEXOS_actividades.typ")
    include("/seccions/4_02_ANEXOS_datos-detector-cristal.typ")
    include("/seccions/4_03_ANEXOS_tratamento-datos.typ")
    include("/seccions/4_04_ANEXOS_graficas-extra.typ")
}


#crear_memoria(
    titulo        : [Compton\ Memoria de Laboratorio],
    autoria       : ((nome:"David Cotelo Varela"),),
    correo        : "david.cotelo@rai.usc.es",
    github        : "deivisCode/memorias_te4",
    grupo         : "7",
    documento     : seccions,
    contraportada : false,
    bibliografia  : false,
)
