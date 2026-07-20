v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 200 730 200 {lab=VDD}
N 30 360 730 360 {lab=VSS}
N -10 230 -10 330 {lab=VIN1}
N 190 230 190 330 {lab=VIN2}
N 440 230 440 330 {lab=VIN3}
N 690 230 690 330 {lab=VIN4}
N 20 -130 720 -130 {lab=VDD}
N 20 30 720 30 {lab=VSS}
N -20 -100 -20 0 {lab=VIN5}
N 180 -100 180 0 {lab=VIN6}
N 430 -100 430 0 {lab=VIN7}
N 680 -100 680 0 {lab=VIN8}
N 20 -70 20 -30 {lab=VOUT5}
N 220 -70 220 -30 {lab=VOUT6}
N 470 -70 470 -30 {lab=VOUT7}
N 720 -70 720 -30 {lab=VOUT8}
N 30 260 30 300 {lab=VOUT1}
N 230 260 230 300 {lab=VOUT2}
N 480 260 480 300 {lab=VOUT3}
N 730 260 730 300 {lab=VOUT4}
N -240 -100 -240 -50 {lab=VDD}
N -330 -100 -330 -50 {lab=VSS}
N 20 -100 50 -100 {lab=VDD}
N 50 -130 50 -100 {lab=VDD}
N 220 -100 250 -100 {lab=VDD}
N 250 -130 250 -100 {lab=VDD}
N 470 -100 500 -100 {lab=VDD}
N 500 -130 500 -100 {lab=VDD}
N 720 -100 730 -100 {lab=VDD}
N 730 -130 730 -100 {lab=VDD}
N 720 -130 730 -130 {lab=VDD}
N 470 -0 490 -0 {lab=VSS}
N 490 0 490 30 {lab=VSS}
N 720 0 740 0 {lab=VSS}
N 740 -0 740 30 {lab=VSS}
N 720 30 740 30 {lab=VSS}
N 220 -0 240 -0 {lab=VSS}
N 240 -0 240 30 {lab=VSS}
N 20 -0 40 0 {lab=VSS}
N 40 0 40 30 {lab=VSS}
N 30 330 50 330 {lab=VSS}
N 50 330 50 360 {lab=VSS}
N 30 230 50 230 {lab=VDD}
N 50 200 50 230 {lab=VDD}
N 230 230 260 230 {lab=VDD}
N 260 200 260 230 {lab=VDD}
N 230 330 250 330 {lab=VSS}
N 250 330 250 360 {lab=VSS}
N 480 230 500 230 {lab=VDD}
N 500 200 500 230 {lab=VDD}
N 480 330 500 330 {lab=VSS}
N 500 330 500 360 {lab=VSS}
N 730 230 750 230 {lab=VDD}
N 750 200 750 230 {lab=VDD}
N 730 200 750 200 {lab=VDD}
N 730 330 750 330 {lab=VSS}
N 740 360 750 330 {lab=VSS}
N 730 360 740 360 {lab=VSS}
C {symbols/pfet_03v3.sym} 10 230 0 0 {name=M9
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
C {symbols/nfet_03v3.sym} 10 330 0 0 {name=M10
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
C {symbols/pfet_03v3.sym} 210 230 0 0 {name=M11
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
C {symbols/nfet_03v3.sym} 210 330 0 0 {name=M12
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
C {symbols/pfet_03v3.sym} 460 230 0 0 {name=M13
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
C {symbols/nfet_03v3.sym} 460 330 0 0 {name=M14
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
C {symbols/pfet_03v3.sym} 710 230 0 0 {name=M15
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
C {symbols/nfet_03v3.sym} 710 330 0 0 {name=M16
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
C {lab_pin.sym} 380 200 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 380 360 3 0 {name=p1 sig_type=std_logic lab=VSS}
C {ipin.sym} -10 270 0 0 {name=p3 lab=VIN1}
C {ipin.sym} 190 270 0 0 {name=p4 lab=VIN2}
C {ipin.sym} 440 270 0 0 {name=p5 lab=VIN3}
C {ipin.sym} 690 270 0 0 {name=p6 lab=VIN4}
C {symbols/pfet_03v3.sym} 0 -100 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 0 0 0 0 {name=M2
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
C {symbols/pfet_03v3.sym} 200 -100 0 0 {name=M3
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
C {symbols/nfet_03v3.sym} 200 0 0 0 {name=M4
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
C {symbols/pfet_03v3.sym} 450 -100 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} 450 0 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} 700 -100 0 0 {name=M7
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
C {symbols/nfet_03v3.sym} 700 0 0 0 {name=M8
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
C {lab_pin.sym} 370 -130 1 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 370 30 3 0 {name=p8 sig_type=std_logic lab=VSS}
C {ipin.sym} -20 -60 0 0 {name=p9 lab=VIN5}
C {ipin.sym} 180 -60 0 0 {name=p10 lab=VIN6}
C {ipin.sym} 430 -60 0 0 {name=p11 lab=VIN7}
C {ipin.sym} 680 -60 0 0 {name=p12 lab=VIN8}
C {opin.sym} 30 280 0 0 {name=p13 lab=VOUT1}
C {opin.sym} 230 280 0 0 {name=p14 lab=VOUT2}
C {opin.sym} 480 280 0 0 {name=p15 lab=VOUT3}
C {opin.sym} 730 280 0 0 {name=p16 lab=VOUT4}
C {opin.sym} 20 -50 0 0 {name=p17 lab=VOUT5}
C {opin.sym} 220 -50 0 0 {name=p18 lab=VOUT6}
C {opin.sym} 470 -50 0 0 {name=p19 lab=VOUT7}
C {opin.sym} 720 -50 0 0 {name=p20 lab=VOUT8}
C {iopin.sym} -240 -100 0 0 {name=p21 lab=VDD}
C {lab_pin.sym} -240 -50 2 0 {name=p22 sig_type=std_logic lab=VDD}
C {iopin.sym} -330 -100 0 0 {name=p23 lab=VSS}
C {lab_pin.sym} -330 -50 2 0 {name=p24 sig_type=std_logic lab=VSS}
