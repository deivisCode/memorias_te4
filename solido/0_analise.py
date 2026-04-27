import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as sco

def lineal(x,a,b):
    return a + b*x

##############################################################################
# CONDUCTIVIDADE INTRÍNSECA ##################################################
##############################################################################
datos_G_intrinseca = np.loadtxt( "datos/G_intrinseca.dat", delimiter = ',')

# Os datos, primeira fila a voltaxe (V), a segunta intensidade (micro A)
V_intrinseca, I_intrinseca = datos_G_intrinseca

axuste_G_intrinseca = sco.curve_fit(lineal, V_intrinseca, I_intrinseca, p0 = (1, 1,), absolute_sigma = True)

a_G_intrinseca, b_G_intrinseca = axuste_G_intrinseca[0]
s_a_G_intrinseca, s_b_G_intrinseca = np.sqrt(np.diag(axuste_G_intrinseca[1]))

figura_1 = plt.figure()
lenzo_1 = figura_1.add_subplot(1,1,1)

x = np.linspace(min(V_intrinseca), max(V_intrinseca), 10)
y = a_G_intrinseca + b_G_intrinseca * x
lenzo_1.plot(x, y, linestyle = '-', marker = '', color = 'gray', label = "Axuste")
lenzo_1.plot(V_intrinseca, I_intrinseca, linestyle = '', marker = 'd', color = 'red', label = "Datos experimentais")
lenzo_1.set(xlabel="Voltaxe [V]", ylabel=r"Intensidade [$\mu$A]")

figura_1.legend()
figura_1.savefig("memoria/figuras/axuste_G_intrinseca.pdf")

##############################################################################
##############################################################################
