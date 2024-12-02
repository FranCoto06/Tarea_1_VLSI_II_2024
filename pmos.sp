

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/config.lib' default


.model PMOS_CUSTOM PMOS(W=0.72u L=0.18u AS=20 PS=18 AD=20 PD=18)

.PARAM
.OPTION POST
.GLOBAL gnd! vdd!

Vgs g vdd! 0
Vds d vdd! 0

M1 d g vdd! vdd! PMOS_CUSTOM

Vvdd vdd! 0 1.8v
Vgnd gnd! 0 0v

.DC Vds -1.8 0 0.05 SWEEP Vgs -1.8 0 0.3

.PROBE DC i(M1)

.end
