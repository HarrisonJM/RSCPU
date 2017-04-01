--OPLUT
-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity OPLUT is
port( 
		addr: in std_logic_vector(5 downto 0);
		micCode_out: out std_logic_vector(14 downto 0)
    );
end entity;

architecture struct of OPLUT is

	type micMem is array (0 to 63) of std_logic_vector(14 downto 0);
	
	constant micCode : micMem := 
	( --GO THROUGH TABLE AND DOUBLE CHECK ALLL ENTRIES!!!
			--Cond	BT 	 MicopAddr	NextAddress
	  0  => "00" & "00" & "00000" & "000001",     -- NOP
	  1  => "00" & "00" & "00001" & "000010",     -- FETCH1
	  2  => "00" & "00" & "00010" & "000011",     -- FETCH2
	  3  => "11" & "01" & "00011" & "000000",     -- FETCH3
	  
	  4  => "00" & "10" & "00000" & "111101",     -- LDAC0
	  5  => "00" & "00" & "00100" & "100001",     -- LDAC4
	  
	  8  => "00" & "10" & "00000" & "111101",     -- STAC0
	  9  => "00" & "00" & "00101" & "100010",     -- STAC4
	  
	  12 => "00" & "00" & "00110" & "000001",     -- MVAC1  
	  16 => "00" & "00" & "00111" & "000001",     -- MOVR1

	  20 => "00" & "00" & "01000" & "010101",     -- JUMP1
	  21 => "00" & "00" & "01001" & "010110",     -- JUMP2
	  22 => "00" & "00" & "01010" & "000001",     -- JUMP3
	  
	  24 => "01" & "00" & "00000" & "011001",     -- JMPZ1  --jump if zero
	  25 => "11" & "00" & "00000" & "011010",     -- JMPZN1 -- fail state
	  26 => "11" & "00" & "00000" & "000001",     -- JMPZN2
	  
	  28 => "10" & "00" & "00000" & "010100",     -- JPNZ1
	  
	  32 => "11" & "00" & "01101" & "000001",     -- ADD1

	  33 => "11" & "00" & "01011" & "000001",     -- LDAC5
	  34 => "11" & "00" & "01100" & "000001",     -- STAC5
	  
	  36 => "11" & "00" & "01110" & "000001",     -- SUB1
	  40 => "11" & "00" & "01111" & "000001",     -- INAC1
	  44 => "11" & "00" & "10000" & "000001",     -- CLAC1
	  
	  45 => "11" & "00" & "10001" & "011010",     -- JPNZN1 --fail state
	  
	  48 => "11" & "00" & "10010" & "000001",     -- AND1  
	  52 => "11" & "00" & "10011" & "000001",     -- OR1  
	  56 => "11" & "00" & "10100" & "000001",     -- XOR1  
	  60 => "11" & "00" & "10101" & "000001",     -- NOT1	
	  
	  61 => "11" & "00" & "10110" & "111110",     -- SLSUB0
	  62 => "11" & "00" & "10111" & "111111",     -- SLSUB1
	  63 => "11" & "11" & "11000" & "000000",     -- SLSUB2
	  
	  others => (others => '0')
	);

begin

	micCode_out <= micCode(to_integer(unsigned(addr)));


end struct;