import mca_tools as mca
mca.select_language("gl")

mostra_bi207 = mca.peakSelector(
    "datos/calibracion/mostra_bi207.mca",
    bkg_file = "datos/background.mca",
    fig_path = "memoria/figuras/",
    csv_path = "memoria/datos/"
)
mostra_co60  = mca.peakSelector(
    "datos/calibracion/mostra_co60.mca",
    bkg_file = "datos/background.mca",
    fig_path = "memoria/figuras/",
    csv_path = "memoria/datos/"
)
mostra_cs137 = mca.peakSelector(
    "datos/calibracion/mostra_cs137.mca",
    bkg_file = "datos/background.mca",
    fig_path = "memoria/figuras/",
    csv_path = "memoria/datos/"
)
mostra_eu152 = mca.peakSelector(
    "datos/calibracion/mostra_eu152.mca",
    bkg_file = "datos/background.mca",
    fig_path = "memoria/figuras/",
    csv_path = "memoria/datos/"
)
mostra_na22  = mca.peakSelector(
    "datos/calibracion/mostra_na22.mca",
    bkg_file = "datos/background.mca",
    fig_path = "memoria/figuras/",
    csv_path = "memoria/datos/"
)

print("Datos Cargados")

mostra_bi207.plot()
mostra_co60.plot()
mostra_cs137.plot()
mostra_eu152.plot()
mostra_na22.plot()

print("Gráficas feitas")
print("Pasamos ao fitting")

mostra_bi207.select_peaks()
mostra_co60.select_peaks()
mostra_cs137.select_peaks()
mostra_eu152.select_peaks()
mostra_na22.select_peaks()

print("Picos axustados")

# print("Pasamos a calibración")
#
# mca.calibration([
#     mostra_bi207,
#     mostra_co60,
#     mostra_cs137,
#     mostra_eu152,
#     mostra_na22,
# ])
#
# print("Calibración feita")
