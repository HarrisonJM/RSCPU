--ENCODER
library IEEE;
use IEEE.std_logic_1164.all;

entity encoder is

port(	enables 	: in std_logic_vector(6 downto 0);
		encinst	: out std_logic_vector(2 downto 0)
	  );
	  
end encoder;


architecture behav of encoder is


begin

	process(enables) 	--bus <= mem, bus <= PC, bus <= DRH, bus <= DRL, bus <= TR, bus <= R, bus <= AC
	begin
		
		case enables is		
		when "1000000" => --MEMBUS
			encinst <= "000";
		
		when "0100000" => --PCBUS
			encinst <= "001";
		
		when "0010100" => --DRHBUS & TRBUS
			encinst <= "010";
		
		when "0001000" => --DRLBUS
			encinst <= "011";
		
		when "0000100" => --TRBUS
			encinst <= "111";
		
		when "0000010" => --RBUS
			encinst <= "110";
		
		when "0000001" => --ACBUS
			encinst <= "100";	
		
		when others =>
			encinst <= "000";
		end case;
		
		
	end process;


end behav;