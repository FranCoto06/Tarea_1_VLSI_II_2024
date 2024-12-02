![Logo](Firma_TEC.png)
# Tarea_1_VLSI_II_2024
Integrantes del grupo:

* Francisco Coto Alcázar
* Andrés Rojas Barboza
* Bernal Jesús Zamora Barrantes



## Parte 1 DeterminaciÃ³n de las resistencias de canal de transistores mÃ­nimos NMOS y PMOS para el proceso XH018. MÃ³dulo LPMOS: ne, pe (1,8V).

### a) DeterminaciÃ³n de la resistencia efectiva

**nMOS**
$$I_{Ln} = 3  pA/ \mu m$$

$$I_{Hn} = 475 \mu A/ \mu m$$

$$I_{effp} = (3 pA/ \mu m + 475 \mu A/ \mu m)/2 = 237.5 \mu A* \mu m$$

$$R = 1.8/(2*237.5 \mu A/ \mu m) = 3.789 k \ohm * \mu m = 22.288 k \ohm$$

$$R_{step n} = 1.8/(2*475 \mu A/ \mu m) = 1.894 k \ohm * \mu m = 11.141 k \ohm$$



**pMOS**
$$I_{Lp} = 3  pA/ \mu m$$

$$I_{Hp} = 170  \mu A/ \mu m$$

$$I_{effp} = (3 pA/ \mu m + 170 \mu A/ \mu m)/2 = 85 \mu A/ \mu m$$

$$R = 1.8/(2 * 85 \mu A\mu m) = 10.588 k \ohm * \mu m = 42.352 k \ohm$$

$$R_{step p} = 1.8/(2 * 170 \mu A) = 5.294 k \ohm * \mu m = 21.176 k \ohm$$



La ecuaciÃ³n: $R = V_{DD}/2*I_{eff}$ lo cuÃ¡l es la misma a la ecuaciÃ³n $R = V_{DD}/I_{H}+I_{L}$, donde la $I_{eff}$ corresponde a la corriente efectiva que fluye por la resistencia $I_{H}$ y $I_{L}$ son las corrientes en alto y en bajo respectivamente, en el circuito. Esta ecuaciÃ³n tambiÃ©n toma en cuenta otras corrientes del circuito

Por su parte la ecuaciÃ³n: $R = (3* ln(2))/4 * (Vdd/I_{sat})$ toma en cuenta la corriente de saturaciÃ³n del transistor y la tensiÃ³n de alimentaciÃ³n, esta se relaciona mÃ¡s al modelo de pequeÃ±a seÃ±al del transistor y tambiÃ©n contempla la corriente de saturaciÃ³n y la resistencia efectiva.

### b) CÃ¡lculo de capacitancia de compuerta

**nMOS**

$$ C_{gn} = 0.66 * 0.17 * 0.16 * 8.46 fF + 0.17 * 0.33 fF = 0.209 fF$$

$$ \tau = 3RC = 3*22.288 k \ohm * 0.209 fF = 13.97 ps$$

**pMOS**

$$ C_{gn} = 0.66 * 0.25 * 0.15 * 8.91 fF + 0.25 * 0.32 fF = 0.302 fF$$

$$\tau = 3RC = 3*42.352 k \ohm * 0.302 fF = 38.37 ps$$
  


## Parte 2 DiseÃ±o de un inversor mÃ­nimo de tamaÃ±o Ã³ptimo

### a. Diagrama del inversor a nivel de transistores

A continuaciÃ³n se muestra el esquemÃ¡tico de un inversor a nivel de transistores. Este diagrama ilustra la configuraciÃ³n bÃ¡sica del inversor y los tamaÃ±os de los transistores.

![Logo](Archivos/Figuras/esquematico.jpeg)


### Caracterizacion de los transistores

