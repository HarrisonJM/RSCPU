--R8, 8 bit register
library IEEE;
use IEEE.std_logic_1164.all;

entity REG8 is
	port (clk, load, reset : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
			);
end REG8;

Architecture struct of REG8 is

	component myreg is
	port (clk, load, reset : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0)
			);
	end component;
	
begin

	R1 :	myreg port map(clk, load, reset, D(7 downto 0), Q(7 downto 0));

end struct;