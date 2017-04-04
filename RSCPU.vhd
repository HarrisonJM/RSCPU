--RSCPU
--http://stackoverflow.com/questions/9645728/vhdl-setting-constant-data-in-ram
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.all;

entity RSCPU is
port	(clk, reset : in std_logic;
		 MEMIN 		: in std_logic_vector(7 downto 0);		 
		 ADDROUT	: out std_logic_vector(15 downto 0);
		 memwrite: out std_logic;
		 memread: out std_logic;
		 MEMOUT	: out std_logic_vector(7 downto 0)
		);
end RSCPU;


architecture Idontknow of RSCPU is

--components
	-- component CU2 is
	-- port(	clk, reset, zflag	: in std_logic;
			-- opcode 	: in std_logic_vector(7 downto 0);
			-- micops	: out std_logic_vector(28 downto 0)
			-- );
	-- end component;
	
	component micSeq is
	port(
		clk, reset, z, c, n, o 	: in std_logic;
		opcode_in		: in std_logic_vector(4 downto 0); --needs front padding with 0's
		MicOps_out		: out std_logic_vector(35 downto 0)
		);
	end component;

	component ALU is
	port  (	O_IN : in std_logic_vector(7 downto 0);
				AC_IN : in std_logic_vector(7 downto 0);
				BUS_IN : in std_logic_vector(7 downto 0);
				ALUS : in std_logic_vector(6 downto 0); -- Selectors, swap 2 and 3, 5 and 6
				ACOUT : out std_logic_vector (7 downto 0);
				Cout	: out std_logic;
				OVout	: out std_logic;
				NegOut	: out std_logic
			);
	end component;

	component Z is
		port (D, clk, load, reset : in std_logic;
				Q : out std_logic
				);
	end component;

	component REG8 is --Generic register we can re-use
		port (clk, load, reset : in std_logic;
				D : in std_logic_vector(7 downto 0);
				Q : out std_logic_vector(7 downto 0)
				);
	end component;

	component REG16 is
		port (clk, load, reset, inc : in std_logic;
				D : in std_logic_vector(15 downto 0);
				Q : out std_logic_vector(15 downto 0)
				);
	end component;
	
	component INDREG16 is
	port (clk, load, reset, inc, dec : in std_logic;
			D : in std_logic_vector(15 downto 0);
			Q : out std_logic_vector(15 downto 0)
			);
	end component;
	
	component TR16 is
	port (clk, load, reset: in std_logic;
			D : in std_logic_vector(15 downto 0);
			Q : out std_logic_vector(15 downto 0)
			);
  end component;
	
	component BufferPlexer is
	port(	
		enables 	: in std_logic_vector(8 downto 0);
		MEMBUS 	: in std_logic_vector(7 downto 0);
		PCBUS 	: in std_logic_vector(15 downto 0);
		DRHBUS	: in std_logic_vector(7 downto 0);
		DRLBUS 	: in std_logic_vector(7 downto 0);
		TRBUS 	: in std_logic_vector(7 downto 0);
		RBUS 		: in std_logic_vector(7 downto 0);
		ACBUS 	: in std_logic_vector(7 downto 0);
		INDBUS 	: in std_logic_vector(15 downto 0);
		TRINDBUS 	: in std_logic_vector(15 downto 0);
		BUS_OUT		: out std_logic_vector(15 downto 0)
	 );
	end component;
	
	component carryMux is
	port(
		A, B, C, D: in std_logic;
		SEL : in std_logic;
		Z : out std_logic
		);
	end component;

	signal ACALU 	: std_logic_vector(7 downto 0); -- ALU INTO AC
	signal ALUAC	: std_logic_vector(7 downto 0); -- AC TO ALLU
	signal AluSelectorBits : std_logic_vector(6 downto 0); -- The ALU selector bits

	signal ZBIT, OAC, CAC, NAC, CUO, CUC, CUN, carrybit : std_logic;

	signal MAINBUS : std_logic_vector(15 downto 0); --The Bus

	signal OPCODESIG : std_logic_vector(7 downto 0); --INTO CU
	signal MICROPERATIONS : std_logic_vector(35 downto 0); --OUT FROM CU
	
	signal OE : std_logic_vector(8 downto 0);
	signal PCBUF, INDBUS, TRINDBUS : std_logic_vector(15 downto 0);
	signal DRSIG, BUFTR, BUFR, ACBUS : std_logic_vector(7 downto 0);

