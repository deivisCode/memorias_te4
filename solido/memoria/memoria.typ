#import("/estilo_memoria.typ"): *

#let seccions = {
    include("/seccions/1_00_INTRODUCCION_introduccion.typ")
    include("/seccions/2_00_METODOLOXIA_introducion.typ")
    include("/seccions/2_01_METODOLOXIA_montaxe.typ")
    include("/seccions/2_02_METODOLOXIA_procedemento-experimental.typ")
    include("/seccions/3_00_RESULTADOS_introducion.typ")
}

#let anexos = {
    include("/seccions/4_00_ANEXOS_datos.typ")
}

#crear_memoria(
    titulo        : [Fotoconductividade\ Memoria de Laboratorio],
    autoria       : ((nome:"David Cotelo Varela"),),
    correo        : "david.cotelo@rai.usc.es",
    github        : "deivisCode/memorias_te4",
    grupo         : "6",
    documento     : seccions,
    anexos        : anexos,
    contraportada : false,
    bibliografia  : true,
)
