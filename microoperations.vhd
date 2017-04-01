library IEEE;
use IEEE.std_logic_1164.all;

package microoperations is

	--constant	CLOAD		: std_logic_vector(28 downto 0) := "000000000000000000000000000"; --28 last bit
	--constant	OLOAD		: std_logic_vector(28 downto 0) := "000000000000000000000000000"; --27 last bit
	
	constant	MEMREAD 	: std_logic_vector(26 downto 0) := "100000000000000000000000000"; --26 --read from memory
	constant	MEMWRITE	: std_logic_vector(26 downto 0) := "010000000000000000000000000"; --25
	constant	MEMBUS		: std_logic_vector(26 downto 0) := "001000000000000000000000000"; --24 --memory onto bus
	constant	BUSMEM		: std_logic_vector(26 downto 0) := "000100000000000000000000000";	--23 --bus into memory	                                            
	constant	ARLOAD		: std_logic_vector(26 downto 0) := "000010000000000000000000000"; --22
	constant	ARINC		: std_logic_vector(26 downto 0) := "000001000000000000000000000";	--21	                                            
	constant	PCLOAD		: std_logic_vector(26 downto 0) := "000000100000000000000000000"; --20
	constant	PCINC		: std_logic_vector(26 downto 0) := "000000010000000000000000000"; --19
	constant	PCBUS		: std_logic_vector(26 downto 0) := "000000001000000000000000000";	--18	                                            
	constant	DRLOAD		: std_logic_vector(26 downto 0) := "000000000100000000000000000"; --17
	constant	DRLBUS		: std_logic_vector(26 downto 0) := "000000000010000000000000000"; --16
	constant	DRHBUS		: std_logic_vector(26 downto 0) := "000000000001000000000000000"; --15	                                            
	constant	TRLOAD		: std_logic_vector(26 downto 0) := "000000000000100000000000000"; --14
	constant	TRBUS		: std_logic_vector(26 downto 0) := "000000000000010000000000000"; --13	                                            
	constant	IRLOAD		: std_logic_vector(26 downto 0) := "000000000000001000000000000"; --12	                                            
	constant	RLOAD		: std_logic_vector(26 downto 0) := "000000000000000100000000000"; --11
	constant	RBUS		: std_logic_vector(26 downto 0) := "000000000000000010000000000"; --10	                                            
	constant	ACLOAD		: std_logic_vector(26 downto 0) := "000000000000000001000000000"; --9
	constant	ACBUS		: std_logic_vector(26 downto 0) := "000000000000000000100000000"; --8 19th bit to the 25th bit NOT THE LAST BIT
	                                            
	constant	ALUS1		: std_logic_vector(26 downto 0) := "000000000000000000010000000"; --7 --AC OR 0
	constant	ALUS2		: std_logic_vector(26 downto 0) := "000000000000000000001000000"; --6 --
	constant	ALUS3		: std_logic_vector(26 downto 0) := "000000000000000000000100000"; --5 -- 
	constant	ALUS4		: std_logic_vector(26 downto 0) := "000000000000000000000010000"; --4
	constant	ALUS5		: std_logic_vector(26 downto 0) := "000000000000000000000001000"; --3
	constant	ALUS6		: std_logic_vector(26 downto 0) := "000000000000000000000000100"; --2
	constant	ALUS7		: std_logic_vector(26 downto 0) := "000000000000000000000000010"; --1
	constant	ZLOAD		: std_logic_vector(26 downto 0) := "000000000000000000000000001"; --0 last bit
	
	constant ARPC	: std_logic_vector(26 downto 0) := ARLOAD OR PCBUS; --ar <= PC
	constant ARIN 	: std_logic_vector(26 downto 0) := ARINC; -- increment ac
	constant ARDT 	: std_logic_vector(26 downto 0) := DRHBUS OR TRBUS OR ARLOAD; --ARDT, MOVE DRTR INTO AR
	constant PCIN 	: std_logic_vector(26 downto 0) := PCINC; --PCIN; INCREMENT PC
	constant PCDT 	: std_logic_vector(26 downto 0) := DRHBUS OR TRBUS OR PCLOAD; --PCDT; DRTR INTO PC
	constant DRM 	: std_logic_vector(26 downto 0) := DRLOAD OR MEMBUS OR MEMREAD; --DRM; M INTO DR
	constant DRAC	: std_logic_vector(26 downto 0) := ACBUS  OR DRlOAD; --DRAC; AC INTO DR
	constant IRDR	: std_logic_vector(26 downto 0) := IRLOAD; -- OR DRLBUS; --irdr; dr into ir
	constant RAC	: std_logic_vector(26 downto 0) := ACBUS OR RLOAD; --rac; ac into r
	constant ZALU	: std_logic_vector(26 downto 0) := ZLOAD; --ZALU; LOAD ALU INTO Z
	--constant CALU	: std_logic_vector(26 downto 0) := CLOAD; --ZALU; LOAD ALU INTO Z
	--constant OALU	: std_logic_vector(26 downto 0) := OLOAD; --ZALU; LOAD ALU INTO Z
	constant TRDR	: std_logic_vector(26 downto 0) := TRLOAD; --TRDR; DR INTO TR
	constant ACDR	: std_logic_vector(26 downto 0) := DRLBUS OR ACLOAD OR ALUS3; --ACDR; DR INTO AC
	constant ACR	: std_logic_vector(26 downto 0) := RBUS OR ACLOAD OR ALUS3; --ACR; R INTO AC
	constant PLUS	: std_logic_vector(26 downto 0) := ACLOAD OR RBUS OR ALUS1 OR ALUS3; --PLLUS; AC + R
	constant MINU	: std_logic_vector(26 downto 0) := ACLOAD OR RBUS OR ALUS1 OR ALUS2 OR ALUS4; --MINU; TWO'S COMPLIMENT SUBTTRACTION : AC - R
	constant ACIN	: std_logic_vector(26 downto 0) := ACLOAD OR ALUS1 OR ALUS4; --ACIN; INCREMENT AC
	constant ACZO	: std_logic_vector(26 downto 0) := ACLOAD;  --ACZO; ZERO OUT AC
	constant ANDmic : std_logic_vector(26 downto 0) := ACLOAD OR RBUS OR ALUS5 OR ALUS6 OR ALUS7; --AC AND R
	constant ORmic	: std_logic_vector(26 downto 0) := ACLOAD OR RBUS OR ALUS6 OR ALUS7; --AC OR R
	constant XORmic : std_logic_vector(26 downto 0) := ACLOAD OR RBUS OR ALUS5 OR ALUS7; --AC XOR R
	constant NOTmic : std_logic_vector(26 downto 0) := ACLOAD OR ALUS7; -- NOT AC
	constant MDR 	: std_logic_vector(26 downto 0) := DRLBUS OR BUSMEM OR MEMWRITE; --MDR; DR INTO MEMORY
	
	constant NOP 	: std_logic_vector(7 downto 0) := "00000000"; --0
	constant LDAC	: std_logic_vector(7 downto 0) := "00000001"; --1
	constant STAC	: std_logic_vector(7 downto 0) := "00000010"; --2
	constant MVAC	: std_logic_vector(7 downto 0) := "00000011"; --3
	constant MOV 	: std_logic_vector(7 downto 0) := "00000100"; --4
	constant JUMP	: std_logic_vector(7 downto 0) := "00000101"; --5
	constant JMPZ 	: std_logic_vector(7 downto 0) := "00000110"; --6 --AND Z = 1
	constant JMPNZ	: std_logic_vector(7 downto 0) := "00000111"; --7 --AND Z = 0
	constant ADD 	: std_logic_vector(7 downto 0) := "00001000"; --8
	constant SUBop 	: std_logic_vector(7 downto 0) := "00001001"; --9
	constant INAC	: std_logic_vector(7 downto 0) := "00001010"; --A
	constant CLAC	: std_logic_vector(7 downto 0) := "00001011"; --B
	constant ANDop 	: std_logic_vector(7 downto 0) := "00001100"; --C
	constant ORop  	: std_logic_vector(7 downto 0) := "00001101"; --D
	constant XORop 	: std_logic_vector(7 downto 0) := "00001110"; --E
	constant NOTop 	: std_logic_vector(7 downto 0) := "00001111"; --F
	--add Jumps for overflow and carry?

