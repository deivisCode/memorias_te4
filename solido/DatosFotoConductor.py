import numpy as np
import matplotlib.pyplot as plt

#El voltaje está originalmente en negativo

#Medida de la G_0 intrínseca variando el voltaje V en voltios e I en microamperios (calculamos la G_0 haciendo un ajuste linal de I e V):

V_0=np.array([1.059,1.521,2.027,2.505,3.050,3.554,4.001,4.534,5.010,5.672])

I_0=np.array([0.16,0.25,0.30,0.33,0.40,0.45,0.50,0.55,0.60,0.70])

G_0=0.10936*10**(-6)


#plt.plot(V_0,I_0,"o")
#plt.ylabel("I ($\mu$ A)")
#plt.xlabel("V (V)")

#Series de medidas (1 con 0 ambiente, 2 con mitad ambiente, 3 con total ambiente). En cada una medimos primero la I e y V ambientales iniciales y finales.

#Voltaje en V, Intensidad en mA

#Voltaje fijado durante las series en la fuente: 5V 

#1, Flujo ambiental total

Iai1=6

Vai1=5.310

I1=np.array([12.650,12.800,12.270,12.200,11.980,11.515,11.370,10.807,10.525,9.800,9.330,8.880,8.330,7.770,7.099,6.446,6.399,6.140,6.050])*10**(-3)

Theta1=np.array([0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90])

V1=np.array([5.218,5.219,5.226,5.235,5.241,5.245,5.250,5.254,5.261,5.274,5.279,5.285,5.290,5.293,5.300,5.309,5.307,5.312,5.315])

G1=I1/V1

DeltaG1=G1-G_0

#plt.plot(Theta1,G1,"o")
#plt.xlabel("$\Theta$ (º)")
#plt.ylabel("G (A / V)")



#2, Flujo ambiental parcial


Iai2=2.060

Vai2=5.356

I2=np.array([9.610,9.670,9.590,9.420,9.143,8.800,8.505,7.900,7.470,6.850,6.250,5.563,4.890,4.250,3.620,3.070,2.440,2.160,1.920])*10**(-3)

Theta2=np.array([0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90])

V2=np.array([5.253,5.273, 5.277,5.283,5.285,5.590,5.293,5.300,5.306,5.314,5.320,5.328,5.334,5.343,5.351,5.358,5.364,5.368,5.369])

G2=I2/V2

DeltaG2=G2-G_0

#plt.plot(Theta2,G2,"o")
#plt.xlabel("$\Theta$ (º)")
#plt.ylabel("G (A / V)")

#3, Flujo ambiental nulo

Iai3=0.159

Vai3=5.397

I3=np.array([8.650,8.630,8.503,8.320,8.090,7.750,7.310,6.857,6.257,5.634,4.950,4.273,3.565,2.830,2.133,1.450,0.845,0.404,0.166])*10**(-3)

Theta3=np.array([0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90])

V3=np.array([5.280,5.284,5.287,5.290,5.293,5.298,5.305,5.312,5.320,5.328,5.337,5.346,5.355,5.364,5.373,5.381,5.389,5.395,5.398])

G3=I3/V3

DeltaG3=G3-G_0

plt.plot(Theta3,DeltaG3,"o")
plt.xlabel("$\Theta$ (º)")
plt.ylabel("G (A / V)")


#Ajustes (magnitudes en SI):
    
#Primer ajuste preliminar de b y m con luz ambiental nula:
    
m=1.3020563

b=0.0000529

#Ajustes de a usando los datos anteriores para cada método y cada serie (ue=única equivalente", fi="fuentes independientes"):
    
aue1=0.0000361704

aue2=0.0000077379

afi1=0.0000199362

afi2=0.0000028299




