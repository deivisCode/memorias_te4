#import("/estilo_memoria.typ"): *
= Introducción

Todo o traballo está versionado en
#link(
    "https://github.com/deivisCode/memorias_te4",
    text(size: 0.8em, baseline: -1pt, simbolos[]) + underline[ deivisCode/memorias_te4],
)
cos datos, análises, e cambios de calquera parte do proxecto ao longo do tempo.

Nesta práctica traballaremos o efecto da _fotocontuctividade_. Un material
semicondutor está caracterizado pola existencia dun espazo#footnote[En inglés,
_gap_.] entre a banda de valencia (#smallcaps[BV]) e a de condución
#smallcaps[BC], suficientemente pequena como para que distintos efectos
(térmicos, ambientais, etc.) despracen un electrón de valencia á capa
condutora.

Seguindo literalmente o guión da práctica @guion sabemos que o exceso de carga
pode obterse mediante dous modelos:

+ Supoñendo que o fluxo radiante total $phi.alt_t$ é directamente a suma dos
  fluxos ambientais e da lámpada $phi.alt_a + phi.alt_l$. Este modelo chámase
  _equivalente_. Obtense, seguindo o guión,

  $
      G - G_0 = Delta G = sqrt((a + b cos(theta)^2)^m), \
      a := phi.alt_a ((alpha^2 beta)/gamma)^(1\/m),
      space
      b := phi.alt_0 ((alpha^2 beta)/gamma)^(1\/m).
  $ <ec:equivalente>


+ Supoñendo que podemos calcular a xeración en exceso do fluxo ambiental e da
  lámpada de modo independente e logo sumalas. Modelo _independente_. Obtense

  $
      G - G_0 = Delta G = sqrt(a^m)  + sqrt((b cos(theta)^2)^m) \
      a := phi.alt_a ((alpha^2 beta_a)/gamma_a)^(1\/m),
      space
      b := phi.alt_b ((alpha^2 beta_b)/gamma_b)^(1\/m).
  $ <ec:independente>

As ecuacións @ec:equivalente e @ec:independente non son iguais, polo que temos
dous modelos que poden describir, a priori, ben ou mal, o experimento que
fagamos. Seguindo o guión outra vez, sabemos que tanto $m$ coma $b$ non
deberían cambiar para unha mesma medición.

Esta memoria, entón, consiste nos seguintes puntos:

+ Obter $a,b,m$ para o modelo _equivalente_ e o modelo _independente_. Faremos
  isto mediante axustes ás ecuacións @ec:equivalente e @ec:independente usando
  o paquete
  `curve_fit`~#footnote[https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.curve_fit.html#curve-fit]
  de Python, mediante un modelo de mínimos cadrados usual, seguindo as notas de
  @tratamento.

+ $b, m$ debería ser o mesmo para un certo modelo, polo que podemos ver que
  modelo fixa ambos parámetros mellor.
