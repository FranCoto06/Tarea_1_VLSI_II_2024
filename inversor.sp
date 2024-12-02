

.option LIST NODE POST
.temp 25
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/config.lib' default

.global gnd!
xm0 out net12 gnd! gnd! ne w= 220.0n l=180.0n 
v1 net10 gnd! dc=1.8 power=0
v2 net12 gnd! dc=0 pulse (0 1.8 0 100p 100p 2n 4.2n)
xm1 out net12 net10 net10 pe w=550.0n l=180.0n 

.tran 10p 10n start=0
*.dc v2 0 1.8 0.01
*.option opfile=1 split_dp=1
*.option probe=1
*.probe tran v(*) level=1
*.probe tran v(out) v(net12)
*.probe dc v(out) v(v2)

.end




