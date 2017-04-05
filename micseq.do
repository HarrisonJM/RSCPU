
force -freeze sim:/micseq/opcode_in 0000 0
force -freeze sim:/micseq/reset 0 0
force -freeze sim:/micseq/z 0 0
force -freeze sim:/micseq/clk 1 0, 0 {50 ps} -r 100

run

force -freeze sim:/micseq/reset 1 0

run

set l { "00000" "00001" "00010" "00011" "00100" "00101" "00110" "00111" "01000" "01001" "01010" "01011" "01100" "01101" "01110" "01111"
		"10000" "10001" "10010" "10011" "10100" "10101" "10110" "10111" "11000" "11001" "11010" "11011" "11100" "11101" }

for {set i 0} {$i < 30} {incr i} {
    
    
    force -freeze sim:/micseq/opcode_in [lindex $l $i]

    run 1000ps #10 cycles at steps of 100

}