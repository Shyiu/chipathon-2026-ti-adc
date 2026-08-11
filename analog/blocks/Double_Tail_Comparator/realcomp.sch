v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -300 -270 -300 -210 {lab=CLK}
N -240 -270 -240 -210 {lab=VDD}
N -180 -270 -180 -210 {lab=VSS}
N 100 -660 100 -600 {lab=VDD}
N 330 -660 330 -600 {lab=VDD}
N 480 -660 480 -600 {lab=VDD}
N 720 -660 720 -600 {lab=VDD}
N 100 -660 720 -660 {lab=VDD}
N 410 -700 410 -660 {lab=VDD}
N 100 -540 100 -500 {lab=OUTP}
N 100 -500 330 -500 {lab=OUTP}
N 330 -540 330 -500 {lab=OUTP}
N 480 -540 480 -500 {lab=OUTN}
N 480 -500 720 -500 {lab=OUTN}
N 720 -540 720 -500 {lab=OUTN}
N 320 -440 560 -370 {lab=OUTP}
N 220 -440 320 -440 {lab=OUTP}
N 220 -500 220 -400 {lab=OUTP}
N 260 -370 500 -440 {lab=OUTN}
N 500 -440 600 -440 {lab=OUTN}
N 600 -500 600 -440 {lab=OUTN}
N 600 -440 600 -400 {lab=OUTN}
N 220 -340 220 -240 {lab=#net1}
N 600 -340 600 -240 {lab=#net2}
N 220 -310 380 -310 {lab=#net1}
N 440 -310 600 -310 {lab=#net2}
N 220 -180 220 -140 {lab=#net3}
N 220 -140 600 -140 {lab=#net3}
N 600 -180 600 -140 {lab=#net3}
N 410 -140 410 -90 {lab=#net3}
N 410 -30 410 -0 {lab=VSS}
N 130 -370 220 -370 {lab=VSS}
N 600 -370 690 -370 {lab=VSS}
N 100 -570 160 -570 {lab=VDD}
N 260 -570 330 -570 {lab=VDD}
N 490 -570 550 -570 {lab=VDD}
N 650 -570 720 -570 {lab=VDD}
N 480 -570 490 -570 {lab=VDD}
N 370 -570 480 -500 {lab=OUTN}
N 330 -500 440 -570 {lab=OUTP}
N 180 -440 220 -440 {lab=OUTP}
N 600 -440 640 -440 {lab=OUTN}
N 130 -210 180 -210 {lab=INN}
N 410 -310 410 -270 {lab=VDD}
N 410 -60 430 -60 {lab=VSS}
N 430 -60 430 -30 {lab=VSS}
N 410 -30 430 -30 {lab=VSS}
N 40 -270 40 -210 {lab=INN}
N 40 -270 130 -270 {lab=INN}
N 130 -270 130 -210 {lab=INN}
N 220 -210 250 -210 {lab=VSS}
N 250 -210 250 -170 {lab=VSS}
N 100 -170 250 -170 {lab=VSS}
N 100 -210 100 -170 {lab=VSS}
N 80 -210 100 -210 {lab=VSS}
N 140 -170 140 -150 {lab=VSS}
N 80 -240 220 -240 {lab=#net1}
N 80 -180 220 -180 {lab=#net3}
N 600 -180 760 -180 {lab=#net3}
N 600 -240 760 -240 {lab=#net2}
N 590 -210 590 -160 {lab=VSS}
N 590 -160 730 -160 {lab=VSS}
N 730 -210 730 -160 {lab=VSS}
N 730 -210 760 -210 {lab=VSS}
N 590 -210 600 -210 {lab=VSS}
N 640 -260 640 -210 {lab=INP}
N 640 -260 800 -260 {lab=INP}
N 800 -260 800 -210 {lab=INP}
C {ipin.sym} -300 -270 1 0 {name=p3 lab=CLK}
C {lab_pin.sym} -300 -210 0 0 {name=p4 sig_type=std_logic lab=CLK}
C {iopin.sym} -180 -270 3 0 {name=p6 lab=VSS}
C {iopin.sym} -240 -270 3 0 {name=p14 lab=VDD}
C {lab_pin.sym} -240 -210 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -180 -210 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {symbols/nfet_03v3.sym} 200 -210 0 0 {name=M1
L=0.28u
W=1.4u
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
C {symbols/nfet_03v3.sym} 620 -210 0 1 {name=M2
L=0.28u
W=1.4u
nf=2
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
C {symbols/nfet_03v3.sym} 390 -60 0 0 {name=M3
L=0.28u
W=02.56u
nf=2
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
C {symbols/nfet_03v3.sym} 580 -370 0 0 {name=M4
L=0.28u
W=0.71u
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
C {symbols/nfet_03v3.sym} 240 -370 0 1 {name=M5
L=0.28u
W=0.71u
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
C {symbols/pfet_03v3.sym} 80 -570 0 0 {name=M6
L=0.28u
W=2.13u
nf=3
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
C {symbols/pfet_03v3.sym} 460 -570 0 0 {name=M7
L=0.28u
W=1.42u
nf=2
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
C {symbols/pfet_03v3.sym} 740 -570 0 1 {name=M8
L=0.28u
W=2.13u
nf=3
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
C {symbols/pfet_03v3.sym} 350 -570 0 1 {name=M10
L=0.28u
W=1.42u
nf=2
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
C {lab_pin.sym} 410 -700 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 410 -350 0 0 {name=p2 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 410 0 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 140 -150 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 590 -160 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 130 -370 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 690 -370 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 160 -570 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 260 -570 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 550 -570 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 650 -570 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 60 -570 0 0 {name=p18 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 760 -570 2 0 {name=p19 sig_type=std_logic lab=CLK}
C {opin.sym} 180 -440 2 0 {name=p20 lab=OUTP}
C {opin.sym} 640 -440 0 0 {name=p21 lab=OUTN}
C {ipin.sym} 40 -270 0 0 {name=p22 lab=INN}
C {ipin.sym} 800 -260 2 0 {name=p23 lab=INP}
C {lab_pin.sym} 370 -60 0 0 {name=p25 sig_type=std_logic lab=CLK}
C {symbols/pfet_03v3.sym} 410 -330 3 1 {name=M9
L=0.28u
W=2.88u
nf=2
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
C {lab_pin.sym} 410 -270 3 0 {name=p24 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 60 -210 0 0 {name=M11
L=0.28u
W=1.4u
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
C {symbols/nfet_03v3.sym} 780 -210 0 1 {name=M12
L=0.28u
W=1.4u
nf=2
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
