onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Inputs} -radix unsigned /alu/O_IN
add wave -noupdate -expand -group {Inputs} -radix unsigned /alu/AC_IN
add wave -noupdate -expand -group {Inputs} -radix unsigned /alu/BUS_IN
add wave -noupdate -expand -group {Inputs} -radix binary /alu/ALUS
add wave -noupdate /alu/ACOUT
add wave -noupdate /alu/Cout
add wave -noupdate /alu/OVout
add wave -noupdate /alu/NegOut
add wave -noupdate /alu/ADDEROUT
add wave -noupdate /alu/BITWISEOUT
add wave -noupdate /alu/ALUS23
add wave -noupdate /alu/ALUS56
add wave -noupdate /alu/Coutsig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1997 ps}
