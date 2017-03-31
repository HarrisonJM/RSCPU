--BTLOGICSWITCHER
library IEEE;
use IEEE.std_logic_1164.all;

entity BTLOGIC is
port(
		Cond	 		: in std_logic;
		BT				: in std_logic_vector(1 downto 0);
		MuxOut		: out std_logic_vector(1 downto 0);
		LDMSUB		: out std_logic
	 );
end entity;

architecture behavioural of BTLOGIC is

begin
	process(BT, Cond)
	begin
	
		case (BT) is
			when "00" =>
				if cond = '0' then
					MuxOut <= "00";
					LDMSUB <= '0';
					
				elsif cond = '1' then
					MuxOut <= "01";
					LDMSUB <= '0';
					
				end if;
				
			when "01" =>
				MuxOut <= "10";
				LDMSUB <= '0';
				
			when "10" =>
				MuxOut <= "01";
				LDMSUB <= '1';
				
			when "11" =>
				MuxOut <= "11";
				LDMSUB <= '0';
		end case;
		
	end process;	

end behavioural;