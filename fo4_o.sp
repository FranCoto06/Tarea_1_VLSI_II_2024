*----------------------------------------------------------------------
* Parameters and models
*----------------------------------------------------------------------
.param H=4
.param SUPPPLY=1.0
.temp 25

.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Alfaro_Arias_I_2024_vlsi/tuto1/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Alfaro_Arias_I_2024_vlsi/tuto1/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Alfaro_Arias_I_2024_vlsi/tuto1/Hspice/lp5mos/config.lib' default

.global vdd gnd
.option post
*----------------------------------------------------------------------
* Subcircuits
*----------------------------------------------------------------------
.subckt inv a y WN=220n WP=440n
xm0 y a gnd gnd ne W='WN' L=180n
+ as=-1 ad=-1 ps=-1 + pd=-1 nrs=-1 nrd=-1 m='(1*1)' par1='(1*1)' xf_subext=0
xm1 y a vdd vdd pe W='WP' L=180n
+ as=-1 ad=-1 ps=-1 + pd=-1 nrs=-1 nrd=-1 m='(1*1)' par1='(1*1)' xf_subext=0
.ends
*----------------------------------------------------------------------
* Simulation netlist
*----------------------------------------------------------------------
Vdd vdd gnd dc=1.8 power=0
Vin a gnd dc=0 pulse ( 0 1.8 0 100p 100p 2n 4.2n )
X1 a b inv
X2 b c inv WP='P1'  M='H*180n'
X3 c d inv WP='P1' M='(H**2)*180n'
X4 d e inv WP='P1' M='(H**3)*180n'
X5 e f inv WP='P1' M='(H**4)*180n'
*----------------------------------------------------------------------
* Optimization setup
*----------------------------------------------------------------------
.param P1=optrange(440n,220n,1440n)
.model optmod opt itropt=30
.measure bestratio param='P1/220n'
*----------------------------------------------------------------------
* Stimulus
*----------------------------------------------------------------------
.tran 10p 10n SWEEP OPTIMIZE=optrange RESULTS=diff MODEL=optmod
.plot v(c) v(d)
.measure tpdr
+ TRIG v(c) VAL=0.9 FALL=1 
+ TARG v(d) VAL=0.9 RISE=1
.measure tpdf
+ TRIG v(c) VAL=0.9 RISE=1
+ TARG v(d) VAL=0.9 FALL=1 
.measure tpd param='(tpdr+tpdf)/2' goal=0
.measure diff param='(tpdr+tpdf)/2' goal = 0
.end
