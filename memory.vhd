-- Simple generic RAM Model
--
-- +-----------------------------+
-- |    Copyright 2008 DOULOS    |
-- |   designer :  JK            |
-- +-----------------------------+

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity sync_ram is
  port (
    clock   : in  std_logic;
    writed  : in  std_logic; --write datain
  	 readd	: in std_logic; --read data from, useless. Can't girute out how to use
    address : in  std_logic_vector;
    datain  : in  std_logic_vector;
    dataout : out std_logic_vector
  );
end entity sync_ram;

architecture RTL of sync_ram is

   type ram_type is array (0 to (2**address'length)-32256) of std_logic_vector(datain'range);
   signal ram : ram_type :=
	(
	 0 => x"05", --JUMP to 0x0c
	 1 => x"0C", 
	 2 => x"00",
	 
	 12 => x"01", --LDAC
	 13 => x"2F",
	 14 => x"00",
	 
	 16 => x"03", --MVAC
	 
	 17 => x"01", --LDAC
	 18 => x"14",
	 19 => x"00",
	 20 => x"B0",
	 
	 21 => x"08", --Add
	 
	 22 => x"02", --STAC
	 23 => x"30",
	 24 => x"00",
	 
	 25 => x"0C", --AND
	 26 => x"0D", --OR
	 27 => x"0E", --XOR
	 28 => x"0F", --NOT
	 
	 29 => x"09", --SUB
	 30 => x"0A", --INAC
 	 31 => x"0B", --CLAC
 	 
   32 => x"07", -- JPNZ
   33 => x"00", -- JPNZ
   34 => x"00", -- JPNZ
   
   35 => x"00", --NOP
   
   36 => x"04", --MOVR
   
   37 => x"06", -- JMPZ
   38 => x"00", -- JPNZ
   39 => x"00", -- JPNZ
	 
	 
	 47 => x"0A", --data for LDAC
	 
	 others => "00000000"
	);

   signal read_address : std_logic_vector(address'range);

begin

RamProc: process(clock, address) is

			begin
			  
ifclk: if rising_edge(clock) then
				   
					if writed = '1' then --write bit
					  
					  ram(to_integer(unsigned(address))) <= datain;
					  
					else-- readd = '1' then
					  
			  			dataout <= ram(to_integer(unsigned(address)));
			  			
					end if; --apparently we made yours more robust than mine :)
					
				 end if ifclk;
				 
			end process RamProc;

end architecture RTL;