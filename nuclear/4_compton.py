import mca_tools as mca
import pathlib

mca.select_language("gl")

angulo_000_con_dispersor = mca.peakSelector( "datos/angulos/angulo_000_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_000_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_000_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_020_con_dispersor = mca.peakSelector( "datos/angulos/angulo_020_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_020_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_020_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_040_con_dispersor = mca.peakSelector( "datos/angulos/angulo_040_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_040_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_040_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_140_con_dispersor = mca.peakSelector( "datos/angulos/angulo_140_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_140_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_140_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_160_con_dispersor = mca.peakSelector( "datos/angulos/angulo_160_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_160_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_160_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_180_con_dispersor = mca.peakSelector( "datos/angulos/angulo_180_con_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )
angulo_180_sin_dispersor = mca.peakSelector( "datos/angulos/angulo_180_sin_dispersor.mca", bkg_file = "datos/background.mca", fig_path = "memoria/figuras/", csv_path = "memoria/datos" )

datos = [
    angulo_000_con_dispersor,
    angulo_000_sin_dispersor,
    angulo_020_con_dispersor,
    angulo_020_sin_dispersor,
    angulo_040_con_dispersor,
    angulo_040_sin_dispersor,
    angulo_140_con_dispersor,
    angulo_140_sin_dispersor,
    angulo_160_con_dispersor,
    angulo_160_sin_dispersor,
    angulo_180_con_dispersor,
    angulo_180_sin_dispersor
]

for d in datos:
    print(f"\n{pathlib.Path(d.file_path).stem}")
    d.plot()
    d.select_peaks()
