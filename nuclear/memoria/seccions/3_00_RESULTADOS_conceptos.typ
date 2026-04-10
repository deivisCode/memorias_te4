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
de Compton co fondo de radiación natural do entorno, polo que axustaremos unha
función do tipo @ec:pico_xenerico

$
    f(x) = a dot exp([(x-mu)/sigma]^2) + "Fondo"(x).
$ <ec:pico_xenerico>

O propio chan, paredes e
teitos, con materiais de orixe mineral; a base do edificio, e o subsolo de roca
granítica do monte da Condesa; ata raios cósmicos, procedentes dos espazo
profundo #footnote[Pouco probable, pois teñen unha ocorrencia estimada de un
suceso por século. Fonte: paneis informativos do `IGFAE`] e máis probablemente,
do noso propio Sol. O caso da radiación con orixe na base rochosa do solo, é
especialmente relevante en Galiza, sendo este famoso pola abundancia de Radón
do chao. Segundo o datos oficiais#footnote[Laboratorio de Radón de Galiza:
#link("https://radon.gal/")], no concello de Santiago, de tódalas medidas
feitas do chan máis do 10% presentaron unha actividade de máis de 300
$"Bq"\/"m"^3$.

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

Consideramos esta tanda de datos foi unha falla do detector asique usei o fondo
medido co mesmo detector por unha compañeira do noso grupo, Laura Pereira, xa
que en principio o fondo non debería variar moito entre sesións. Pode verse un
exemplo do fondo _correcto_ na figura @fig:fondo_bo.

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


Este fondo de radiación ten máis relevancia a enerxías menores onde presenta un
comportamento exponencial; a enerxías altas o fondo é menor e pode aproximarse
en principio por un modelo polinomial. É dicir, a función da ecuación
@ec:pico_xenerico pode expandirse como

$
    f(x) = a dot exp([(x-mu)/sigma]^2) + b dot exp(-b x)
$ <ec:ruido_exponencial>

no caso de baixas enerxías e como

$
    f(x) = a dot exp([(x-mu)/sigma]^2) + b x + c
$ <ec:ruido_lineal>

a altas enerxías. Por motivos técnicos @couto é posible buscar un punto
intermedio cunha aproximación cuadrática $"Fondo"(x) = a + b x + c x^2$ en
_todo punto_, pero ten a desvantaxe de que nos extremos de enerxías moi altas
ou moi baixas pode non ser posible atopar numéricamente os parámetros
optimizados $a,b,c$ do fondo ou os do pico gausiano $a, mu, sigma$.
