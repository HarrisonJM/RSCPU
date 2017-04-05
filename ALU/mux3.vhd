--MEATY MUX, used for bitwise
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3 is
	port(A, B : in std_logic_vector(7 downto 0);
		  SEL : in std_logic_vector (1 downto 0); --(65)
		  Z : out std_logic_vector(7 downto 0));
end mux3;

Architecture behavioral of mux3 is

begin

Process (A, B, SEL)

begin 

case SEL is

when "11" => Z <= NOT A; 
when "01" => Z <=A XOR B; 
when "10" => Z <=A OR B; 
When "00" => Z <=A AND B; 

when Others => Z <="00000000";

end case;

end Process;

end behavioral;