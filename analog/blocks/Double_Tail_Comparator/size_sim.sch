v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
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
N 220 -210 290 -210 {lab=VSS}
N 510 -210 600 -210 {lab=VSS}
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
N 640 -210 710 -210 {lab=INP}
N 410 -310 410 -270 {lab=VSS}
N 410 -60 430 -60 {lab=VSS}
N 430 -60 430 -30 {lab=VSS}
N 410 -30 430 -30 {lab=VSS}
N -490 -500 -490 -460 {lab=0}
N -430 -600 -430 -565 {lab=INP}
N -430 -500 -430 -460 {lab=0}
N -370 -600 -370 -560 {lab=INN}
N -370 -500 -370 -460 {lab=0}
N -430 -565 -430 -560 {lab=INP}
N -315 -500 -315 -460 {lab=0}
N -315 -600 -315 -560 {lab=CLK}
N -490 -600 -490 -560 {lab=VDD}
C {symbols/nfet_03v3.sym} 200 -210 0 0 {name=M1
L=0.28u
W=2.852u
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
C {symbols/nfet_03v3.sym} 620 -210 0 1 {name=M2
L=0.28u
W=2.852u
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
W=02.5757u
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
W=0.713
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
W=0.713
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
C {symbols/pfet_03v3.sym} 460 -570 0 0 {name=M7
L=0.28u
W=1.426u
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
C {symbols/pfet_03v3.sym} 740 -570 0 1 {name=M8
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
C {symbols/pfet_03v3.sym} 350 -570 0 1 {name=M10
L=0.28u
W=1.426u
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
C {lab_pin.sym} 410 -700 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 410 -330 1 0 {name=M11
L=0.28u
W=2.852u
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
C {lab_pin.sym} 410 -350 0 0 {name=p2 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 410 0 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 290 -210 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 510 -210 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 130 -370 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 690 -370 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 160 -570 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 260 -570 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 550 -570 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 650 -570 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 60 -570 0 0 {name=p18 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 760 -570 2 0 {name=p19 sig_type=std_logic lab=CLK}
C {ipin.sym} 130 -210 0 0 {name=p22 lab=INN}
C {ipin.sym} 710 -210 2 0 {name=p23 lab=INP}
C {lab_pin.sym} 410 -270 3 0 {name=p24 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 370 -60 0 0 {name=p25 sig_type=std_logic lab=CLK}
C {vsource.sym} -490 -530 0 0 {name=V1 
value=3.3
savecurrent=false}
C {vsource.sym} -430 -530 0 0 {name=V2 
value="sin(2 1 25MEG)"
savecurrent=false}
C {vsource.sym} -370 -530 0 0 {name=V3 
value="sin(2 1 25MEG 5n)"
savecurrent=false}
C {lab_pin.sym} -430 -600 1 0 {name=p26 sig_type=std_logic lab=INP}
C {lab_pin.sym} -370 -600 1 0 {name=p27 sig_type=std_logic lab=INN}
C {gnd.sym} -490 -460 0 0 {name=l1 lab=0}
C {gnd.sym} -430 -460 0 0 {name=l2 lab=0}
C {gnd.sym} -370 -460 0 0 {name=l3 lab=0}
C {lab_pin.sym} -315 -600 1 0 {name=p28 sig_type=std_logic lab=CLK}
C {vsource.sym} -315 -530 0 0 {name=V5 
value= "PULSE(0 3.3 2.5n 50p 50p 2.5n 5n)"
savecurrent=false}
C {gnd.sym} -315 -460 0 0 {name=l4 lab=0}
C {lab_pin.sym} -490 -600 1 0 {name=p29 sig_type=std_logic lab=VDD}
C {code_shown.sym} -950 -870 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical
"}
C {lab_pin.sym} 180 -440 0 0 {name=p3 sig_type=std_logic lab=OUTP}
C {lab_pin.sym} 640 -440 2 0 {name=p4 sig_type=std_logic lab=OUTN}
C {code_shown.sym} -1130 -700 0 0 {name=s1 only_toplevel=true 
value="
.control
tran 2n 30n
plot v(OUTP) v(OUTN) v(INP) v(INN) v(CLK)
.endc
"}
