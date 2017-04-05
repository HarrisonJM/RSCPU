force -freeze z 0 0
force -freeze c 0 0
force -freeze n 0 0
force -freeze o 0 0
force -freeze reset 0 0

force -freeze clk 1 0, 0 {50 ps} -r 100

run 200ps

force -freeze reset 1 0