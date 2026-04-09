import mca_tools as mca
mca.select_language("gl")

mostra_bi207 = mca.peakSelector("datos/calibracion/mostra_bi207.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/")
mostra_co60  = mca.peakSelector("datos/calibracion/mostra_co60.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/")
mostra_cs137 = mca.peakSelector("datos/calibracion/mostra_cs137.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/")
mostra_eu152 = mca.peakSelector("datos/calibracion/mostra_eu152.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/")
mostra_na22  = mca.peakSelector("datos/calibracion/mostra_na22.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/")

print("Datos Cargados")

mostra_bi207.plot()
mostra_co60.plot()
mostra_cs137.plot()
mostra_eu152.plot()
mostra_na22.plot()

print("Gráficas feitas")
