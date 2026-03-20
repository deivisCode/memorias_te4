import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as sco

ficheiros_mostras = [
    "mostra_cs137.mca",
    "mostra_na22.mca",
    "mostra_co60.mca",
    "mostra_eu152.mca",
    "mostra_bi207.mca"
]

datos = []

for nome in ficheiros_mostras:
    with open(nome, "r") as f:
        contidos = f.read()
        contidos = contidos.split("<<DATA>>")[1] # Todo despois de <<DATA>>
        contidos = contidos.split("<<END>>")[0] # Todo antes de <<END>>
        contidos = np.fromstring(contidos, sep = '\n')

    # 'datos' é unha lista de arrays
    datos.append(contidos)

def gausiana_movida(x,a,b,A,B,C):
    polinomio   = x * a**2 + x * b + c
    exponencial = A * np.exp(-((x - B)*C)**2)
    return polinomio + exponencial

# Datos de picos calculados por Kepa
#
# PicosCs=[661.657]
# PicosNa=[1274.537]
# PicosCo=[1173.228,1332.492]
# PicosEu=[121.7817,344.2785,778.9045,964.0570,1085.8370,1112.0760,1408.0130]
# PicosBi=[569.698,1063.656]
#
# Datos do software, centroides
# cs : [2750.52]
# na : [2085.52]
# co : [4721.26, 5357.52]
# bi : [2724.92, 5087.13]
# eu : [424.61 , 952.62, 1363.67, 3143.41, 3812.48, 4302.90, 5587.67]

# coord x maximos
puntos_clave = [
    [2.77e3],
    [2.07e3, 5.22e3],
    [4.73e3, 5.27e3],
    [1.39e3],
    []
]

anchos = [
    [0.23e3],
    [0.23e3, 0.23e3],
    [0.23e3, 0.23e3],
    [0.23e3],
    []
]

# :AQUI:
# for i in range(len(datos)):
#     axuste = sco.optimize(
#         gausiana_movida(

## Gráficas

ventana = plt.figure()
numero_de_graficas = len(datos)
raiz  = np.sqrt(numero_de_graficas)
techo = np.ceil(raiz)
chan  = np.floor(raiz)

if chan * chan == numero_de_graficas:
    filas = int(chan)
    columnas = int(chan)
elif techo * chan >= numero_de_graficas:
    filas = int(chan)
    columnas = int(techo)
else:
    filas = int(techo)
    columnas = int(techo)

lenzos = ventana.subplots(
    nrows = filas,
    ncols = columnas,
    sharex = True,
    sharey = True
)

for i in range(filas * columnas):

    if i+1 <= numero_de_graficas:

        lenzo = lenzos[i // columnas, i % columnas]

        # lenzo.stairs(
        #     datos[i],
        #     np.arange(len(datos[i]) + 1),
        #     fill = True,
        #     facecolor = "#668066"
        # )

        lenzo.bar(
            np.arange(len(datos[i])),
            datos[i],
            facecolor = "#6680c6",
            width = 6
        )

        for j in range(len(puntos_clave[i])):
            lenzo.axvline(
                puntos_clave[i][j],
                linestyle = '-',
                marker    = '',
                color     = "#000000",
                linewidth = 0.5,
                alpha     = 0.5,
                zorder    = 0
            )
            lenzo.axvspan(
                puntos_clave[i][j] - anchos[i][j],
                puntos_clave[i][j] + anchos[i][j],
                color = "#bc9980",
                alpha = 0.3
            )


        lenzo.set(
            title  = f"{ficheiros_mostras[i]}",
            # yscale = "log",
        )

        # if i % columnas == 0: # Columna 0
        #     lenzo.set(ylabel = r"y")
        # if i // columnas == filas - 1: # ultima fila
        #     lenzo.set(xlabel = r"x")

    elif i+1 > numero_de_graficas:
        lenzos[i // columnas, i % columnas].remove()


ventana.savefig("graficas_simples.pdf")
