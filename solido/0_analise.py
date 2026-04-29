import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as sco
import gardadato as gd

def lineal(x,a,b):
    return a + b*x

def equivalente(theta, a, b, m):
    coseno = np.cos(theta)**2
    bcoseno = b * coseno
    a_bcoseno = a + bcoseno
    return np.sqrt(abs(a_bcoseno)**m)

def independente(theta, a, b, m):
    coseno = np.cos(theta)**2
    bcoseno = b * coseno
    return np.sqrt(abs(a)**m) + np.sqrt(abs(bcoseno)**m)

##############################################################################
# CONDUCTIVIDADE INTRÍNSECA ##################################################
##############################################################################
datos_G_intrinseca = np.loadtxt( "datos/G_intrinseca.dat", delimiter = ',')

# Os datos, primeira fila a voltaxe (V), a segunta intensidade (micro A)
V_intrinseca = datos_G_intrinseca[0]
I_intrinseca = datos_G_intrinseca[1] * 10 **(-6)

axuste_G_intrinseca = sco.curve_fit(
    lineal,
    V_intrinseca,
    I_intrinseca,
    sigma = [0.00002] * len(I_intrinseca),
    p0 = (1, 1,),
    absolute_sigma = True
)

a_G_intrinseca, b_G_intrinseca = axuste_G_intrinseca[0]
s_a_G_intrinseca, s_b_G_intrinseca = np.sqrt(np.diag(axuste_G_intrinseca[1]))
G_intrinseca = b_G_intrinseca
gd.garda_dato("G_0"         , f"{G_intrinseca:.3g}"   , 0 , "V/A"     , "/memoria/datos.csv")
gd.garda_dato("ordeada_G_0" , f"{a_G_intrinseca:.3g}" , 0 , "uA" , "/memoria/datos.csv")

figura_1 = plt.figure()
lenzo_1 = figura_1.add_subplot(1,1,1)

x = np.linspace(min(V_intrinseca), max(V_intrinseca), 10)
y = a_G_intrinseca + b_G_intrinseca * x
lenzo_1.plot(x, y, linestyle="-", marker="", color="gray", label="Axuste")
lenzo_1.plot(V_intrinseca, I_intrinseca, linestyle = '', marker = 'd', color = 'red', label = "Datos")
lenzo_1.set(xlabel="Voltaxe [V]", ylabel=r"Intensidade [$\mu$A]")

figura_1.legend()
figura_1.savefig("memoria/figuras/axuste_G_intrinseca.pdf")

##############################################################################
# FLUXO AMBIENTAL TOTAL ######################################################
##############################################################################

datos_fluxo_ambiental_total = np.loadtxt("datos/fluxo_ambiental_total.dat", delimiter = ',')

parte = slice(0, len(datos_fluxo_ambiental_total[0]))
I_fluxo_ambiental_total = datos_fluxo_ambiental_total[0][parte] * 10 ** (-6)
A_fluxo_ambiental_total = datos_fluxo_ambiental_total[1][parte] * np.pi / 180
V_fluxo_ambiental_total = datos_fluxo_ambiental_total[2][parte]

G_fluxo_ambiental_total = I_fluxo_ambiental_total / V_fluxo_ambiental_total

axuste_fluxo_ambiental_total_eq = sco.curve_fit(
    equivalente,
    A_fluxo_ambiental_total,
    G_fluxo_ambiental_total,
    # sigma = [0.000001] * len(A_fluxo_ambiental_total),
    p0 = (0.00000001, 0.00000001, 1.5,), # a, b , m
)

axuste_fluxo_ambiental_total_in = sco.curve_fit(
    independente,
    A_fluxo_ambiental_total,
    G_fluxo_ambiental_total,
    # sigma = [0.000001] * len(A_fluxo_ambiental_total),
    p0 = (2, 0.00000001, 1.5,), # a, b , m
)

a1_optimizado_eq = axuste_fluxo_ambiental_total_eq[0][0]
b1_optimizado_eq = axuste_fluxo_ambiental_total_eq[0][1]
m1_optimizado_eq = axuste_fluxo_ambiental_total_eq[0][2]

