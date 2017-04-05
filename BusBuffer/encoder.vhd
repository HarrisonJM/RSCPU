--ENCODER
library IEEE;
use IEEE.std_logic_1164.all;

entity encoder is

port(	enables 	: in std_logic_vector(8 downto 0);
		encinst	: out std_logic_vector(3 downto 0)
	  );
	  
end encoder;


architecture behav of encoder is


begin

	process(enables) 	--bus <= mem, bus <= PC, bus <= DRH, bus <= DRL, bus <= TR, bus <= R, bus <= AC
	begin
		
		case enables is		
		when "001000000" => --MEMBUS
			encinst <= "0000";
		
		when "000100000" => --PCBUS
			encinst <= "0001";
		
		when "000010100" => --DRHBUS & TRBUS
			encinst <= "0010";
		
		when "000001000" => --DRLBUS
			encinst <= "0011";
		
		when "000000100" => --TRBUS
			encinst <= "0111";
		
		when "000000010" => --RBUS
			encinst <= "0110";
		
		when "000000001" => --ACBUS
			encinst <= "0100";	
			
		when "010000000" => --INDBUS
		  encinst <= "0101";
		  
		when "100000000" => --TRINDBUS
		   encinst <= "1101";		   
		
		when others =>
			encinst <= "1111";
		end case;		
		
	end process;

end behav;