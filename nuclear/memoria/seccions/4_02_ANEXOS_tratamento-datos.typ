== Tratamento de datos <sec:tratamento>

É preciso facer varios comentarios sobre as incertezas dos datos. Temos por
separado as propias variables de medición, as variables derivadas e os axustes.

=== Medidas directas <sec:medidas-directas>

Estas son as medidas que se tomaron directamente no laboratorio.

*Posición:* Medimos todas as posicións cunha regra de construción con escala
milimétrica equispaciada e uniforme. Podemos supor que unha medida con dita
regra a función de probabilidade é unha distribución triangular e
simétrica#footnote[Simétrica porque en principio non hai motivo para supor que
a regra ten ningún sesgo ao medir], o cal é típico para aparellos de medición
deste tipo. Seguindo @amigo sabemos que $sigma^2 = a^2\/6$ sendo $a$ a
resolución do aparello de medida, neste caso 1mm. Entón, $sigma_"posición" =
1\/sqrt(6)$ mm.

*Ángulo:* As medidas fanse directamente usando as marcas furadas no taboleiro
de madeira que suxeita o detector e a pantalla colimadora. Por ser unha medida
_espacial_ a suposición é a mesma que no caso anterior: tomo unha distribución
triangular cunha resolución de 10º (debido ao espazado das marcas máis á
dificultade de aliñar detector-dispersor-colimador) obtendo $sigma_"ángulo" =
10\/sqrt(6)$ graos.

*Tempo:* O tempo entre contas é unha medida automática do software de medición
que se exporta directamente ao ficheiro de datos `.mca`. Como tal, podemos
supor que o único que inflúe é a propia estadística. Supoño unha distribución
uniforme dada a suposición de que o aparello é perfecto; seguindo a @amigo,
$sigma^2 = a\/sqrt(3) $, e tomando unha resolución de 1s temos que
$sigma_"tempo" = 1\/sqrt(3)$ s.

*Contas:* Supoñendo que temos un número alto de contas $N$ (no noso caso é
correcto) a emisión radioactiva sigue unha distribución de Poisson (véxase
$section$2.6.3~@tratamento) temos que $sigma_"contas" = sqrt(N)$
contas.#footnote[Profesor, canto tempo temos que medir..?]

=== Medidas derivadas simples

A totalidade de magnitudes que aparecen neste traballo e non están na sección
@sec:medidas-directas son medidas derivadas. Sin embargo, separo entre as
_simples_, que se calculan directamente cunha función relativamente sinxela e
cuxa incerteza ven dada por @ec:propagacion; e os _axustes_, para os cales uso
un sistema completamente diferente (explicado máis adiante).

En calquera caso, as magnitudes derivadas son simplemente magnitudes calculadas
como función doutras magnitudes. No caso simple, sua incerteza ven dada polas
fórmulas usuais de propagación de erros @tratamento @amigo. Sendo $f=f(x_1,
dots, x_k)$ unha magnitude función doutras $k$ distintas (que supoño _non_
correlacionadas) cada unha con incerteza $sigma_(x_i)$, entón

$
    sigma^2_(f) = sum^k_(i=1) ((partial f)/(partial x_i) sigma_(x_i))^2.
$ <ec:propagacion>


As magnitudes derivadas simples deste traballo son:

// :FACER: incerteza actividade unidade
*Actividades:* Segundo a información das actividades orixinais da táboa
@tab:datos-mostras máis a fórmula de decaemento @ec:actividade. En principio,
debería usar a fórmula @ec:propagacion, pero os datos das mostrar non teñen
incertezas. Unha posible solución é supor unha $sigma_"actividade" = 1$ Bq.

*Número de contas reducido:* Non é máis que o número de contas nun certo tempo,
que chamarei $n$. Na ecuación @ec:propagacion usamos $n=N\/t=f(t, N)$ obtendo

$
    sigma_n = sqrt(
        (1/t sigma_"contas")^2
        +
        (N/(t^2) sigma_"tempo")^2
    ).
$

=== Axustes

Algunhas magnitudes derivadas son máis complexas e non nos chega considerar o
caso simple e intuitivo da ecuación @ec:propagacion. Nesta práctica fixo falla
realizar unha gran serie de axustes a funcións non lineais cun programa
personalizado de python, `mca-tools`, feito por un dos nosos compañeiros, Diego
Couto @couto. Todos os axustes a funcións gaussianas máis fondo de radiación
polinómico foron calculados polo programa `mca-tools`. Detrás de cámaras este
programa fai uso do paquete
`curve_fit`#footnote[https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.curve_fit.html#curve-fit]
de Python, o cal se usa para axustar unha función arbitraria $f$ a unha serie
de puntos usando o método de mínimos cadrados usual. `curve_fit` devolve unha
matriz de covarianzas dos parámetros usados para axustar $f$. Este método é
entendible e semellante ao resto de cálculo de incertezas da práctica.

A maiores, o programa `mca-tools` tamén nos devolve o valor $chi^2$ reducida,
$chevron.l chi^2 chevron.r$, para cada axuste, usando as fórmulas de
@tratamento. Recordemos que o valor de $chevron.l chi^2 chevron.r$ é a
normalización de $chi^2$, que non é máis ca unha medida da confianza dos nosos
resultados $section 3.3$~@tratamento. Podemos consultar as táboas do anexo A.2
de @tratamento para seleccionar niveis de confianza razoables en función do
número $chevron.l chi^2 chevron.r$ máis do número de graos de liberdade do
sistema.
