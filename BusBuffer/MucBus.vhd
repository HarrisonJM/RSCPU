--MuxBus
library IEEE;
use IEEE.std_logic_1164.all;

entity MuxBus is
port( encinst 	: in std_logic_vector(3 downto 0);
		MEMBUS 	: in std_logic_vector(7 downto 0);
		PCBUS 	: in std_logic_vector(15 downto 0);
		DRHBUS	: in std_logic_vector(7 downto 0);
		DRLBUS 	: in std_logic_vector(7 downto 0);
		TRBUS 	: in std_logic_vector(7 downto 0);
		RBUS 		: in std_logic_vector(7 downto 0);
		ACBUS 	: in std_logic_vector(7 downto 0);
		INDBUS 	: in std_logic_vector(15 downto 0);
		TRINDBUS 	: in std_logic_vector(15 downto 0);
		BUS_OUT	: out std_logic_vector(15 downto 0)
		);

end MuxBus;


architecture behav of MuxBus is

signal sig8 : std_logic_vector(7 downto 0);

begin
	
	process(encinst, MEMBUS, PCBUS, DRHBUS, DRLBUS, TRBUS, RBUS, ACBUS)
	begin
	
		BUS_OUT <= (others => '0');
	
		case encinst is
			when "0000" => --MEMBUS			
				BUS_OUT(7 downto 0) <= MEMBUS;
		
			when "0001" => --PCBUS
				BUS_OUT <= PCBUS;
			
			when "0010" => --DRHBUS & TRBUS
				BUS_OUT(15 downto 8) <= DRHBUS;
				BUS_OUT(7 downto 0) <= TRBUS;
			
			when "0011" => --DRLBUS
				BUS_OUT(7 downto 0) <= DRLBUS;
			
			when "0111" => --TRBUS
				BUS_OUT(7 downto 0) <= TRBUS;
			
			when "0110" => --RBUS
				BUS_OUT(7 downto 0) <= RBUS;
			
			when "0100" => --ACBUS
				BUS_OUT(7 downto 0) <= ACBUS;

			when "0101" => --INDBUS
			  BUS_OUT <= INDBUS;
			  
			 when "1101" => --TRINDBUS
			   BUS_OUT <= TRINDBUS;
			   
			when others =>
				BUS_OUT <= (others => '0');
		end case;
		
	end process;

end behav;