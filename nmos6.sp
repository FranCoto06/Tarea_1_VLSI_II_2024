
********************************** PARA MEDIR CORRIENTE DE CORTO CIRCUITOOOO*********************

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/config.lib' default

.model NMOS_CUSTOM NMOS (W=0.36u L=0.18u AS=20 PS=18 AD=20 PD=18)

.PARAM
.OPTION POST
.GLOBAL gnd! vdd!

Vgs g gnd! 0
Vds d gnd! 0

M1 d g gnd! gnd! NMOS_CUSTOM

Vvdd vdd! 0 1.8v
Vgnd gnd! 0 0v

*.DC Vds 0 1.8 0.05 SWEEP Vgs 0 1.8 0.3
*COMENTAR LA SIGUIENTE LINEA YA QUE ESTA ES PARA MEDIR LA CORRIENTE DE CORTOCIRCUITO

.dc Vds 0 0.00001 0.00001 SWEEP Vgs 0.9 0.9 0.9

.PROBE DC i(M1)

*.measure corriente_drenaje_source PARAM = I(d,gnd!)

.end