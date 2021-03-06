--MICOPOUT
--This is holds the microoperations to carry out on the CPU
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.microoperations.all;

entity MICOPOUT is
port( 
		addr: in std_logic_vector(5 downto 0);
		OpOut: out std_logic_vector(35 downto 0)
    );
end entity;

architecture struct of MICOPOUT is

	type micMem is array (0 to 62) of std_logic_vector(35 downto 0);
	
	constant nanoCode : micMem := 
	( 
	  0  => (others => '0'), --actually used by a lot
	  1  => ARPC, --Fetch1
	  2  => PCIN or DRM, --2
	  3  => ARPC or IRDR,--3
	  4  => DRM, --ldac4, LDIND2
	  5  => DRAC, --stac4, STIND2, LDINDAC1, LDINDAC3
	  6  => RAC, --mvac
	  7  => ACR, --movr
	  8  => ARIN or DRM, --jmp1
	  9  => DRM or TRDR, --jmp2
	  10 => PCDT, --jmp3
	  11 => ACDR, --ldac5, LDIND3
	  12 => MDR, --stac5, STIND3
	  13 => ZALU or CALU or PLUS,
	  14 => ZALU or OALU or NALU or MINU,
	  15 => ZALU or NALU or CALU or ACIN,
	  16 => ZALU or OALU or NALU or CALU or ACZO,
	  17 => PCIN,
	  18 => ZALU or ANDmic,
	  19 => ZALU or ORmic,
	  20 => ZALU or XORmic,
	  21 => ZALU or NALU or NOTmic,
	  22 => ARIN or PCIN or DRM, --SLSUB0
	  23 => PCIN or DRM or TRDR,
	  24 => ARDT, 
	  25 => INDTR, --MVIT
	  26 => TRIND, --MVTI
	  27 => INDINC, --INDIN
	  28 => INDDEC, --INDD
 	  29 => ZALU or OALU or NALU or CALU or PLUS, -- or CRRYBI, --ADDC 
	  30 => ARIND, --LDIND1, STIND1
	  31 => TRDR or ACR, -- LDINDAC2
	  32 => INDDT, --LDINDAC4
	  others => (others => '0')
	);

begin

	OpOut <= nanoCode(to_integer(unsigned(addr)));


end struct;