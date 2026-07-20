v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -10 -70 100 -70 {lab=#net1}
N 140 -40 140 0 {lab=#net2}
N 140 -140 140 -100 {lab=0}
N 140 -70 160 -70 {lab=0}
N 160 -100 160 -70 {lab=0}
N 140 -100 160 -100 {lab=0}
N 140 -150 140 -140 {lab=0}
N 140 -150 180 -150 {lab=0}
C {gnd.sym} 180 -150 0 0 {name=l6 lab=0}
C {code_shown.sym} -510 -390 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical
"}
C {code_shown.sym} 440 -410 0 0 {name=s1 only_toplevel=true 
value="
.dc VGS 0 -3.3 -0.01

.control
  run

  * 1. Use absolute values to completely eliminate SPICE sign headaches
  let id = abs(i(vds))
  let vgs_abs = abs(v(net1))
  
  * 2. Calculate gm using the absolute Vgs scale
  let gm = deriv(id)
  let gm_id = gm / id

  * 3. Geometry normalization
  let W_over_L = 0.22 / 0.28
  let current_density = id / W_over_L

  * 4. Plot clean, positive curves
  plot gm_id vs vgs_abs title 'PMOS: gm/Id vs. Absolute VGS'
  plot gm_id vs current_density title 'PMOS: gm/Id vs. Normalized Current Density'
.endc
.end
"}
C {vsource.sym} -10 -40 0 0 {name=VGS value=-3.3 savecurrent=false}
C {gnd.sym} -10 -10 0 0 {name=l1 lab=0}
C {vsource.sym} 140 30 0 0 {name=VDS value=-1.65 savecurrent=false}
C {gnd.sym} 140 60 0 0 {name=l2 lab=0}
C {symbols/pfet_03v3.sym} 120 -70 0 0 {name=M2
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
model=pfet_03v3
spiceprefix=X
}
