import numpy as np
import matplotlib.pyplot as plt
import scienceplots

with open("datos/calibracion/mostra_cs137.mca", "r") as f:
    contidos = f.read()
    contidos = contidos.split("<<DATA>>")[1] # Todo despois de <<DATA>>
    contidos = contidos.split("<<END>>")[0] # Todo antes de <<END>>
    contidos = np.fromstring(contidos, sep = '\n')


with plt.style.context(["ieee","science"]):
    plt.rcParams.update({'figure.dpi': '120', 'font.size': 12.0})

    fig, ax = plt.subplots(1,1)
    ax.plot(np.arange(0,len(contidos)), contidos, 'k')

    ax.set_xlabel("Canle")
    ax.set_ylabel("Contas")

    fig.savefig("memoria/figuras/mostra_cs137_exemplo.pdf")
    plt.show()
