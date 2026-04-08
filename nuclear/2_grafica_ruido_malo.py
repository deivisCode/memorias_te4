import numpy as np
import matplotlib.pyplot as plt
import scienceplots

with open("datos/back_fallido.mca", "r") as f:
    contidos = f.read()
    contidos = contidos.split("<<DATA>>")[1] # Todo despois de <<DATA>>
    contidos = contidos.split("<<END>>")[0] # Todo antes de <<END>>
    contidos = np.fromstring(contidos, sep = '\n')


with plt.style.context(["ieee","science"]):
    plt.rcParams.update({'figure.dpi': '120', 'font.size': 12.0})

    fig, ax = plt.subplots(1,1)
    ax.bar(np.arange(0,len(contidos)), contidos, color = 'k')

    ax.set_xlabel("Canle")
    ax.set_ylabel("Contas")
    ax.set(xlim=(0,8500), yscale="log")

    fig.savefig("memoria/figuras/ruido_malo.pdf")
