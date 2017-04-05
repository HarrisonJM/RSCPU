#ALU .DO file

restart -force -nowave

#entity fullALU is
#  
#  generic (
#    n : natural := 8);                  -- n-bit wide adder
#
#  port (
#   AC       : in std_logic_vector((n-1) downto 0);
#    dataBus  : in std_logic_vector((n-1) downto 0);
#    aluSelect: in std_logic_vector (7 downto 1);
#    dataOut  : out std_logic_vector ((n-1) downto 0));              
#
#end entity fullALU;

#entity ALU is 
#port  (	   O_IN 		: in std_logic_vector(7 downto 0);
#			AC_IN 	: in std_logic_vector(7 downto 0);
#			BUS_IN 	: in std_logic_vector(7 downto 0);
#			ALUS 	: in std_logic_vector(6 downto 0); -- Selectors, swap 2 and 3, 5 and 6
#			ACOUT 	: out std_logic_vector (7 downto 0);
#			Cout	: out std_logic
#		);
#end ALU;


add wave  -color blue     -logic   AC_IN
add wave  -color green    -logic   BUS_IN
add wave  -color red      -logic   ALUS
add wave  -color black    -logic   O_IN

add wave  -color orange   -logic   ACOUT

add wave  -color orange   -logic   Cout


#prepare a file we can write the simulation results to

set filename "ALUVerification.txt"
set fp [open $filename "w"]


#stimulus
configure wave -timelineunits ns


#start with some default values
force -freeze AC_IN    "00000000" 0ns
force -freeze BUS_IN   "00000000" 0ns
force -freeze O_IN     "00000000" 0ns

force -freeze ALUS     "0000000" 0ns


#a few defines for the ALUModes
#add more modes here
set ALU_ADD_MODE 0000101;
set ALU_SUB_MODE 0001011;
set ALU_INC_MODE 0001001;
set ALU_AND_MODE 1000000;
set ALU_OR_MODE  1100000;
set ALU_XOR_MODE 1010000;
set ALU_NOT_MODE 1110000;

set ALU_TRF_MODE 0000100;

set errorCount 0

# give the simulator a bit of space
run 20ns 

#start with the add testing

force -freeze ALUS $ALU_ADD_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU ADD MODE!"
for {set i 0} {$i < 128} {incr i} {

	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
	set busValue [expr round(128*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze BUS_IN 10#[expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i + $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /ACOUT]
	set simulatedCarry [examine -unsigned /Cout]
    
	#echo  "Test: [expr $i] + [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"
	
	#puts $fp "Test: [expr $i] + [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"
    
    
    
	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_SUB_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU SUB MODE!"
for {set i 0} {$i < 128} {incr i} {
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
	set busValue [expr round(327*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze BUS_IN 10 #[expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i - $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -signed /ACOUT]
	set simulatedCarry [examine -unsigned /Cout]

    
	#echo  "Test: [expr $i] - [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"
	#puts $fp "Test: [expr $i] - [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_INC_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU increment MODE!"
for {set i 0} {$i < 255} {incr i} {
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
    #set AcVal [expr round(327*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	#force -freeze AC_IN [expr $AcVal]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i + 1]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /ACOUT]
	set simulatedCarry [examine -unsigned /Cout]
    
    #echo  "Test: [expr $i] + 1  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"
	#puts $fp "Test: [expr $i] + 1  : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]  :\t Carryout= [expr $simulatedCarry]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
    if {$calculatedACoutput != $simulatedResult} {
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_AND_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU AND MODE!"
for {set i 0} {$i < 256} {incr i} {
    
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
	set busValue [expr round(256*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze BUS_IN [expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i & $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /ACOUT]

    
	echo  "Test: [expr $i] & [expr $busValue]  :\t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]"
	puts $fp "Test: \t[expr $i] & [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] : Simulated Result= [expr $simulatedResult]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_OR_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU OR MODE!"
for {set i 0} {$i < 256} {incr i} {
    
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
	set busValue [expr round(256*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze BUS_IN [expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ns

	#calculate what we should get
	set calculatedACoutput  [expr $i | $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /ACOUT]

    
	echo  "Test: [expr $i] | [expr $busValue]  :\t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]"
	puts $fp "Test: \t[expr $i] | [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] : Simulated Result= [expr $simulatedResult]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
	    
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_XOR_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU OR MODE!"
for {set i 0} {$i < 256} {incr i} {
    
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]

	#for the bus input generate a random number
	set busValue [expr round(256*rand())]; # ATTENTION, A RANDOM NUMBER > 127 COULD LEAD TO ALU OVERFLOW! FOR ILLUSTRATION ONLY
	force -freeze BUS_IN [expr $busValue]
 
	#let the simulator run for the results to be available
	run 10ps

	#calculate what we should get
	set calculatedACoutput  [expr $i ^ $busValue]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -unsigned /ACOUT]

    
	echo  "Test: [expr $i] ^ [expr $busValue]  :\t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]"
	puts $fp "Test: \t[expr $i] ^ [expr $busValue]  : \t calculatedACoutput= [expr $calculatedACoutput] : Simulated Result= [expr $simulatedResult]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
	    
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

force -freeze ALUS $ALU_NOT_MODE
#do a large amount of iterations, 12 for demo only
echo "\n\n\nALU NOT MODE!"
for {set i 0} {$i < 256} {incr i} {
    
	#set the data for the AC input according to variabl i
	force -freeze AC_IN [expr $i]
 
	#let the simulator run for the results to be available
	run 10ps

	#calculate what we should get
	set calculatedACoutput  [expr ~$i]; #this is a comment
	
	#examine the signal
	set simulatedResult [examine -signed /ACOUT]

    
	echo  "Test: ~[expr $i] : \t calculatedACoutput= [expr $calculatedACoutput] 	:\t Simulated Result= [expr $simulatedResult]"
	puts $fp "Test: \t ~[expr $i] : \t calculatedACoutput= [expr $calculatedACoutput] : Simulated Result= [expr $simulatedResult]"

	#run another 10ns for visual reasons only
	run 10ns

	##check for errors
	if {$calculatedACoutput != $simulatedResult}	{
	    
		echo "ERROR!"
		#break the for loop to stop the simulator
		set errorCount [expr $errorCount + 1]
		#break
	}	
}

echo "Simulation finished! Error count= [expr $errorCount]."
puts $fp  "Simulation finished! Error count= [expr $errorCount]."
set simulationPath pwd
echo "Simulation Results availabe at:  [pwd]/$filename " 
 
close $fp






