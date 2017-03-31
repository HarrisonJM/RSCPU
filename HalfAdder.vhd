library ieee;
use ieee.std_logic_1164.all;

--Creation of halfadder module

entity HalfAdder is
port (A, B : in std_logic;
		C, S : out std_logic);
end entity;

architecture dataflow of HalfAdder is
begin 
C <= A and B;
S <= A xor B;
end dataflow;
