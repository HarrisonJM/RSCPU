library IEEE;
use IEEE.std_logic_1164.all;

entity myreg is
	port (clk, load, reset : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
			);
end myreg;

architecture regbehav of myreg is
begin

	process (clk, reset, D)
	begin
	
		if reset = '0' then
			Q <= (others => '0');
		elsif falling_edge(clk) and load = '1' then
			Q <= D;
		end if;

	end process;

end;
