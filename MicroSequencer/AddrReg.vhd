--AddressRegisters
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity AddrReg is
port	(
			clk, reset	: in std_logic;
			input : in std_logic_vector(6 downto 0);
			output : out std_logic_vector(6 downto 0);
			outputpo : out std_logic_vector (6 downto 0) -- output + 1
		);
end entity;


architecture behav of AddrReg is

begin

	process(clk, reset)
	begin

		if reset = '0' then
		
			output <= (others => '0');

		elsif rising_edge(clk) then

			output <= input;
			outputpo <= std_logic_vector(unsigned(input) + 1);

		end if;

	end process;

end behav;