
force -freeze sim:/tb/CPU/reset 0 0
force -freeze sim:/tb/CPU/clk 1 0, 0 {50 ps} -r 100

run 100ps

force -freeze sim:/tb/CPU/reset 1 0

run