--MICOPOUT
-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.microoperations.all;

entity MICOPOUT is
port( 
		addr: in std_logic_vector(4 downto 0);
		OpOut: out std_logic_vector(28 downto 0)
    );
end entity;

architecture struct of MICOPOUT is

	type micMem is array (0 to 31) of std_logic_vector(28 downto 0);
	
	constant nanoCode : micMem := 
	( 
			--Cond	BT 	 MicopAddr		ALUS		NextAddress
	  0  => (others => '0'),
	  1  => ARPC, --Fetch1
	  2  => PCIN or DRM, --2
	  3  => ARPC or IRDR,--3
	  4  => DRM, --ldac4
	  5  => DRAC, --stac4
	  6  => RAC, --mvac
	  7  => ACR, --movr
	  8  => ARIN or DRM, --jmp1
	  9  => DRM or TRDR, --jmp2
	  10 => PCDT, --jmp3
	  11 => ACDR, --ldac5
	  12 => MDR, --stac5
	  13 => ZALU or PLUS,
	  14 => ZALU or MINU,
	  15 => ZALU or INAC,
	  16 => ZALU or ACZO,
	  17 => PCIN,
	  18 => ZALU or ANDmic,
	  19 => ZALU or ORmic,
	  20 => ZALU or XORmic,
	  21 => ZALU or NOTmic,
	  22 => ARIN or PCIN or DRM, --SLLSUB0
	  23 => PCIN or DRM or TRDR,
	  24 => ARDT,
	  
	  others => (others => '0')
	);

begin

	OpOut <= nanoCode(to_integer(unsigned(addr)));


end struct;