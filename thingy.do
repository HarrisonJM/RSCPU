
force -freeze sim:/tb/CPU/clk 1 0, 0 {50 ps} -r 100

force -freeze sim:/tb/CPU/reset 0 0
run 100ps


force -freeze sim:/tb/CPU/reset 1 0


run 100ps
force -freeze sim:/tb/CPU/reset 0 0

run 100ps
force -freeze sim:/tb/CPU/reset 1 0

#Run entire program stored in memory

run 10000ps