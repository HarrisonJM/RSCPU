--AdderGroup

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity AdderGroup is
port	(	
			O_IN : in std_logic_vector(7 downto 0);
			AC_IN : in std_logic_vector(7 downto 0);
			BUS_IN : in std_logic_vector(7 downto 0);
			ALUS1 : in std_logic;
			ALUS23 : in std_logic_vector(1 downto 0);
			ALUS4 : in std_logic; --Carry in
			OUT8	: out std_logic_vector (7 downto 0);
			Cout	: out std_logic;
			OVOUT	: out std_logic
		);
end entity;


architecture struct of AdderGroup is

	component mux1 is
	 port(A, B : in std_logic_vector(7 downto 0);
			SEL	: in std_logic;
		Z : out std_logic_vector(7 downto 0));
	end component;

	component mux2 is --NBUS
	 port(A, B : in std_logic_vector(7 downto 0); --C IS NBUS
		SEL : in std_logic_vector (1 downto 0);
		Z : out std_logic_vector(7 downto 0));
	end component;

	component parelleladder is
	port(A : in std_logic_vector (7 downto 0);
		  B : in std_logic_vector (7 downto 0);
		  CarryIn : in std_logic;
		  S : out std_logic_vector (7 downto 0);
		  Carryout : out std_logic;
		  OVout : out STD_LOGIC
		);
	end component;

	signal MUX1OUT : std_logic_vector (7 downto 0);
	signal MUX2OUT : std_logic_vector (7 downto 0);

begin

	mx1: mux1  				port map(O_IN, AC_IN, ALUS1, MUX1OUT);
	mx2: mux2 				 port map(O_IN, BUS_IN, ALUS23, MUX2OUT);

	FA	 :	parelleladder	port map(MUX1OUT, MUX2OUT, ALUS4, OUT8, Cout, OVOUT);

end struct;


