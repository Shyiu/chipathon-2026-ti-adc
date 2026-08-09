v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -300 50 -280 {lab=vdd}
N -100 -300 50 -300 {lab=vdd}
N -100 -330 -100 -300 {lab=vdd}
N 50 -30 50 20 {lab=vss}
N -10 -280 20 -280 {lab=vin}
N -10 -280 -10 -30 {lab=vin}
N -10 -30 20 -30 {lab=vin}
N -30 -40 -10 -40 {lab=vin}
N 50 -240 50 -140 {lab=xxx}
N 50 -130 50 -70 {lab=vclk}
N 80 -280 130 -280 {lab=vout}
N 130 -280 130 -30 {lab=vout}
N 80 -30 130 -30 {lab=vout}
N 130 -160 250 -160 {lab=vout}
C {symbols/nfet_03v3.sym} 50 -50 1 0 {name=M1
L=0.28u
W=20u
nf=20
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
C {symbols/pfet_03v3.sym} 50 -260 3 0 {name=M2
L=0.28u
W=40u
nf=40
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
C {ipin.sym} 50 -130 0 0 {name=p1 lab=vclk}
C {ipin.sym} -30 -40 0 0 {name=p3 lab=vin}
C {iopin.sym} -100 -330 3 0 {name=p2 lab=vdd}
C {iopin.sym} 50 20 1 0 {name=p4 lab=vss}
C {opin.sym} 250 -160 0 0 {name=p5 lab=vout}
C {ipin.sym} 50 -140 0 0 {name=p6 lab=vclk_n}
