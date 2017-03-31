--Carry flag
library IEEE;
use IEEE.std_logic_1164.all;

entity Cry is
	port (D, clk, load, reset : in std_logic;
			Q : out std_logic
			);
end Cry;

Architecture behaviour of Cry is

begin

process(reset, clk, D, load)
	begin
	if reset = '0' then
	Q <= '0';
	
	elsif (falling_edge(clk) and load = '1') then
	Q <= D;
	end if;		
end process;
end;