begin

--AluSelectorBits <= MICROPERATIONS(7) & MICROPERATIONS(6) & MICROPERATIONS(5) & MICROPERATIONS(4) & MICROPERATIONS(3) & MICROPERATIONS(2) & MICROPERATIONS(1);
	AluSelectorBits <= MICROPERATIONS(1) & MICROPERATIONS(2) & MICROPERATIONS(3) & carryBit & MICROPERATIONS(5) & MICROPERATIONS(6) & MICROPERATIONS(7);

--thinking bits
	ControlUnit 	: micSeq port map(clk, reset, ZBIT, CUC, CUN, CUO, OPCODESIG(4 downto 0), MICROPERATIONS);
	ALU1			: ALU port map("00000000", ALUAC, MAINBUS(7 downto 0), AluSelectorBits, ACALU, CAC, OAC, NAC); --ACALU ALSO GOES TO Z

--registers
	--16-bit
	AR1 			: REG16			port map(clk, MICROPERATIONS(22), reset, MICROPERATIONS(21), MAINBUS, ADDROUT);
	PC1 			: REG16			port map(clk, MICROPERATIONS(20), reset, MICROPERATIONS(19), MAINBUS, PCBUF);
	
	IND1			: INDREG16		port map(clk, MICROPERATIONS(29), reset, MICROPERATIONS(31), MICROPERATIONS(32), MAINBUS, INDBUS);
	TR2    			: TR16			port map(clk, MICROPERATIONS(35), reset, MAINBUS, TRINDBUS);
	
	--8-bit
	DR1 			: REG8			port map(clk, MICROPERATIONS(17),  reset, MAINBUS(7 downto 0), DRSIG);
	TR1 			: REG8			port map(clk, MICROPERATIONS(14), reset, DRSIG, BUFTR);
	IR1 			: REG8			port map(clk, MICROPERATIONS(12), reset, DRSIG, OPCODESIG);
	R1  			: REG8			port map(clk, MICROPERATIONS(11), reset, MAINBUS(7 downto 0), BUFR);	
	AC1 			: REG8			port map(clk, MICROPERATIONS(9), reset, ACALU, ALUAC); --in, out	
	ACBUS <= ALUAC;
	
	--FLAGS
	Z1 : Z  port map(or_reduce(ACALU), clk, MICROPERATIONS(0), reset, ZBIT); --zero
	C1 : Z  port map(CAC, clk, MICROPERATIONS(28), reset, CUC); --Carry
	N1 : Z  port map(NAC, clk, MICROPERATIONS(33), reset, CUN); -- Negative
	O1 : Z  port map(OAC, clk, MICROPERATIONS(27), reset, CUO); -- Overflow
	

--Buffers

	OE <= 	MICROPERATIONS(34) & MICROPERATIONS(30) & MICROPERATIONS(26) & MICROPERATIONS(18) & MICROPERATIONS(15) & 
			MICROPERATIONS(16) & MICROPERATIONS(13) & MICROPERATIONS(10) & 
			MICROPERATIONS(8);	

	BP1 : BufferPlexer port map(OE, MEMIN, PCBUF, DRSIG, DRSIG, BUFTR, BUFR, ACBUS, INDBUS, TRINDBUS, MAINBUS);
	
	memread <= MICROPERATIONS(26);
	memwrite <= MICROPERATIONS(25);
	
	MEMOUT <= MAINBUS(7 downto 0);
	
	CrM1 : carryMux port map (CUC, '1', MICROPERATIONS(4), MICROPERATIONS(5), MICROPERATIONS(6), carryBit);

end Idontknow;
































