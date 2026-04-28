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
    print(f"theta: {theta}")
    print(f"a: {a}")
    print(f"b: {b}")
    print(f"m: {m}")
    print(f"coseno: {coseno}")
    print(f"b * coseno: {bcoseno}")
    print(f"a + b * coseno: {a_bcoseno}")
    return np.sqrt(a_bcoseno**m)

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
gd.garda_dato("G_0"         , f"{G_intrinseca:.2e}"   , 0 , "V/A"     , "/memoria/datos.csv")
gd.garda_dato("ordeada_G_0" , f"{a_G_intrinseca:.2e}" , 0 , "uA" , "/memoria/datos.csv")

figura_1 = plt.figure()
lenzo_1 = figura_1.add_subplot(1,1,1)

x = np.linspace(min(V_intrinseca), max(V_intrinseca), 10)
y = a_G_intrinseca + b_G_intrinseca * x
lenzo_1.plot(x, y, linestyle = '-', marker = '', color = 'gray', label = "Axuste")
lenzo_1.plot(V_intrinseca, I_intrinseca, linestyle = '', marker = 'd', color = 'red', label = "Datos")
lenzo_1.set(xlabel="Voltaxe [V]", ylabel=r"Intensidade [$\mu$A]")

figura_1.legend()
figura_1.savefig("memoria/figuras/axuste_G_intrinseca.pdf")

##############################################################################
##############################################################################
quit()

datos_fluxo_ambiental_total = np.loadtxt(
    "datos/fluxo_ambiental_total.dat",
    delimiter = ','
)

parte = slice(1, len(datos_fluxo_ambiental_total[0])-2)

I_fluxo_ambiental_total = datos_fluxo_ambiental_total[0][parte] * 10 ** (-6)
A_fluxo_ambiental_total = datos_fluxo_ambiental_total[1][parte] * np.pi / 180
V_fluxo_ambiental_total = datos_fluxo_ambiental_total[2][parte]

G_fluxo_ambiental_total = I_fluxo_ambiental_total / V_fluxo_ambiental_total

axuste_fluxo_ambiental_total = sco.curve_fit(
    equivalente,
    A_fluxo_ambiental_total,
    G_fluxo_ambiental_total,
    # sigma = [0.000001] * len(A_fluxo_ambiental_total),
    p0 = (0.000003,G_intrinseca,1), # a, b , m
)
