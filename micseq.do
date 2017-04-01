
force -freeze sim:/micseq/opcode_in 0000 0
force -freeze sim:/micseq/reset 0 0
force -freeze sim:/micseq/z 0 0
force -freeze sim:/micseq/clk 1 0, 0 {50 ps} -r 100

run

force -freeze sim:/micseq/reset 1 0

run

set l { "0000" "0001" "0010" "0011" "0100" "0101" "0110" "0111" "1000" "1001" "1010" "1011" "1100" "1101" "1110" "1111"}

for {set i 0} {$i < 16} {incr i} {
    
    
    force -freeze sim:/micseq/opcode_in [lindex $l $i]

    run 1000ps

}