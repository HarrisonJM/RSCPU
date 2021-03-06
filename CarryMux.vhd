--CarryMultiplexer
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carryMux is
 port(
    A, B, C, D: in std_logic;
    SEL : in std_logic;
    Z : out std_logic
  );
end carryMux;

architecture behav of carryMux is
  
  signal mathType : std_logic_vector(1 downto 0);
  
begin
  
  mathType <= D & C;
  
  process(SEL, A, B, C, D)
    begin
		
		if SEL = '1' then -- If Carry bit requirment from CU
			
			if mathType = "10" then --neg bus, subtraction, we need a 1
				Z <= B;
				
			elsif mathType =  "01" then -- We're adding with carry
				Z <= A;
				
			end if;
			
		else
		
			z <= '0';
			
		end if;
      
    end process;

end behav;


