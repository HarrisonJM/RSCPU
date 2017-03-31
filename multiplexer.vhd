--TOP LEFT AND TO AC MUX
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--can be used as a component twice

entity mux1 is
 port(A, B : in std_logic_vector(7 downto 0);
		SEL	: in std_logic; -- ac or 0
    Z : out std_logic_vector(7 downto 0));
end mux1;


architecture behavioral of mux1 is

begin

Z <= A when (SEL = '0') else B;

end behavioral;