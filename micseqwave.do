onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {outside} /micseq/MM1/clk
add wave -noupdate -expand -group {outside} /micseq/reset
add wave -noupdate -expand -group {outside} /micseq/z
add wave -noupdate -expand -group {outside} /micseq/c
add wave -noupdate -expand -group {outside} /micseq/n
add wave -noupdate -expand -group {outside} /micseq/o
add wave -noupdate -expand -group {outside} /micseq/MicOps_out
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/selector
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/Z
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/C
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/N
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/O
add wave -noupdate -expand -group {CondMux} /micseq/CNM1/success_out
add wave -noupdate -expand -group {BT} /micseq/BTL1/Cond
add wave -noupdate -expand -group {BT} /micseq/BTL1/BT
add wave -noupdate -expand -group {BT} /micseq/BTL1/MuxOut
add wave -noupdate -expand -group {BT} /micseq/BTL1/LDMSUB
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/clk
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/opcode_in
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/NanoAddr
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/BT
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/Cond
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/next_address
add wave -noupdate -expand -group {MicroMem} /micseq/MM1/micCodeSig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10452 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 314
configure wave -valuecolwidth 228
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
WaveRestoreZoom {10306 ps} {10683 ps}
