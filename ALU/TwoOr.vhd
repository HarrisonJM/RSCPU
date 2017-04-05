library ieee;
use ieee.std_logic_1164.all;

--Creation of OR Module

entity TwoOr is
port (A, B : in std_logic;
		C	  : out std_logic);
end entity;

architecture dataflow of TwoOr is
begin 
C <= A or B;
end dataflow;
