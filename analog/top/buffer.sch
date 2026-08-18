v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -60 170 -20 {lab=#net1}
N 130 -90 130 10 {lab=Vin}
N 80 -50 130 -50 {lab=Vin}
N 170 -40 290 -40 {lab=#net1}
N 290 -40 290 -0 {lab=#net1}
N 290 -0 300 -0 {lab=#net1}
N 290 -90 290 -40 {lab=#net1}
N 290 -90 300 -90 {lab=#net1}
N 170 -90 180 -90 {lab=VDD}
N 180 -120 180 -90 {lab=VDD}
N 170 -120 180 -120 {lab=VDD}
N 340 -90 350 -90 {lab=VDD}
N 350 -120 350 -90 {lab=VDD}
N 340 -120 350 -120 {lab=VDD}
N 170 10 180 10 {lab=VSS}
N 180 10 180 40 {lab=VSS}
N 170 40 180 40 {lab=VSS}
N 340 0 350 0 {lab=VSS}
N 350 0 350 30 {lab=VSS}
N 340 30 350 30 {lab=VSS}
N 340 -60 340 -30 {lab=Vout}
N 340 -50 390 -50 {lab=Vout}
N 170 -140 170 -120 {lab=VDD}
N 170 -140 340 -140 {lab=VDD}
N 340 -140 340 -120 {lab=VDD}
N 260 -160 260 -140 {lab=VDD}
N 170 40 170 50 {lab=VSS}
N 170 50 340 50 {lab=VSS}
N 340 30 340 50 {lab=VSS}
N 250 50 250 80 {lab=VSS}
C {symbols/nfet_03v3.sym} 150 10 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} 150 -90 0 0 {name=M2
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
C {symbols/pfet_03v3.sym} 320 -90 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 320 0 0 0 {name=M4
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
C {ipin.sym} 80 -50 0 0 {name=p1 lab=Vin}
C {opin.sym} 390 -50 0 0 {name=p2 lab=Vout}
C {iopin.sym} 250 80 1 0 {name=p3 lab=VSS}
C {iopin.sym} 260 -160 3 0 {name=p4 lab=VDD}
