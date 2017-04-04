force -freeze sim:/alu/O_IN 00000000 0
force -freeze sim:/alu/AC_IN 00000000 0
force -freeze sim:/alu/BUS_IN 00000000 0
force -freeze sim:/alu/ALUS 0000000 0

run 100ps

#set ALU_ADD_MODE 0000101;
#set ALU_SUB_MODE 0001011;
#set ALU_INC_MODE 0001001;
#set ALU_AND_MODE 1000000;
#set ALU_OR_MODE  1100000;
#set ALU_XOR_MODE 1010000;
#set ALU_NOT_MODE 1110000;

#NEED AN OVERFLOW RESET!!