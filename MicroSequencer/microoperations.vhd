library IEEE;
use IEEE.std_logic_1164.all;

package microoperations is
  
	constant	TRINDLOAD	: std_logic_vector(35 downto 0) := "100000000000000000000000000000000000"; -- 35
	constant	TRINDBUS	: std_logic_vector(35 downto 0) := "010000000000000000000000000000000000"; -- 34
	constant	NLOAD		: std_logic_vector(35 downto 0) := "001000000000000000000000000000000000"; -- 33
	constant	INDDECRE	: std_logic_vector(35 downto 0) := "000100000000000000000000000000000000"; -- 32
	constant	INDINCR		: std_logic_vector(35 downto 0) := "000010000000000000000000000000000000"; -- 31
	constant	INDBUS		: std_logic_vector(35 downto 0) := "000001000000000000000000000000000000"; -- 30
	constant	INDLOAD		: std_logic_vector(35 downto 0) := "000000100000000000000000000000000000"; -- 29	
	constant	CLOAD		: std_logic_vector(35 downto 0) := "000000010000000000000000000000000000"; -- 28 
	constant	OLOAD		: std_logic_vector(35 downto 0) := "000000001000000000000000000000000000"; -- 27	
	constant	MEMREAD 	: std_logic_vector(35 downto 0) := "000000000100000000000000000000000000"; -- 26 --read from memory
	constant	MEMWRITE	: std_logic_vector(35 downto 0) := "000000000010000000000000000000000000"; -- 25
	constant	MEMBUS		: std_logic_vector(35 downto 0) := "000000000001000000000000000000000000"; -- 24 --memory onto bus
	constant	BUSMEM		: std_logic_vector(35 downto 0) := "000000000000100000000000000000000000"; -- 23 --bus into memory	                                            
	constant	ARLOAD		: std_logic_vector(35 downto 0) := "000000000000010000000000000000000000"; -- 22
	constant	ARINC		: std_logic_vector(35 downto 0) := "000000000000001000000000000000000000"; -- 21	                                            
	constant	PCLOAD		: std_logic_vector(35 downto 0) := "000000000000000100000000000000000000"; -- 20
	constant	PCINC		: std_logic_vector(35 downto 0) := "000000000000000010000000000000000000"; -- 19
	constant	PCBUS		: std_logic_vector(35 downto 0) := "000000000000000001000000000000000000"; -- 18	                                            
	constant	DRLOAD		: std_logic_vector(35 downto 0) := "000000000000000000100000000000000000"; -- 17
	constant	DRLBUS		: std_logic_vector(35 downto 0) := "000000000000000000010000000000000000"; -- 16
	constant	DRHBUS		: std_logic_vector(35 downto 0) := "000000000000000000001000000000000000"; -- 15	                                            
	constant	TRLOAD		: std_logic_vector(35 downto 0) := "000000000000000000000100000000000000"; -- 14
	constant	TRBUS		: std_logic_vector(35 downto 0) := "000000000000000000000010000000000000"; -- 13	                                            
	constant	IRLOAD		: std_logic_vector(35 downto 0) := "000000000000000000000001000000000000"; -- 12	                                            
	constant	RLOAD		: std_logic_vector(35 downto 0) := "000000000000000000000000100000000000"; -- 11
	constant	RBUS		: std_logic_vector(35 downto 0) := "000000000000000000000000010000000000"; -- 10	                                            
	constant	ACLOAD		: std_logic_vector(35 downto 0) := "000000000000000000000000001000000000"; -- 9
	constant	ACBUS		: std_logic_vector(35 downto 0) := "000000000000000000000000000100000000"; -- 8 19th bit to the 25th bit NOT THE LAST BIT	                                            
	constant	ALUS1		: std_logic_vector(35 downto 0) := "000000000000000000000000000010000000"; -- 7 --AC OR 0
	constant	ALUS2		: std_logic_vector(35 downto 0) := "000000000000000000000000000001000000"; -- 6 --
	constant	ALUS3		: std_logic_vector(35 downto 0) := "000000000000000000000000000000100000"; -- 5 -- 
	constant	ALUS4		: std_logic_vector(35 downto 0) := "000000000000000000000000000000010000"; -- 4
	constant	ALUS5		: std_logic_vector(35 downto 0) := "000000000000000000000000000000001000"; -- 3
	constant	ALUS6		: std_logic_vector(35 downto 0) := "000000000000000000000000000000000100"; -- 2
	constant	ALUS7		: std_logic_vector(35 downto 0) := "000000000000000000000000000000000010"; -- 1
	constant	ZLOAD		: std_logic_vector(35 downto 0) := "000000000000000000000000000000000001"; -- 0 last bit
	
	constant ARPC	: std_logic_vector(35 downto 0) := ARLOAD OR PCBUS; --ar <= PC
	constant ARIN 	: std_logic_vector(35 downto 0) := ARINC; -- increment ac
	constant ARDT 	: std_logic_vector(35 downto 0) := DRHBUS OR TRBUS OR ARLOAD; --ARDT, MOVE DRTR INTO AR
	constant PCIN 	: std_logic_vector(35 downto 0) := PCINC; --PCIN; INCREMENT PC
	constant PCDT 	: std_logic_vector(35 downto 0) := DRHBUS OR TRBUS OR PCLOAD; --PCDT; DRTR INTO PC
	constant DRM 	: std_logic_vector(35 downto 0) := DRLOAD OR MEMBUS OR MEMREAD; --DRM; M INTO DR
	constant DRAC	: std_logic_vector(35 downto 0) := ACBUS  OR DRlOAD; --DRAC; AC INTO DR
	constant IRDR	: std_logic_vector(35 downto 0) := IRLOAD; -- OR DRLBUS; --irdr; dr into ir
	constant RAC	: std_logic_vector(35 downto 0) := ACBUS OR RLOAD; --rac; ac into r	  	
	constant ZALU	: std_logic_vector(35 downto 0) := ZLOAD; --ZALU; LOAD ALU INTO Z
	constant CALU	: std_logic_vector(35 downto 0) := CLOAD; --CALU; LOAD ALU INTO Carry
	constant OALU	: std_logic_vector(35 downto 0) := OLOAD; --OALU; LOAD ALU INTO Overflow
	constant NALU	: std_logic_vector(35 downto 0) := OLOAD; --NALU; LOAD ALU INTO NALU	
	constant TRDR	: std_logic_vector(35 downto 0) := TRLOAD; --TRDR; DR INTO TR
	constant ACDR	: std_logic_vector(35 downto 0) := DRLBUS OR ACLOAD OR ALUS3; --ACDR; DR INTO AC
	constant ACR	: std_logic_vector(35 downto 0) := RBUS OR ACLOAD OR ALUS3; --ACR; R INTO AC
	constant PLUS	: std_logic_vector(35 downto 0) := ACLOAD OR RBUS OR ALUS1 OR ALUS3; --PLLUS; AC + R
	constant MINU	: std_logic_vector(35 downto 0) := ACLOAD OR RBUS OR ALUS1 OR ALUS2 OR ALUS4; --MINU; TWO'S COMPLIMENT SUBTTRACTION : AC - R
	constant ACIN	: std_logic_vector(35 downto 0) := ACLOAD OR ALUS1 OR ALUS4; --ACIN; INCREMENT AC
	constant ACZO	: std_logic_vector(35 downto 0) := ACLOAD;  --ACZO; ZERO OUT AC
	constant ANDmic : std_logic_vector(35 downto 0) := ACLOAD OR RBUS OR ALUS5 OR ALUS6 OR ALUS7; --AC AND R
	constant ORmic	: std_logic_vector(35 downto 0) := ACLOAD OR RBUS OR ALUS6 OR ALUS7; --AC OR R
	constant XORmic : std_logic_vector(35 downto 0) := ACLOAD OR RBUS OR ALUS5 OR ALUS7; --AC XOR R
	constant NOTmic : std_logic_vector(35 downto 0) := ACLOAD OR ALUS7; -- NOT AC
	constant CRRYBI : std_logic_vector(35 downto 0) := ALUS4;
	constant MDR 	: std_logic_vector(35 downto 0) := DRLBUS OR BUSMEM OR MEMWRITE; --MDR; DR INTO MEMORY	                                   
	constant ARDRIN	: std_logic_vector(35 downto 0) := ARLOAD or DRHBUS or INDBUS;
	
	constant INDAC 	: std_logic_vector(35 downto 0) := ACBUS or INDLOAD; --IDRAC
	constant INDR 	: std_logic_vector(35 downto 0) := RBUS or INDLOAD; --IDACR
	constant INDINC : std_logic_vector(35 downto 0) := INDINCR; --increment IND
	constant INDDEC	: std_logic_vector(35 downto 0) := INDDECRE; --decrement IND
	
	constant INDDT  : std_logic_vector(35 downto 0) := DRHBUS or TRBUS or INDLOAD; --Move DRTR into IND
	constant ARIND	: std_logic_vector(35 downto 0) := ARLOAD or INDBUS; --ARDIR	
	constant INDTR	: std_logic_vector(35 downto 0) := INDLOAD or TRINDBUS; -- move temp ind to ind
	constant TRIND	: std_logic_vector(35 downto 0) := TRINDLOAD or INDBUS; -- ind to temp ind
	constant ARTRIN : std_logic_vector(35 downto 0) := TRINDLOAD or TRINDBUS; -- TempInd to AR
	
	constant NOP 	: std_logic_vector(7 downto 0) := "00000000"; --0
	constant LDAC	: std_logic_vector(7 downto 0) := "00000001"; --1
	constant STAC	: std_logic_vector(7 downto 0) := "00000010"; --2
	constant MVAC	: std_logic_vector(7 downto 0) := "00000011"; --3
	constant MOV 	: std_logic_vector(7 downto 0) := "00000100"; --4
	constant JUMP	: std_logic_vector(7 downto 0) := "00000101"; --5
	constant JMPZ 	: std_logic_vector(7 downto 0) := "00000110"; --6 -- AND Z = 1
	constant JPNZ	: std_logic_vector(7 downto 0) := "00000111"; --7 -- AND Z = 0
	constant ADD 	: std_logic_vector(7 downto 0) := "00001000"; --8
	constant SUBop 	: std_logic_vector(7 downto 0) := "00001001"; --9
	constant INAC	: std_logic_vector(7 downto 0) := "00001010"; --A
	constant CLAC	: std_logic_vector(7 downto 0) := "00001011"; --B
	constant ANDop 	: std_logic_vector(7 downto 0) := "00001100"; --C
	constant ORop  	: std_logic_vector(7 downto 0) := "00001101"; --D
	constant XORop 	: std_logic_vector(7 downto 0) := "00001110"; --E
	constant NOTop 	: std_logic_vector(7 downto 0) := "00001111"; --F	
	
	constant LDIND	: std_logic_vector(7 downto 0) := "00010000"; --10 -- Load [ind] into AC
	constant STIND	: std_logic_vector(7 downto 0) := "00010001"; --11 -- Store AC into [ind]
	constant LDINDAC: std_logic_vector(7 downto 0) := "00010010"; --12 -- 
	constant INDD	: std_logic_vector(7 downto 0) := "00010011"; --13 -- increment INDEX
	constant INDIN	: std_logic_vector(7 downto 0) := "00010100"; --14 -- decrement INDEX	
	constant JMPC 	: std_logic_vector(7 downto 0) := "00010101"; --15 -- Jump on Carry
	constant JPNC	: std_logic_vector(7 downto 0) := "00010110"; --16 -- Jump on no carry
	constant JMPO	: std_logic_vector(7 downto 0) := "00010111"; --17 -- Jump on Overflow
	constant JPNO	: std_logic_vector(7 downto 0) := "00011000"; --18 -- Jump on no Overflow
	constant JMPN	: std_logic_vector(7 downto 0) := "00011001"; --19 -- Jump on negative
	constant JPNN	: std_logic_vector(7 downto 0) := "00011010"; --1A -- Jump on no negative 	
	constant ADDC	: std_logic_vector(7 downto 0) := "00011011"; --1B -- Add with Carry	
	constant MVTI	: std_logic_vector(7 downto 0) := "00011100"; --1C -- Move Ind into T
	constant MVIT	: std_logic_vector(7 downto 0) := "00011101"; --1D -- Move T into Ind
	
	constant LITERALLYNTOHING	: std_logic_vector(7 downto 0) := "00011110"; --1E -- EMPTY OP CODE SPACE
	constant LITERALLYNTOHING2	: std_logic_vector(7 downto 0) := "00011111"; --1E -- EMPTY OP CODE SPACE
	
	
	

end package microoperations;

package body microoperations is

--I guess nothing
	
end package body microoperations;

