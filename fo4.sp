
* fo4.sp

.param H=4
.temp 25

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Aguilar_Ramirez_I_2024_vlsi/Tarea/Tareasim/Hspice/lp5mos/config.lib' default

.global vdd gnd
.option post
----------------------------------------------------------------------
*Subcircuits
----------------------------------------------------------------------
.subckt inv a y WN=220n WP=528n
xm0 y a gnd gnd ne W='WN' L=180n
+ as=-1 ad=-1 ps=-1 + pd=-1 nrs=-1 nrd=-1 m='(11)' par1='(11)' xf_subext=0
xm1 y a vdd vdd pe W='WP' L=180n
+ as=-1 ad=-1 ps=-1 + pd=-1 nrs=-1 nrd=-1 m='(11)' par1='(11)' xf_subext=0
.ends
*----------------------------------------------------------------------
*Simulation netlist
*----------------------------------------------------------------------
Vdd vdd gnd dc=1.8 power=0
Vin a gnd dc=0 pulse ( 0 1.8 0 100p 100p 2n 4.2n )
X1 a b inv
X2 b c inv M='H'
X3 c d inv M='H**2'
X4 d e inv M='H**3'
X5 e f inv M='H**4'
*----------------------------------------------------------------------
*Stimulus
*----------------------------------------------------------------------
.tran 10p 10n start=0
.measure tpdr * rising propagation delay
+ TRIG v(c) VAL='1.8/2' FALL=1 
+ TARG v(d) VAL='1.8/2' RISE=1
.measure tpdf * falling propagation delay
+ TRIG v(c) VAL='1.8/2' RISE=1
+ TARG v(d) VAL='1.8/2' FALL=1 
.measure tpd param='(tpdr+tpdf)/2' goal=0 * average prop delay
.measure diff param='tpdr-tpdf' goal = 0 * diff between delays
.end
