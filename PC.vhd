--REG16, 16-bit register
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity REG16 is
	port (clk, load, reset, inc : in std_logic;
			D : in std_logic_vector(15 downto 0);
			Q : out std_logic_vector(15 downto 0)
			);
end REG16;

Architecture theonethatsamixture of REG16 is

  type ram_type is array (0 to 0) of std_logic_vector(D'range);
  signal reg : ram_type := (others=> "0000000000000000" );
  signal z : std_logic_vector(0 to 0);
  signal moveout : std_logic_vector(15 downto 0);
	
	
begin

  z <= "0";
  
	process(clk, load, inc, reset, D, reg)
	begin
	
		if reset = '0' then
			moveout <= (others => '0');
			
		elsif falling_edge(clk) then
			
			if load = '1' then
			  
				reg(to_integer(unsigned(z))) <= D;

			elsif inc = '1' then
				
				reg(to_integer(unsigned(z))) <= std_logic_vector( unsigned((reg(to_integer(unsigned(z))))) + 1);
				
			end if;
				
		end if;
		
		moveout <= reg(to_integer(unsigned(z)));
		
	end process;
	
Q <= moveout;
	

end theonethatsamixture;