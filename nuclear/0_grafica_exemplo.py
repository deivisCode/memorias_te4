import mca_tools as mca
mca.select_language("gl")

cesio = mca.peakSelector("datos/mostra_cs137.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "test/output/csv")

cesio.plot()
