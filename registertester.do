#16-bit Register tester

force -freeze sim:/PC/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/PC/reset 1 0

run

force -freeze sim:/PC/reset 0 0

    set busValue [expr round(327*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
    force -freeze dataBus [expr $busValue]

force -freeze sim:/PC/D 0 0