end package microoperations;

package body microoperations is
--		constant ARPC, ARIN, ARDT, 
--				PCIN, PCDT, DRM, 
--				DRAC, IRDR, RAC, 
--				ZALU, TRDR, ACDR, 
--				ACR, PLUS, MINU, 
--				ACIN, ACZO, ANDOP, 
--				OROP, XOROP, NOTOP, 
--				MDR : std_logic_vector(28 downto 0);
				
--				ARPC := ARLOAD OR PCBUS; --ar <= PC
--				ARINC; -- increment ac
--				DRHBUS OR TRBUS OR ARLOAD; --ARDT, MOVE DRTR INTO AC
--				PCINC; --PCIN; INCREMENT PC
--				DRHBUS OR TRBUS OR PCLOAD; --PCDT; DRTR INTO PC
--				DRLOAD OR MEMBUS OR MEMREAD; --DRM; M INTO DR
--				ACBUS  OR DRlOAD; --DRAC; AC INTO DR
--				IRLOAD OR DRLBUS; --irdr; dr into ir
--				ACBUS OR RLOAD; --rac; ac into r
--				ZLOAD; --ZALU; LOAD ALU INTO Z
--				TRLOAD; --TRDR; DR INTO TR
--				DRLBUS OR ACLOAD OR ALUS2; --ACDR; DR INTO AC
--				RBUS OR ACLOAD OR ALUS3; --ACR; R INTO AC
--				ACLOAD OR RBUS OR ALUS1 OR ALUS3; --PLLUS; AC + R
--				ACLOAD OR RBUS OR ALUS1 OR ALUS2 OR ALUS4; --MINU; TWO'S COMPLIMENT SUBTTRACTION : AC - R
--				ACLOAD OR ALUS1 OR ALUS4; --ACIN; INCREMENT AC
--				ACLOAD;  --ACZO; ZERO OUT AC
--				ACLOAD OR RBUS OR ALUS5 OR ALUS6 OR ALUS7; --AC AND R
--				ACLOAD OR RBUS OR ALUS6 OR ALUS7; --AC OR R
--				ACLOAD OR RBUS OR ALUS5 OR ALUS7; --AC COR R
--				ACLOAD OR ALUS7; -- NOT AC
--				DRLBUS OR BUSMEM OR MEMWRITE --MDR; DR INTO MEMORY
				
	
end package body microoperations;

