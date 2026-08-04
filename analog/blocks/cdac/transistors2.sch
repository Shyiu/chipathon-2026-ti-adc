v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 450 -60 450 -30 {lab=Vin}
N 20 -70 20 -50 {lab=VREF}
N 20 -70 190 -70 {lab=VREF}
N 190 -70 190 -50 {lab=VREF}
N 100 -90 100 -70 {lab=VREF}
N 20 10 20 30 {lab=sw_node}
N 20 30 190 30 {lab=sw_node}
N 190 10 190 30 {lab=sw_node}
N 20 -20 50 -20 {lab=VDD}
N 160 -20 190 -20 {lab=GND}
N 20 70 20 90 {lab=sw_node}
N 190 70 190 90 {lab=sw_node}
N 20 150 20 170 {lab=GND}
N 20 170 190 170 {lab=GND}
N 190 150 190 170 {lab=GND}
N 20 120 50 120 {lab=VDD}
N 160 120 190 120 {lab=GND}
N 20 60 20 70 {lab=sw_node}
N 190 60 190 70 {lab=sw_node}
N 20 60 190 60 {lab=sw_node}
N 100 30 100 60 {lab=sw_node}
N -40 -20 -20 -20 {lab=Dx_b}
N -40 120 -20 120 {lab=Dx}
N 230 -20 250 -20 {lab=Dx}
N 230 120 250 120 {lab=Dx_b}
N 450 0 470 0 {lab=GND}
N 450 30 450 50 {lab=sw_node}
N 100 50 130 50 {lab=sw_node}
N 380 0 410 0 {lab=phi_s}
N 100 170 100 190 {lab=GND}
C {symbols/nfet_03v3.sym} 210 -20 2 0 {name=M3
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
C {symbols/pfet_03v3.sym} 0 -20 0 0 {name=M4
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
C {ipin.sym} 450 -60 0 0 {name=p3 lab=Vin}
C {ipin.sym} 100 -90 0 0 {name=p5 lab=VREF}
C {symbols/nfet_03v3.sym} 210 120 2 0 {name=M6
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
C {symbols/pfet_03v3.sym} 0 120 0 0 {name=M7
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
C {opin.sym} 130 50 0 0 {name=p1 lab=sw_node}
C {lab_wire.sym} 250 -20 2 0 {name=p2 sig_type=std_logic lab=Dx}
C {lab_wire.sym} -40 120 0 0 {name=p4 sig_type=std_logic lab=Dx}
C {lab_wire.sym} -40 -20 0 0 {name=p6 sig_type=std_logic lab=Dx_b}
C {lab_wire.sym} 250 120 2 0 {name=p7 sig_type=std_logic lab=Dx_b}
C {lab_wire.sym} 450 50 2 0 {name=p8 sig_type=std_logic lab=sw_node}
C {lab_wire.sym} 50 -20 2 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 50 120 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 160 -20 0 0 {name=p11 sig_type=std_logic lab=GND}
C {lab_wire.sym} 160 120 0 0 {name=p12 sig_type=std_logic lab=GND}
C {lab_wire.sym} 470 0 2 0 {name=p13 sig_type=std_logic lab=GND}
C {ipin.sym} 100 190 0 0 {name=p14 lab=GND}
C {ipin.sym} -80 -160 0 0 {name=p16 lab=Dx}
C {ipin.sym} -80 -130 0 0 {name=p17 lab=Dx_b}
C {ipin.sym} -80 -100 0 0 {name=p18 lab=phi_s}
C {ipin.sym} -10 -160 0 0 {name=p19 lab=VDD}
C {lab_wire.sym} 380 0 0 0 {name=p15 sig_type=std_logic lab=phi_s}
C {symbols/nfet_03v3.sym} 430 0 0 0 {name=M1
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
