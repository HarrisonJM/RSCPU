library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
port(A, B, CarryIn : in std_logic;
		CarryOut: out std_logic;
		S:	out std_logic);
end entity;

architecture structural of FullAdder is
--declartive part of the architecture
--component declaration

--Component in NbitsAdder
component HalfAdder
port(a,b: in std_logic;
c, s: out std_logic);
end component;

--orgate
component TwoOr
port(a,b: in std_logic;
c : out std_logic);
end component;

--Signals, "internal wires"
signal Carry : std_logic_vector (1 downto 0);
signal Sum	 : std_logic;

begin
--components instantiation
--three instances are required here
inst1: HalfAdder port map(A, B, Carry(0), Sum); --First half adder
inst2: HalfAdder port map(Sum, CarryIn, Carry(1), S); --Second half adder
inst3: TwoOr	  port map(Carry(0), Carry(1), CarryOut); --Final OR gate

end structural;