v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -240 160 -180 {lab=CLK}
N 220 -240 220 -180 {lab=VDD}
N 280 -240 280 -180 {lab=VSS}
N 560 -630 560 -570 {lab=VDD}
N 790 -630 790 -570 {lab=VDD}
N 940 -630 940 -570 {lab=VDD}
N 1180 -630 1180 -570 {lab=VDD}
N 560 -630 1180 -630 {lab=VDD}
N 870 -670 870 -630 {lab=VDD}
N 560 -510 560 -470 {lab=OUTP}
N 560 -470 790 -470 {lab=OUTP}
N 790 -510 790 -470 {lab=OUTP}
N 940 -510 940 -470 {lab=OUTN}
N 940 -470 1180 -470 {lab=OUTN}
N 1180 -510 1180 -470 {lab=OUTN}
N 780 -410 1020 -340 {lab=OUTP}
N 680 -410 780 -410 {lab=OUTP}
N 680 -470 680 -370 {lab=OUTP}
N 720 -340 960 -410 {lab=OUTN}
N 960 -410 1060 -410 {lab=OUTN}
N 1060 -470 1060 -410 {lab=OUTN}
N 1060 -410 1060 -370 {lab=OUTN}
N 680 -310 680 -210 {lab=#net1}
N 1060 -310 1060 -210 {lab=#net2}
N 680 -280 840 -280 {lab=#net1}
N 900 -280 1060 -280 {lab=#net2}
N 680 -150 680 -110 {lab=#net3}
N 680 -110 1060 -110 {lab=#net3}
N 1060 -150 1060 -110 {lab=#net3}
N 870 -110 870 -60 {lab=#net3}
N 870 0 870 30 {lab=VSS}
N 680 -180 750 -180 {lab=VSS}
N 970 -180 1060 -180 {lab=VSS}
N 590 -340 680 -340 {lab=VSS}
N 1060 -340 1150 -340 {lab=VSS}
N 560 -540 620 -540 {lab=VDD}
N 720 -540 790 -540 {lab=VDD}
N 950 -540 1010 -540 {lab=VDD}
N 1110 -540 1180 -540 {lab=VDD}
N 940 -540 950 -540 {lab=VDD}
N 830 -540 940 -470 {lab=OUTN}
N 790 -470 900 -540 {lab=OUTP}
N 640 -410 680 -410 {lab=OUTP}
N 1060 -410 1100 -410 {lab=OUTN}
N 590 -180 640 -180 {lab=INN}
N 1100 -180 1170 -180 {lab=INP}
N 870 -280 870 -240 {lab=VSS}
N 870 -30 890 -30 {lab=VSS}
N 890 -30 890 0 {lab=VSS}
N 870 0 890 0 {lab=VSS}
C {ipin.sym} 160 -240 1 0 {name=p3 lab=CLK}
C {lab_pin.sym} 160 -180 0 0 {name=p4 sig_type=std_logic lab=CLK}
C {iopin.sym} 280 -240 3 0 {name=p6 lab=VSS}
C {iopin.sym} 220 -240 3 0 {name=p14 lab=VDD}
C {lab_pin.sym} 220 -180 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 280 -180 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {symbols/nfet_03v3.sym} 660 -180 0 0 {name=M1
L=0.28u
W=0.22u
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
C {symbols/nfet_03v3.sym} 1080 -180 0 1 {name=M2
L=0.28u
W=0.22u
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
C {symbols/nfet_03v3.sym} 850 -30 0 0 {name=M3
L=0.28u
W=0.22u
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
C {symbols/nfet_03v3.sym} 1040 -340 0 0 {name=M4
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
C {symbols/nfet_03v3.sym} 700 -340 0 1 {name=M5
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
C {symbols/pfet_03v3.sym} 540 -540 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} 920 -540 0 0 {name=M7
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
C {symbols/pfet_03v3.sym} 1200 -540 0 1 {name=M8
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
C {symbols/pfet_03v3.sym} 810 -540 0 1 {name=M10
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
C {lab_pin.sym} 870 -670 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 870 -300 1 0 {name=M11
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
C {lab_pin.sym} 870 -320 0 0 {name=p2 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 870 30 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 750 -180 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 970 -180 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 590 -340 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1150 -340 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 620 -540 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 720 -540 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1010 -540 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1110 -540 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 520 -540 0 0 {name=p18 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 1220 -540 2 0 {name=p19 sig_type=std_logic lab=CLK}
C {opin.sym} 640 -410 2 0 {name=p20 lab=OUTP}
C {opin.sym} 1100 -410 0 0 {name=p21 lab=OUTN}
C {ipin.sym} 590 -180 0 0 {name=p22 lab=INN}
C {ipin.sym} 1170 -180 2 0 {name=p23 lab=INP}
C {lab_pin.sym} 870 -240 3 0 {name=p24 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 830 -30 0 0 {name=p25 sig_type=std_logic lab=CLK}
