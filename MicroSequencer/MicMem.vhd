--MicMem, fetches microcode from a lookup table
library IEEE;
use IEEE.std_logic_1164.all;

entity MicMem is
port	(
			clk					: in std_logic;
			opcode_in			: in std_logic_vector(6 downto 0);
			NanoAddr				: out std_logic_vector(5 downto 0);
			BT						: out std_logic_vector(1 downto 0);
			Cond					: out std_logic_vector(3 downto 0);
			next_address		: out std_logic_vector(6 downto 0)
		);
end entity;

architecture behav of MicMem is

	component OPLUT is --Look up table for opcodes
	port( 
			addr: in std_logic_vector(6 downto 0);
			micCode_out: out std_logic_vector(18 downto 0)
		 );
	end component;

--	signal OPtoAddrSig : std_logic_vector(5 downto 0);
	signal micCodeSig : std_logic_vector(18 downto 0);

begin

	--OPtoAddrSig <= opcode_in & "00";
	
	micCode : OPLUT port map (opcode_in, micCodeSig);
	
	Cond			<= micCodeSig(18 downto 15);
	BT 				<= micCodeSig(14 downto 13);
	NanoAddr		<= micCodeSig(12 downto 7);
	next_address 	<= micCodeSig(6 downto 0);
	

end behav;