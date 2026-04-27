import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as sco
import gardadato as gd

def lineal(x,a,b):
    return a + b*x

def equivalente(theta, a, b, m):
    return np.sqrt( (a + b * np.cos(theta))**m )

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
    sigma = [0.000001] * len(I_intrinseca),
    p0 = (1, 1,),
    absolute_sigma = True
)

a_G_intrinseca, b_G_intrinseca = axuste_G_intrinseca[0]
s_a_G_intrinseca, s_b_G_intrinseca = np.sqrt(np.diag(axuste_G_intrinseca[1]))
G_intrinseca = 1 / b_G_intrinseca
gd.garda_dato("G_0", f"{G_intrinseca:.2e}", 0, "V/A", "/memoria/datos.csv")


figura_1 = plt.figure()
lenzo_1 = figura_1.add_subplot(1,1,1)

x = np.linspace(min(V_intrinseca), max(V_intrinseca), 10)
y = a_G_intrinseca + b_G_intrinseca * x
lenzo_1.plot(x, y, linestyle = '-', marker = '', color = 'gray', label = "Axuste")
lenzo_1.plot(
    V_intrinseca,
    I_intrinseca,
    linestyle = '',
    marker = 'd',
    color = 'red',
    label = "Datos experimentais"
)
lenzo_1.set(xlabel="Voltaxe [V]", ylabel=r"Intensidade [$\mu$A]")

figura_1.legend()
figura_1.savefig("memoria/figuras/axuste_G_intrinseca.pdf")

##############################################################################
##############################################################################

datos_fluxo_ambiental_total = np.loadtxt(
    "datos/fluxo_ambiental_total.dat",
    delimiter = ','
)

I_fluxo_ambiental_total = datos_fluxo_ambiental_total[0] * 10 ** (-6)
A_fluxo_ambiental_total = datos_fluxo_ambiental_total[1] * np.pi / 180
V_fluxo_ambiental_total = datos_fluxo_ambiental_total[2]

G_fluxo_ambiental_total = I_fluxo_ambiental_total / V_fluxo_ambiental_total

axuste_fluxo_ambiental_total = sco.curve_fit(
    equivalente,
    A_fluxo_ambiental_total,
    G_fluxo_ambiental_total,
    sigma = [0.000001] * len(A_fluxo_ambiental_total),
    p0 = (-0.000003,-0.00005,1),
)
