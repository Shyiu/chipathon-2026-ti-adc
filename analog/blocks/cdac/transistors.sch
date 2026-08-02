v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 150 -100 170 -100 {lab=Dx}
N 210 -150 210 -130 {lab=VREF}
N 210 -70 210 -50 {lab=sw_node}
N 150 20 170 20 {lab=Dx}
N 350 -30 350 -10 {lab=Vin}
N 210 50 210 80 {lab=GND}
N 350 50 350 80 {lab=sw_node}
N 350 80 350 100 {lab=sw_node}
N 290 20 310 20 {lab=phi_s}
N 345 20 375 20 {lab=VDD}
N 210 20 220 20 {lab=GND}
N 290 0 290 20 {lab=phi_s}
N 210 -100 225 -100 {lab=GND}
N 210 -30 210 -10 {lab=sw_node}
C {opin.sym} 210 -50 0 0 {name=p1 lab=sw_node}
C {ipin.sym} 55 -50 0 0 {name=p2 lab=VDD}
C {ipin.sym} 55 -20 0 0 {name=p3 lab=GND}
C {ipin.sym} 55 10 0 0 {name=p4 lab=Dx}
C {ipin.sym} 55 40 0 0 {name=p5 lab=Dx_b}
C {ipin.sym} 290 0 0 0 {name=p6 lab=phi_s}
C {ipin.sym} 210 -150 0 0 {name=p7 lab=VREF}
C {ipin.sym} 350 -30 0 0 {name=p8 lab=Vin}
C {symbols/pfet_03v3.sym} 330 20 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 190 -100 0 0 {name=M3
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
C {lab_wire.sym} 150 -100 0 0 {name=p9 sig_type=std_logic lab=Dx}
C {lab_wire.sym} 350 100 0 0 {name=p11 sig_type=std_logic lab=sw_node}
C {lab_wire.sym} 375 20 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 210 80 2 0 {name=p15 sig_type=std_logic lab=GND}
C {lab_wire.sym} 225 -100 2 0 {name=p16 sig_type=std_logic lab=GND}
C {lab_wire.sym} 210 -30 0 0 {name=p19 sig_type=std_logic lab=sw_node}
C {symbols/pfet_03v3.sym} 190 20 0 0 {name=M2
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
C {lab_wire.sym} 150 20 0 0 {name=p20 sig_type=std_logic lab=Dx_b}
C {lab_wire.sym} 220 20 2 0 {name=p21 sig_type=std_logic lab=GND}
