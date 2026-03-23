#import("/estilo_memoria.typ"): *


#let seccions = {
    include("/seccions/1_introduccion.typ")
    include("/seccions/2_procedemento_experimental.typ")
    include("/seccions/3_resultados.typ")
    include("/seccions/4_conclusions.typ")
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
    anexos        : include("/seccions/5_anexos.typ")
)