a1_optimizado_in = axuste_fluxo_ambiental_total_in[0][0]
b1_optimizado_in = axuste_fluxo_ambiental_total_in[0][1]
m1_optimizado_in = axuste_fluxo_ambiental_total_in[0][2]

gd.garda_dato("a_fluxo_total_eq", f"{a1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_total_eq", f"{b1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_total_eq", f"{m1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("a_fluxo_total_in", f"{a1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_total_in", f"{b1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_total_in", f"{m1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")

figura_2 = plt.figure()
lenzo_2 = figura_2.add_subplot(1,1,1)
lenzo_2.set(xlabel=r"$\theta$ [rad]", ylabel="$G$ [V / A]")

x = np.linspace(A_fluxo_ambiental_total[0], A_fluxo_ambiental_total[-1], 100)
y_eq = equivalente(x, a1_optimizado_eq, b1_optimizado_eq, m1_optimizado_eq)
y_in = independente(x, a1_optimizado_in, b1_optimizado_in, m1_optimizado_in)
lenzo_2.plot(x, y_eq, linestyle="dashed", marker="", color="green" , label="Equivalente")
lenzo_2.plot(x, y_in, linestyle="dashdot", marker="", color="purple", label="Independente")
lenzo_2.plot(A_fluxo_ambiental_total, G_fluxo_ambiental_total, color="red", label = "Datos")
figura_2.legend()
figura_2.savefig("memoria/figuras/axuste_fluxo_total.pdf")


##############################################################################
# FLUXO AMBIENTAL PARCIAL ####################################################
##############################################################################

datos_fluxo_ambiental_parcial = np.loadtxt("datos/fluxo_ambiental_parcial.dat", delimiter = ',')

parte = slice(0, len(datos_fluxo_ambiental_parcial[0]))
I_fluxo_ambiental_parcial = datos_fluxo_ambiental_parcial[0][parte] * 10 ** (-6)
A_fluxo_ambiental_parcial = datos_fluxo_ambiental_parcial[1][parte] * np.pi / 180
V_fluxo_ambiental_parcial = datos_fluxo_ambiental_parcial[2][parte]

G_fluxo_ambiental_parcial = I_fluxo_ambiental_parcial / V_fluxo_ambiental_parcial

axuste_fluxo_ambiental_parcial_eq = sco.curve_fit(
    equivalente,
    A_fluxo_ambiental_parcial,
    G_fluxo_ambiental_parcial,
    # sigma = [0.000001] * len(A_fluxo_ambiental_parcial),
    p0 = (0.00000001, 0.00000001, 1.5,), # a, b , m
)

axuste_fluxo_ambiental_parcial_in = sco.curve_fit(
    independente,
    A_fluxo_ambiental_parcial,
    G_fluxo_ambiental_parcial,
    # sigma = [0.000001] * len(A_fluxo_ambiental_parcial),
    p0 = (2, 0.00000001, 1.5,), # a, b , m
)

a1_optimizado_eq = axuste_fluxo_ambiental_parcial_eq[0][0]
b1_optimizado_eq = axuste_fluxo_ambiental_parcial_eq[0][1]
m1_optimizado_eq = axuste_fluxo_ambiental_parcial_eq[0][2]

a1_optimizado_in = axuste_fluxo_ambiental_parcial_in[0][0]
b1_optimizado_in = axuste_fluxo_ambiental_parcial_in[0][1]
m1_optimizado_in = axuste_fluxo_ambiental_parcial_in[0][2]

gd.garda_dato("a_fluxo_parcial_eq", f"{a1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_parcial_eq", f"{b1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_parcial_eq", f"{m1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("a_fluxo_parcial_in", f"{a1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_parcial_in", f"{b1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_parcial_in", f"{m1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")

figura_2 = plt.figure()
lenzo_2 = figura_2.add_subplot(1,1,1)
lenzo_2.set(xlabel=r"$\theta$ [rad]", ylabel="$G$ [V / A]")

x = np.linspace(A_fluxo_ambiental_parcial[0], A_fluxo_ambiental_parcial[-1], 100)
y_eq = equivalente(x, a1_optimizado_eq, b1_optimizado_eq, m1_optimizado_eq)
y_in = independente(x, a1_optimizado_in, b1_optimizado_in, m1_optimizado_in)
lenzo_2.plot(x, y_eq, linestyle="dashed", marker="", color="green" , label="Equivalente")
lenzo_2.plot(x, y_in, linestyle="dashdot", marker="", color="purple", label="Independente")
lenzo_2.plot(A_fluxo_ambiental_parcial, G_fluxo_ambiental_parcial, color="red", label = "Datos")
figura_2.legend()
figura_2.savefig("memoria/figuras/axuste_fluxo_parcial.pdf")

##############################################################################
# FLUXO AMBIENTAL NULO #######################################################
##############################################################################

datos_fluxo_ambiental_nulo = np.loadtxt("datos/fluxo_ambiental_nulo.dat", delimiter = ',')

parte = slice(0, len(datos_fluxo_ambiental_nulo[0]))
I_fluxo_ambiental_nulo = datos_fluxo_ambiental_nulo[0][parte] * 10 ** (-6)
A_fluxo_ambiental_nulo = datos_fluxo_ambiental_nulo[1][parte] * np.pi / 180
V_fluxo_ambiental_nulo = datos_fluxo_ambiental_nulo[2][parte]

G_fluxo_ambiental_nulo = I_fluxo_ambiental_nulo / V_fluxo_ambiental_nulo

axuste_fluxo_ambiental_nulo_eq = sco.curve_fit(
    equivalente,
    A_fluxo_ambiental_nulo,
    G_fluxo_ambiental_nulo,
    # sigma = [0.000001] * len(A_fluxo_ambiental_nulo),
    p0 = (0.00000001, 0.00000001, 1.5,), # a, b , m
)

axuste_fluxo_ambiental_nulo_in = sco.curve_fit(
    independente,
    A_fluxo_ambiental_nulo,
    G_fluxo_ambiental_nulo,
    # sigma = [0.000001] * len(A_fluxo_ambiental_nulo),
    p0 = (2, 0.00000001, 1.5,), # a, b , m
)

a1_optimizado_eq = axuste_fluxo_ambiental_nulo_eq[0][0]
b1_optimizado_eq = axuste_fluxo_ambiental_nulo_eq[0][1]
m1_optimizado_eq = axuste_fluxo_ambiental_nulo_eq[0][2]

a1_optimizado_in = axuste_fluxo_ambiental_nulo_in[0][0]
b1_optimizado_in = axuste_fluxo_ambiental_nulo_in[0][1]
m1_optimizado_in = axuste_fluxo_ambiental_nulo_in[0][2]

gd.garda_dato("a_fluxo_nulo_eq", f"{a1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_nulo_eq", f"{b1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_nulo_eq", f"{m1_optimizado_eq:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("a_fluxo_nulo_in", f"{a1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("b_fluxo_nulo_in", f"{b1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")
gd.garda_dato("m_fluxo_nulo_in", f"{m1_optimizado_in:.3g}", 0, "", "/memoria/datos.csv")

figura_2 = plt.figure()
lenzo_2 = figura_2.add_subplot(1,1,1)
lenzo_2.set(xlabel=r"$\theta$ [rad]", ylabel="$G$ [V / A]")

x = np.linspace(A_fluxo_ambiental_nulo[0], A_fluxo_ambiental_nulo[-1], 100)
y_eq = equivalente(x, a1_optimizado_eq, b1_optimizado_eq, m1_optimizado_eq)
y_in = independente(x, a1_optimizado_in, b1_optimizado_in, m1_optimizado_in)
lenzo_2.plot(x, y_eq, linestyle="dashed", marker="", color="green" , label="Equivalente")
lenzo_2.plot(x, y_in, linestyle="dashdot", marker="", color="purple", label="Independente")
lenzo_2.plot(A_fluxo_ambiental_nulo, G_fluxo_ambiental_nulo, color="red", label = "Datos")
figura_2.legend()
figura_2.savefig("memoria/figuras/axuste_fluxo_nulo.pdf")
