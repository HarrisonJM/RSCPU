--CondMux
library IEEE;
use IEEE.std_logic_1164.all;

entity CondMux is
port	(
			selector : in std_logic_vector(1 downto 0);
			Z			: in std_logic;
			success_out : out std_logic
		);
end entity;

architecture behav of CondMux is


begin

	process(selector)
	begin
		
		case selector is
			when "00" =>
				success_out <= '1';
				
			when "01" =>
				if Z = '1' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
			
			when "10" =>
				if Z = '0' then
					success_out <= '1';
				else
					success_out <= '0';
				end if;
			
			when "11" => --shouldn't ever be here
				success_out <= '1';
				
			when others =>
				success_out <= '1';
				
		end case;			
		
		
	end process;
	
end behav;