library IEEE;
use IEEE.std_logic_1164.all;

entity TR16 is
	port (clk, load, reset: in std_logic;
			D : in std_logic_vector(15 downto 0);
			Q : out std_logic_vector(15 downto 0)
			);
end TR16;

architecture rtl of TR16 is

begin

	process (clk, load, reset, D)
	begin
	
		if reset = '0' then
		
			Q <= (others => '0');
			
		elsif falling_edge(clk) then
		
			if load ='1' then
			
				Q <= D;
				
			end if;
			
		end if;
	
	end process;
	
end rtl;