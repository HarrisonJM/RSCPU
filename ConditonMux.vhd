--CondMux
library IEEE;
use IEEE.std_logic_1164.all;

entity CondMux is
port	(
			selector : in std_logic_vector(3 downto 0);
			Z, C, N, O			: in std_logic;
			success_out : out std_logic
		);
end entity;

architecture behav of CondMux is


begin

	process(selector)
	begin
		
		case selector is
			when "0000" => --Unconditional
				success_out <= '1';
				
			when "0001" => -- Jump on Z
				if Z = '1' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
			
			when "0010" => -- Jump on !Z
				if Z = '0' then
					success_out <= '1';
				else
					success_out <= '0';
				end if;
			
			when "0011" => --Jump on Overflow
				if O = '1' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when "0100" => --Jump on Not Overflow
				if O = '0' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when "0101" => --Jump on Carry
				if C = '1' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when "0110" => --Jump on not Carry
				if C = '0' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when "0111" => --Jump on Negative
				if N = '1' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when "1000" => --Jump on Not Negative
				if N = '0' then -- if it passes
					success_out <= '1';
				else
					success_out <= '0';
				end if;
				
			when others =>
				success_out <= '1';
				
		end case;			
		
		
	end process;
	
end behav;