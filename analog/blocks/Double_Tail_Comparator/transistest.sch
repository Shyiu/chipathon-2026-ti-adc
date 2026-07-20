v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -10 -70 100 -70 {lab=#net1}
N 140 -40 140 0 {lab=0}
N 140 -140 140 -100 {lab=#net2}
N 140 -150 140 -140 {lab=#net2}
N 140 -150 280 -150 {lab=#net2}
N 280 -90 280 -50 {lab=0}
N 140 -70 160 -70 {lab=0}
N 160 -70 160 -40 {lab=0}
N 140 -40 160 -40 {lab=0}
C {code_shown.sym} -510 -390 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical
"}
C {code_shown.sym} 440 -410 0 0 {name=s1 only_toplevel=true 
value="
* 3. Simulation Command
.dc VGS 0 3.3 0.01

* 4. Post-Processing & Plotting Engine
.control
  run
  
  * Extract true drain current (SPICE measures current leaving the source of VDS)
  let id = -i(vds)
  
  * Calculate transconductance via derivative engine (dId/dVGS)
  let gm = deriv(id)
  
  * Compute Transconductance Efficiency
  let gm_id = gm / id
  
  * Define Geometry Aspect Ratio W/L
  let W_over_L = 0.22 / 0.28
  
  * Compute Normalized Current Density: Id / (W/L)
  let current_density = id / W_over_L

  * Plot the curves
  plot gm_id vs v(net1) title 'Transconductance Efficiency vs. Gate Voltage'
  plot gm_id vs current_density title 'gm/Id vs. Normalized Current Density'
.endc
.end
"}
C {vsource.sym} -10 -40 0 0 {name=VGS value=3.3 savecurrent=false}
C {gnd.sym} -10 -10 0 0 {name=l1 lab=0}
C {vsource.sym} 280 -120 0 0 {name=VDS value=1.65 savecurrent=false}
C {gnd.sym} 280 -50 0 0 {name=l2 lab=0}
C {symbols/nfet_03v3.sym} 120 -70 0 0 {name=M1
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {gnd.sym} 140 0 0 0 {name=l3 lab=0}
