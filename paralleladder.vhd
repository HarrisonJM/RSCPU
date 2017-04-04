library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity parelleladder is

generic (n: integer := 7);

port( A : in STD_LOGIC_VECTOR (n downto 0);
	  B : in STD_LOGIC_VECTOR (n downto 0);
	  CarryIn : in STD_LOGIC;
	  S : out STD_LOGIC_VECTOR (n downto 0);
	  CarryOut : out STD_LOGIC;
	  OVout : out STD_LOGIC
	);
end parelleladder; 	  

ARCHITECTURE BEHAVIOUR of parelleladder is

component FullAdder is
port(A, B, CarryIn : in std_logic;
		CarryOut: out std_logic;
		S:	out std_logic);
end component;

signal Carrys: std_logic_vector(n downto 0);
signal V1, V2: std_logic;

begin

--FA1: FullAdder port map (A(0), B(0), Cin, S(0), C1);
--FA2: FullAdder port map (A(1), B(1), C1, S(1), C2);
--FA3: FullAdder port map (A(2), B(2), C2, S(2), C3);
--FA4: FullAdder port map (A(3), B(3), C3, S(3), C4);
--FA5: FullAdder port map (A(4), B(4), C4, S(4), C5);
--FA6: FullAdder port map (A(5), B(5), C5, S(5), C6);
--FA7: FullAdder port map (A(6), B(6), C6, S(6), C7);
--FA8: FullAdder port map (A(7), B(7), C7, S(7), cout);

Blocks: for I in 0 to n generate
	firstBlock: if I = 0 generate
		inst1: FullAdder port map(	A(I), 
											B(I), 
											CarryIn, 
											Carrys(I),
											S(I)
											);
	end generate firstBlock;
	
	otherBlocks: if I > 0 generate	
		inst2: FullAdder port map(	A(I), 
											B(I), 
											Carrys(I-1),
											Carrys(I),
											S(I)
											);
	end generate otherBlocks;
end generate Blocks;

V1 <= Carrys(n-1); --overflow part
V2 <= Carrys(n);
OVOUT <= V1 XOR V2;


CarryOut <= Carrys(n); --carry bit

end;