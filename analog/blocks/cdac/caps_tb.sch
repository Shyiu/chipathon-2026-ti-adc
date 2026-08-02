v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 680 -160 710 -160 {lab=#net1}
N 680 60 710 60 {lab=#net2}
N 680 -40 710 -40 {lab=#net3}
N 590 -160 620 -160 {lab=GND}
N 590 -160 590 -40 {lab=GND}
N 590 -40 620 -40 {lab=GND}
N 590 -40 590 60 {lab=GND}
N 590 60 620 60 {lab=GND}
N 550 -100 590 -100 {lab=GND}
N 590 -120 710 -120 {lab=GND}
N 690 0 710 -0 {lab=#net4}
N 590 -0 620 -0 {lab=GND}
N 680 -0 690 -0 {lab=#net4}
C {vsource.sym} 650 60 1 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} 650 -160 1 0 {name=V2 value=0.9 savecurrent=false}
C {vsource.sym} 650 0 1 0 {name=V3 value="PULSE(0 3.3 0 1n 1n 50n 500n)" savecurrent=false}
C {vsource.sym} 650 -40 1 0 {name=V4 value=1.8 savecurrent=false}
C {gnd.sym} 550 -100 1 0 {name=l1 lab=GND}
C {code.sym} 1170 -150 0 0 {name=s1 only_toplevel=false value="
.tran 1n 3.5u
.control
run
plot Vx
.endc
"}
C {proj_branch/analog/blocks/cdac/caps.sym} 860 -60 0 0 {name=x1}
