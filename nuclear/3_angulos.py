import numpy as np
import matplotlib.pyplot as plt

ficheiros_angulos_sin = [
    "-90sinDispersor.mca",
    "+90sinDispersor.mca",
    "-70sinDispersor.mca",
    "+70sinDispersor.mca",
    "-50sinDispersor.mca",
    "+50sinDispersor.mca",
]
angulos_sin = []
for nome in ficheiros_angulos_sin:
    with open(nome, "r") as f:
        contidos = f.read()
        contidos = contidos.split("<<DATA>>")[1] # Todo despois de <<DATA>>
        contidos = contidos.split("<<END>>")[0] # Todo antes de <<END>>
        contidos = np.fromstring(contidos, sep = '\n')
    angulos_sin.append(contidos)

ficheiros_angulos_con = [
    "-90conDispersor.mca",
    "+90conDispersor.mca",
    "-70conDispersor.mca",
    "+70conDispersor.mca",
    "-50conDispersor.mca",
    "+50conDispersor.mca",
]
angulos_con = []
for nome in ficheiros_angulos_con:
    with open(nome, "r") as f:
        contidos = f.read()
        contidos = contidos.split("<<DATA>>")[1] # Todo despois de <<DATA>>
        contidos = contidos.split("<<END>>")[0] # Todo antes de <<END>>
        contidos = np.fromstring(contidos, sep = '\n')
    angulos_con.append(contidos)

## Gráficas

ventana = plt.figure()
numero_de_graficas = len(ficheiros_angulos_sin)
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

if filas == 1:
    lenzos = ventana.subplots(
        nrows = filas+1,
        ncols = columnas+1,
        sharex = True,
        sharey = True
    )
else:
    lenzos = ventana.subplots(
        nrows = filas,
        ncols = columnas,
        sharex = True,
        sharey = True
    )

print(f"filas: {filas}")
print(f"columnas: {columnas}")
print(f"graficas: {numero_de_graficas}")

for i in range(filas * columnas):
    if i+1 <= numero_de_graficas:
        lenzo = lenzos[i // columnas, i % columnas]

        diferenza = np.array(angulos_con[i]) - np.array(angulos_sin[i])
        temp = np.copy(diferenza)
        for j in range(len(diferenza)):
            if j % 8 != 0:
                diferenza[j] = 0
            else:
                diferenza[j] = np.sum(temp[j:j+8:])


        print(len(angulos_sin[i]))
        print(len(angulos_con[i]))
        n = len(angulos_sin[i])

        lenzo.bar(
            np.arange(n),
            angulos_sin[i],
            facecolor = "#e680c6",
            width = 6,
            alpha = 0.3
        )
        lenzo.bar(
            np.arange(n),
            angulos_con[i],
            facecolor = "#66804d",
            width = 6,
            alpha = 0.3
        )
        lenzo.plot(
            np.arange(len(diferenza)),
            diferenza,
            color      = "red",
            markersize = 1,
            alpha      = 0.8
        )

        lenzo.set(
            title  = f"{ficheiros_angulos_con[i][0:3]}",
            ylim   = (
                -max(np.array(angulos_con[i]) - np.array(angulos_sin[i]))*1.1,
                 max(angulos_con[i])*0.4,
            ),
            xlim   = (0, n*0.3),
            # yscale = "log",
        )

        # if i % columnas == 0: # Columna 0
        #     lenzo.set(ylabel = r"y")
        # if i // columnas == filas - 1: # ultima fila
        #     lenzo.set(xlabel = r"x")

    elif i+1 > numero_de_graficas:
        lenzos[i // columnas, i % columnas].remove()


ventana.savefig("angulos.pdf")
