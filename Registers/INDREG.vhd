--8-bit IndexRegister with increment and decrement
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity INDREG16 is
	port (clk, load, reset, inc, dec : in std_logic;
			D : in std_logic_vector(15 downto 0);
			Q : out std_logic_vector(15 downto 0)
			);
end INDREG16;

Architecture rtl of INDREG16 is

  type ram_type is array (0 to 0) of std_logic_vector(D'range);
  signal reg : ram_type := (others=> "0000000000000000" );
  signal z : std_logic_vector(0 to 0);
  signal moveout : std_logic_vector(15 downto 0);
	
	
begin

  z <= "0";
  
	process(clk, load, inc, dec, reset, D, reg)
	begin
	
RST:		if reset = '0' then
			
					reg(to_integer(unsigned(z))) <= (others => '0');
					moveout <= (others => '0');
			
			elsif falling_edge(clk) then
			
ACTION:			if load = '1' then
			  
					reg(to_integer(unsigned(z))) <= D;

				elsif inc = '1' then
				
CARRY:		  		if std_logic_vector( unsigned((reg(to_integer(unsigned(z)))))) = "0000000000000000" then
				
						reg(to_integer(unsigned(z))) <= "1111111111111111";
        
					else
        
						reg(to_integer(unsigned(z))) <= std_logic_vector( unsigned((reg(to_integer(unsigned(z))))) + 1);
      
					end if CARRY;

				elsif dec = '1' then
			  
OVFL:	    		if std_logic_vector( unsigned((reg(to_integer(unsigned(z))))) - 1) = "1111111111111111" then
			     
						reg(to_integer(unsigned(z))) <= "0000000000000000";
			   
					else
			    
						reg(to_integer(unsigned(z))) <= std_logic_vector( unsigned((reg(to_integer(unsigned(z))))) - 1);
      			  
					end if OVFL;
				
			end if ACTION;
				
		end if RST;
		
		moveout <= reg(to_integer(unsigned(z)));
		
	end process;
	
Q <= moveout;
	

end rtl;