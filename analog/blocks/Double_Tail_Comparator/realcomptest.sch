v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -700 10 -700 50 {lab=0}
N -640 -90 -640 -55 {lab=INP}
N -640 10 -640 50 {lab=0}
N -580 -90 -580 -50 {lab=INN}
N -580 10 -580 50 {lab=0}
N -640 -55 -640 -50 {lab=INP}
N -525 10 -525 50 {lab=0}
N -525 -90 -525 -50 {lab=CLK}
N -700 -90 -700 -50 {lab=VDD}
C {vsource.sym} -700 -20 0 0 {name=V1 
value=3.3
savecurrent=false}
C {vsource.sym} -640 -20 0 0 {name=V2 
value="sin(2 1 25MEG)"
savecurrent=false}
C {vsource.sym} -580 -20 0 0 {name=V3 
value="sin(2 1 25MEG 5n)"
savecurrent=false}
C {lab_pin.sym} -640 -90 1 0 {name=p2 sig_type=std_logic lab=INP}
C {lab_pin.sym} -580 -90 1 0 {name=p3 sig_type=std_logic lab=INN}
C {gnd.sym} -700 50 0 0 {name=l1 lab=0}
C {gnd.sym} -640 50 0 0 {name=l2 lab=0}
C {gnd.sym} -580 50 0 0 {name=l3 lab=0}
C {lab_pin.sym} -525 -90 1 0 {name=p5 sig_type=std_logic lab=CLK}
C {vsource.sym} -525 -20 0 0 {name=V5 
value= "PULSE(0 3.3 2.5n 50p 50p 2.5n 5n)"
savecurrent=false}
C {gnd.sym} -525 50 0 0 {name=l4 lab=0}
C {lab_pin.sym} -700 -90 1 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 -70 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -30 -80 1 0 {name=p6 sig_type=std_logic lab=CLK}
C {gnd.sym} 0 50 0 0 {name=l6 lab=0}
C {lab_pin.sym} -80 0 0 0 {name=p7 sig_type=std_logic lab=INN}
C {lab_pin.sym} -80 -20 0 0 {name=p8 sig_type=std_logic lab=INP}
C {lab_pin.sym} 120 -30 2 0 {name=p9 sig_type=std_logic lab=OUTP}
C {lab_pin.sym} 120 10 2 0 {name=p10 sig_type=std_logic lab=OUTN}
C {code_shown.sym} -1160 -360 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/smbb000149.ngspice typical
"}
C {code_shown.sym} -430 -330 0 0 {name=s1 only_toplevel=true 
value="
.control
tran 2n 30n
plot v(OUTP) v(OUTN) v(INP) v(INN) v(CLK)
.endc
"}
C {chipathon-2026-ti-adc/analog/blocks/Double_Tail_Comparator/realcomp.sym} 0 -10 0 0 {name=x1}
