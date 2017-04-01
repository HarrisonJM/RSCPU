onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/CPU/clk
add wave -noupdate /tb/CPU/reset
add wave -noupdate -expand -group Memory /tb/MEMORY/ram
add wave -noupdate -expand -group Memory -label CPU<=MEM /tb/CPU/MEMIN
add wave -noupdate -expand -group Memory -radix hexadecimal /tb/CPU/ADDROUT
add wave -noupdate -expand -group Memory -label MEM<=CPU /tb/CPU/MEMOUT
add wave -noupdate -expand -group Memory /tb/CPU/memwrite
add wave -noupdate -expand -group Memory /tb/CPU/memread
add wave -noupdate -expand -group MicroSequencer -label Z /tb/CPU/ControlUnit/z
add wave -noupdate -expand -group MicroSequencer -label opcode -radix binary /tb/CPU/ControlUnit/opcode_in
add wave -noupdate -expand -group MicroSequencer -label MicroOperation /tb/CPU/ControlUnit/MicOps_out
add wave -noupdate -group PC -radix hexadecimal /tb/CPU/AR1/reg
add wave -noupdate -group PC /tb/CPU/AR1/load
add wave -noupdate -group PC /tb/CPU/AR1/inc
add wave -noupdate -group PC -radix hexadecimal /tb/CPU/AR1/D
add wave -noupdate -group PC -radix hexadecimal /tb/CPU/AR1/Q
add wave -noupdate -expand -group AR /tb/CPU/AR1/reset
add wave -noupdate -expand -group AR -radix hexadecimal /tb/CPU/AR1/reg
add wave -noupdate -expand -group AR /tb/CPU/AR1/load
add wave -noupdate -expand -group AR /tb/CPU/AR1/inc
add wave -noupdate -expand -group AR -radix hexadecimal -childformat {{/tb/CPU/AR1/D(15) -radix hexadecimal} {/tb/CPU/AR1/D(14) -radix hexadecimal} {/tb/CPU/AR1/D(13) -radix hexadecimal} {/tb/CPU/AR1/D(12) -radix hexadecimal} {/tb/CPU/AR1/D(11) -radix hexadecimal} {/tb/CPU/AR1/D(10) -radix hexadecimal} {/tb/CPU/AR1/D(9) -radix hexadecimal} {/tb/CPU/AR1/D(8) -radix hexadecimal} {/tb/CPU/AR1/D(7) -radix hexadecimal} {/tb/CPU/AR1/D(6) -radix hexadecimal} {/tb/CPU/AR1/D(5) -radix hexadecimal} {/tb/CPU/AR1/D(4) -radix hexadecimal} {/tb/CPU/AR1/D(3) -radix hexadecimal} {/tb/CPU/AR1/D(2) -radix hexadecimal} {/tb/CPU/AR1/D(1) -radix hexadecimal} {/tb/CPU/AR1/D(0) -radix hexadecimal}} -subitemconfig {/tb/CPU/AR1/D(15) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(14) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(13) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(12) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(11) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(10) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(9) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(8) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(7) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(6) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(5) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(4) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(3) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(2) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(1) {-height 15 -radix hexadecimal} /tb/CPU/AR1/D(0) {-height 15 -radix hexadecimal}} /tb/CPU/AR1/D
add wave -noupdate -expand -group AR -radix hexadecimal /tb/CPU/AR1/Q
add wave -noupdate -group AC /tb/CPU/AC1/load
add wave -noupdate -group AC /tb/CPU/AC1/D
add wave -noupdate -group AC /tb/CPU/AC1/Q
add wave -noupdate -group R /tb/CPU/R1/clk
add wave -noupdate -group R /tb/CPU/R1/load
add wave -noupdate -group R /tb/CPU/R1/reset
add wave -noupdate -group R /tb/CPU/R1/D
add wave -noupdate -group R /tb/CPU/R1/Q
add wave -noupdate -group IR /tb/CPU/IR1/clk
add wave -noupdate -group IR /tb/CPU/IR1/load
add wave -noupdate -group IR /tb/CPU/IR1/reset
add wave -noupdate -group IR /tb/CPU/IR1/D
add wave -noupdate -group IR /tb/CPU/IR1/Q
add wave -noupdate -group TR /tb/CPU/TR1/clk
add wave -noupdate -group TR /tb/CPU/TR1/load
add wave -noupdate -group TR /tb/CPU/TR1/reset
add wave -noupdate -group TR /tb/CPU/TR1/D
add wave -noupdate -group TR /tb/CPU/TR1/Q
add wave -noupdate -group DR /tb/CPU/DR1/clk
add wave -noupdate -group DR /tb/CPU/DR1/load
add wave -noupdate -group DR /tb/CPU/DR1/reset
add wave -noupdate -group DR /tb/CPU/DR1/D
add wave -noupdate -group DR /tb/CPU/DR1/Q
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/O_IN
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/AC_IN
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/BUS_IN
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/ALUS
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/ACOUT
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/Cout
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/ADDEROUT
add wave -noupdate -expand -group ALU /tb/CPU/ALU1/BITWISEOUT
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/clk
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/reset
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/z
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/opcode_in
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/MicOps_out
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/subreg
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/OPCODEsig
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/LD
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/MuxToReg
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/MuxSelector
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/Regout
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/RegPOout
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/Condsig
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/BTsig
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/CondMuxSig
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/nanomem
add wave -noupdate -expand -group nittyggrittyCU /tb/CPU/ControlUnit/MMtoMux
add wave -noupdate -expand -group Bus /tb/CPU/MAINBUS
add wave -noupdate -expand -group Bus /tb/CPU/OE
add wave -noupdate -expand -group Bus /tb/CPU/PCBUF
add wave -noupdate -expand -group Bus /tb/CPU/ARMEM
add wave -noupdate -expand -group Bus /tb/CPU/DRSIG
add wave -noupdate -expand -group Bus /tb/CPU/BUFTR
add wave -noupdate -expand -group Bus /tb/CPU/BUFR
add wave -noupdate -expand -group Bus /tb/CPU/ACBUS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {124 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
configure wave -valuecolwidth 193
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {721 ps}
