= Resultados
== Conceptos

Como xa se comentou, no laboratorio imos obter datos da forma da figura
@fig:exemplo_datos. Os datos orixinais están nunha serie de aproximadamente
\~8000 canles, pero é preciso combinalos#footnote[En inglés, _rebinning_.] en
clases (véxase $section 3.3.3$@tratamento), proceso que usando @couto se fai
automáticamente en clases de 10 elementos. Todos os espectros tratados usan
este _rebinning_ e tamén a taxa de contas por unidade de tempo. Móstrase un
exemplo orientativo dos datos crus que devolve o ordenador do laboratorio na
figura @fig:exemplo_datos

#figure(
    image(
        "/figuras/mostra_cs137_exemplo.pdf"
    ),
    caption : [
        Exemplo orientativo dos datos que obtemos para a mostra de Cesio 137
        FG-A. Nas abcisas, o número da canle do detector e no eixo vertical o
        número de contas de cada canle. Aquí non se mostra nin agrupacións en
        clases nen taxas para mostrar fielmente o que nos devolve o ordenador.
    ]
) <fig:exemplo_datos>

Na figura @fig:exemplo_datos pode verse o _borde de Compton_ arredor da canle
2000, caracterizado un aumento do número de contas cara a rexión do _continuo
de Compton_ (cara a esquerda). Os datos están cortados na canle ~250 que marca
o límitede enerxías máis baixas medibles polo aparello. Existen outros picos
menores arredor da canle 900 posiblemente relacionado a transicións
electrónicas debidas a ionizacións de raios gamma e conversión interna do
Cesio; pero non é posible sabelo sen ter unha relación canle-enerxía. En xeral,
os espectros dos distintos elementos son moi semellantes ao da figura
@fig:exemplo_datos

Hai que engadir que todas as series de datos e análises comparten a radiación
de Compton co fondo de raciación natural do entorno: o propio chan, paredes e
teitos, con materiais de orixe mineral; a base do edificio, e o subsolo de roca
granítica do monte da Condesa; ata raios cósmicos, procedentes dos espazo
profundo #footnote[Pouco probable, pois teñen unha ocorrencia estimada de un
suceso por século. Fonte: paneis informativos do `IGFAE`] e máis probablemente,
do noso propio Sol. O caso da radiación con orixe na base rochosa do solo, é
especialmente relevante en Galiza, sendo este famoso pola abundancia de Radon
do chao. Segundo o datos oficiais#footnote[Laboratorio de Radon de Galiza:
#link("https://radon.gal/")], no concello de Santiago, de tódalas medidas
feitas do chan máis do 10% presentaron unha actividade de máis de 300
$"Bq"\/"m"^3$.

Este fondo de radiación ten máis relevancia a enerxías menores onde presenta un
comportamento exponencial; a enerxías altas o fondo é menor e pode aproximarse
en principio por un modelo polinomial.

Medimos o fondo durante aproximadamente dúas horas na segunda sesión de
laboratorio, obtendo a gráfica @fig:ruido_malo

#figure(
    image(
        "/figuras/ruido_malo.pdf"
    ),
    caption: [
        Fondo de radiación medido o segundo día da práctica. A cantidade de
        contas é inusualmente baixa e a detección comeza arredor da canle 2000.
    ]
) <fig:ruido_malo>

Consideramos que foi unha falla do detector usei o fondo dunha compañeira,
Laura Pereira, que usou o mesmo detector que nós, xa que en principio o fondo
non debería variar moito entre sesións. Pode verse un exemplo do fondo
_correcto_ na figura @fig:fondo_bo.

#figure(
    image(
        "/figuras/ruido_bo.pdf"
    ),
    caption : [
        Fondo de radiación medido no laboratorio pola nosa compañeira. Vese
        claramente que ten un maior efecto a menores enerxías, cunha tendencia
        aproximadamente exponencial. Apréciase un posible pico arredor da canle
        ~250, que pode corresponder a unha emisión natural dalgún elemento
        presente no entorno.
    ]
) <fig:fondo_bo>
