--MIDDLE MUX
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
 port(A, B: in std_logic_vector(7 downto 0);
    SEL : in std_logic_vector (1 downto 0); -- 32
    Z : out std_logic_vector(7 downto 0));
end mux2;

Architecture behavioral of mux2 is

signal C : std_logic_vector(7 downto 0); --NBUS

begin
  
  C <= NOT B;
  
	Process (A, B, C, SEL) begin
		case SEL is
		when "00" =>  -- 3 = 0, 2 = 0
			Z <= A; --O input  
		when "01" => -- 3 = 0, 2 = 1
			Z <= B; -- Bus
		when "10" => 
			Z <= C; -- Negative Bus
		when Others => Z <="00000000";
		end case;
	end Process;
end behavioral;