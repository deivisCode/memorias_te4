== Eficiencia

Queremos coñecer a eficiencia do detector, intrínseca a súa contrucción e funcionamento.

Temos en conta que so unha parte da radiación alcanza o detector e so unha
fracción desta é contada. O cociente

$
    epsilon = "Contas medidas" / "Fotóns emitidos"
$ <ec:eficiencia_total>

é a eficiencia total da medición e pode desglosarse no produto de dúas eficiencias
independientes que chamamos $epsilon_x$, ou eficiencia *x*#h(0pt)eométrica, e
$epsilon_i$, ou eficiencia *i*#h(0pt)ntrínseca do detector, definidas como

$
    epsilon_x = "Contas que alcanzan o detector" / "Fotóns emitidos",
    \
    epsilon_i = "Contas medidas" / "Contas que alcanzan o detector".
$

É dicir,

$
    epsilon = epsilon_g epsilon_i.
$

A eficiencia xeométrica é a medida na que os fotóns emitidos poden alcanzar
unha certa rexión do espazo. Supoñendo que a fonte é puntual a propagación é
perfectamente isotrópica, e tamén supoñemos que o detector é unha sección
cilíndrica perfectamente aliñada ca fonte. Entón, $epsilon_x$ non é mais ca o
cociente $A'\/A$ sendo $A$ a área da esfera imaxinaria centrada na fonte e $A'$
a sección de dita esfera que corresponde ao detector (véxase a figura de
referencia @fig:cap_esferico).

#figure(
    image(
        "/imaxes/Spherical_cap_diagram.tiff.png",
    ),
    caption : [
        Esquema dunha sección esférica que pode aproximar a cara do detector.
        Fonte: Wikimedia Commons CC BY-SA 4.0, imaxe de Jhmadden.
    ]
) <fig:cap_esferico>

Sendo $d$ a distancia
detector fonte, $R_D$ o suposto radio do detector, e $theta$ o ángulo que
abrangue a sección do detector dentro da esfera imaxinaria, obtemos a mesma
relación exposta na ecuación 11 de @n9_instru,

$
    epsilon_x = A'/A =&
    (2 pi d^2 (1 - cos(theta))) /
    (4 pi d^2)
    \
    =& 1/2 (1-d^2/(sqrt(d^2 + R_D^2)))
$ <ec:eficiencia_xeometrica>

Para poder calcular $epsilon_x$ é posible medir as contas arredor de certo
fotopico a distintas distancias para axustar a ecuación
@ec:eficiencia_xeometrica. Se a ecuación @ec:eficiencia_xeometrica é correcta
entón debemos ter en conta o decaemento polinómico da eficiencia ca distancia,
polo que non podemos colocar o detector demasiado lexos da fonte.

A eficiencia total $epsilon$ pode ser calculada directamente a partir da fórmula

$
    A(t) = A_0 exp(- t ln(2)/(T_(1\/2))),
$ <ec:actividade>

sendo $t$ o tempo dende a última medición da actividade da mostra (polo xeral,
varios anos), $A_0$ a actividade naquel momento, e $T_(1\/2)$ o tempo de vida
medio da mostra. Tendo $A(t)$ (fotóns emitidos totais, teóricamente) máis as
contas experimentais arredor dos fotopicos (contas medidas), temos os valores
necesarios para a ecuación @ec:eficiencia_total. Finalmente, xunto coa ecuación
@ec:eficiencia_xeometrica podemos obter a eficiencia intrínseca do detector
como

$ epsilon_i = epsilon / epsilon_g = f(E,d), $

onde explicito que dita eficiencia será unha función da distancia $d$ (debido a
$epsilon_x$) máis da enerxía E dos fotopicos (debido á eficiencia $epsilon$).
