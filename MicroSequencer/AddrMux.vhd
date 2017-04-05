--ADDRMUX
library IEEE;
use IEEE.std_logic_1164.all;

entity AddrMux is
port	(
			SubReg : in std_logic_vector(6 downto 0); -- sub routine register
			OPCODE : in std_logic_vector(6 downto 0); -- opcode address
			MMAddr : in std_logic_vector(6 downto 0); -- Address from Microcode memory
			Addrpo : in std_logic_vector(6 downto 0); -- address plus one
			SEL	 : in std_logic_vector(1 downto 0);
			AddrOut: out std_logic_vector(6 downto 0)
		);
end entity;


architecture behav of AddrMux is

begin

	process(SEL, SubReg, MMAddr, Addrpo, OPCODE)
	begin
	
		case(SEL) is
			when "00" =>
				AddrOut <= Addrpo;
				
			when "01" =>
				AddrOut <= MMAddr;
				
			when "10" => 
				AddrOut <= OPCODE;
				
			when "11" =>
				AddrOut <= SubReg;
			when others =>
			  AddrOut <= OPCODE;
		
		end case;
	end process;

end behav;