A continuaciÃ³n se muestran las grÃ¡ficas de las curvas caracterÃ­sticas tanto del nMOS como del pMOS, como se puede observar ambos transistores se encuentran en saturaciÃ³n. La primer grÃ¡fica corresponde al nMOS y la segunda corresponde al pMOS. Para verificar la saturaciÃ³n unicamente se puede observar como a partir te la tensiÃ³n $V_{gs}=1.8V$ estÃ¡s corresponde a cada una de las lÃ­neas que salen del origen y en algunos momentos presentan un comportamiento cuadratico por su parte el eje x corresponde a $V_{DS}$ y el eje y $I_{DS}$. Al observar la lÃ­nea de $V_{gs} = 1.8V$ se puede observar como presenta un comportamiento lineal


![Logo](Archivos/Figuras/Caracterizacion_nmos.jpeg)

![Logo](Archivos/Figuras/Caracterizacion_pmos.jpeg)

### Corriente de cortocircuito

A partir de la siguiente Figura se puede observar como la corriente de cortocircuito tiene un valor de $I_{corto} â‰ˆ 30pA$

![Logo](Archivos/Figuras/corriente_de_fuga.jpeg)

### Esquinas

Para esta parte lo que se hace es cambiar las librerÃ­as para asÃ­ modificar la velocidad de los transistores.

```Hspice

  .lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' wo * Este es para FF
  .lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' ws * Este es para FS
  .lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' wp * Este es para SF
  .lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' wz * Este es para SS

```


La siguiente Figura corresponde a FF

![Logo](Archivos/Figuras/inversorFF.jpeg)

La siguiente Figura corresponde a FS

![Logo](Archivos/Figuras/inversorFS.jpeg)

La siguiente Figura corresponde a SF

![Logo](Archivos/Figuras/inversorSF.png)

La siguiente Figura corresponde a SS

![Logo](Archivos/Figuras/inversorSS.png)

### b.i tpd vs. la relaciÃ³n PMOS/NMOS

A continuacion se muestra como evoluciona el tiempo de respuesta en relacion con la proporcion de tamaÃ±o, claramente se puede observar que en 2.4 tiene un minimo por lo que se puede concluir que la mejor relacion es aproximadamente 2.4 P/N 


![Logo](Archivos/Figuras/tpd.PNG)


### fo4 optimizado

![Logo](Archivos/Figuras/Resultado_fo4_o.PNG)

### c. Valores de Rp y Rn

Al obtener que la mejor relaciÃ³n corresponde a 2.5, entonces se realiza la ejecuciÃ³n con esta relaciÃ³n y se obtienen los siguientes tiempos 

![Logo](Archivos/Figuras/tiempos.png)

A partir de estos se utiliza las ecuaciÃ³n 8.8 del libro debido a quÃ© del FO4 son los segmentos donde se han realizado las pruebas. La ecuaciÃ³n es:

$$â–³t_{pdr} = 3/2 (2*R_{p})*C$$

$$â–³t_{pdf} = 3 (2*R_{n})*C$$

A partir de estos ya se tienen todas las constantes menos el valor de $R_n$ y $R_p$ entonces se realiza las sustituciones y los resultados obtenidos son:

$$R_{p} = 27.3k \ohm â‰ˆ 27k\ohm \mu m\$$

$$R_{n} = 13.86k \ohm â‰ˆ 13k\ohm \mu m$$

De lo anterior se puede observar como la relaciÃ³n que usualmente se maneja de $R_{p} = 2*R_{n} \ohm$ se puede decir que se cumple. En cuÃ¡nto a la preferencia se prefiere el resultado obtenido en el punto c debido a que este mÃ©todo elimina los efectos debidos a las parasitancias y toma en cuenta el efecto de la pendiente realÃ­stica de las seÃ±ales de entrada, ademÃ¡s de que al colocar una carga que corresponde al 4 inversor permite un anÃ¡lisis mejorado que en la primer parte que nada mÃ¡s se toma en cuenta valores brindados por el fabricante.
