--subroureg
library IEEE;
use IEEE.std_logic_1164.all;

entity subroureg is
port	(
			load, reset	: in std_logic;
			input : in std_logic_vector(6 downto 0);
			output : out std_logic_vector(6 downto 0)
		);
end entity;


architecture behav of subroureg is

begin

	process(reset, load)
	begin

		if reset = '0' then
		
			output <= (others => '0');

		elsif load = '1' then

			output <= input;

		end if;

	end process;

end behav;