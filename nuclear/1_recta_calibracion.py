import numpy as np
import matplotlib.pyplot as plt
from regresion_lineal import regresion

ficheiros_mostras = [
    "mostra_cs137.mca",
    "mostra_na22.mca",
    "mostra_co60.mca",
    # "mostra_eu152.mca",
    "mostra_bi207.mca"
]

enerxias_separadas = [
    [661.657],
    [511, 1274.537],
    [1173.228,1332.492],
    # [121.7817,344.2785,778.9045,964.0570,1085.8370,1112.0760,1408.0130],
    [569.698,1063.656],
]

centroides_separados = [
    [2750.52],
    [2085.52, 5190.62],
    [4721.26, 5357.52],
    # [424.61, 952.62, 1363.67, 3143.41, 3812.48, 4302.90, 5587.67],
    [2724.92, 5087.13],
]

# Xunto todo en orde para graficar e axustar
enerxias = []
centroides = []
for i in range(len(enerxias_separadas)):
    enerxias = enerxias + enerxias_separadas[i]
    centroides = centroides + centroides_separados[i]

# print(enerxias)
# print(centroides)

axuste = regresion( centroides, enerxias, [1]*len(centroides))
ordenada   = axuste[0]
s_ordenada = axuste[1]
pendente   = axuste[2]
s_pendente = axuste[3]
x = np.array( [ min(centroides), max(centroides), ])
y = x * pendente + ordenada
print(f"Ordenada: {ordenada:4.3e} +- {s_ordenada:4.3e}")
print(f"Pendente: {pendente:4.3e} +- {s_pendente:4.3e}")

ventana = plt.figure()
lenzo = ventana.add_subplot(1,1,1)

# Datos orixinais
for i in range(len(enerxias_separadas)):
    lenzo.plot(
        centroides_separados[i],
        enerxias_separadas[i],
        label = f"{ficheiros_mostras[i]}",
    )

# Axuste
lenzo.plot(
    x,y,
    color     = "gray",
    marker    = '',
    linestyle = '-'
)

lenzo.set(
    xlabel = "Centroides",
    ylabel = "Enerxías",
    ylim   = (0, max(enerxias)*1.1),
    xlim   = (0, max(centroides)*1.1)
)

lenzo.legend()
ventana.savefig("rectas_calibracion.pdf")
