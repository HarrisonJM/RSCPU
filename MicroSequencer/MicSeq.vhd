--Top-Level, MicSeq, microsequencer
library IEEE;
use IEEE.std_logic_1164.all;

entity micSeq is
port(
		clk, reset, z, c, n, o 	: in std_logic;
		opcode_in		: in std_logic_vector(4 downto 0); --needs front padding with 0's
		MicOps_out		: out std_logic_vector(35 downto 0)
	 );
end entity;

architecture struct of micSeq is

	component MicMem is
	port	(
				clk					: in std_logic;
				opcode_in			: in std_logic_vector(6 downto 0);
				NanoAddr				: out std_logic_vector(5 downto 0);
				BT						: out std_logic_vector(1 downto 0);
				Cond					: out std_logic_vector(3 downto 0);
				next_address		: out std_logic_vector(6 downto 0)
			);
	end component;

	component BTLOGIC is
	port(
			Cond	 		: in std_logic;
			BT				: in std_logic_vector(1 downto 0); --needs front padding with 0's
			MuxOut		: out std_logic_vector(1 downto 0);
			LDMSUB		: out std_logic
		 );
	end component;

	component CondMux is
	port	(
				selector : in std_logic_vector(3 downto 0);
				Z, C, N, O			: in std_logic;
				success_out : out std_logic
			);
	end component;

	component OPLUT is
	port( 
			addr: in std_logic_vector(6 downto 0);
			micCode_out: out std_logic_vector(20 downto 0)
		 );
	end component;

	component MICOPOUT is
	port( 
			addr: in std_logic_vector(5 downto 0);
			OpOut: out std_logic_vector(35 downto 0)
		 );
	end component;

	component AddrMux is
	port	(
				SubReg : in std_logic_vector(6 downto 0); -- sub routine register
				OPCODE : in std_logic_vector(6 downto 0); -- opcode address
				MMAddr : in std_logic_vector(6 downto 0); -- Address from Microcode memory
				Addrpo : in std_logic_vector(6 downto 0); -- address plus one
				SEL	 : in std_logic_vector(1 downto 0);
				AddrOut: out std_logic_vector(6 downto 0)
			);
	end component;

	component AddrReg is
	port	(
				clk, reset	: in std_logic;
				input : in std_logic_vector(6 downto 0);
				output : out std_logic_vector(6 downto 0);
				outputpo : out std_logic_vector (6 downto 0) --output + 1
			);
	end component;

	component subroureg is
	port	(
				load, reset	: in std_logic;
				input : in std_logic_vector(6 downto 0);
				output : out std_logic_vector(6 downto 0)
			);
	end component;

	signal subreg 	: std_logic_vector(6 downto 0); --subroutine register to mux
	signal OPCODEsig : std_logic_vector(6 downto 0);

	signal LD		: std_logic; --load flag for subroutine register

	signal MuxToReg 	: std_logic_vector(6 downto 0);
	signal MuxSelector	: std_logic_vector(1 downto 0);

	signal Regout		: std_logic_vector(6 downto 0);
	signal RegPOout		: std_logic_vector(6 downto 0);

	signal Condsig	: std_logic_vector(3 downto 0);
	signal BTsig	: std_logic_vector(1 downto 0);
	signal CondMuxSig : std_logic;

	signal nanomem	: std_logic_vector(5 downto 0);
	signal MMtoMux	: std_logic_vector(6 downto 0);

begin
	
	OPCODEsig <= opcode_in & "0" & "0";
	
	AM1 : AddrMux port map (subreg, OPCODEsig, MMtoMux, RegPOout, MuxSelector, MuxToReg);
	
	Reg1: AddrReg port map (clk, reset, MuxToReg, Regout, RegPOout);	
	SRR2: subroureg port map (LD, reset, RegPOout, subreg);

	BTL1: BTLOGIC port map (CondMuxSig, BTsig, MuxSelector, LD);
	
	CNM1: CondMux	port map (Condsig, Z, C, N, O, CondMuxSig);

	MM1 : MicMem port map (clk, Regout, nanomem, BTsig, Condsig, MMtoMux);
	
	NaM1: MICOPOUT port map (nanomem, MicOps_out);
	
	

end struct;