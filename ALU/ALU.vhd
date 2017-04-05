--TOP
--ALUS(0) = ALUS1

--Alus(3) = ALUS4 (Carry)

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU is 
port  (	O_IN 		: in std_logic_vector(7 downto 0);
			AC_IN 	: in std_logic_vector(7 downto 0);
			BUS_IN 	: in std_logic_vector(7 downto 0);
			ALUS 	: in std_logic_vector(6 downto 0); -- Selectors, swap 2 and 3, 5 and 6
			ACOUT 	: out std_logic_vector (7 downto 0);
			Cout	: out std_logic;
			OVout	: out std_logic;
			NegOut	: out std_logic
		);
end ALU;

architecture struct of ALU is

	component AdderGroup is
	port	(	O_IN 	: in std_logic_vector(7 downto 0);
				AC_IN 	: in std_logic_vector(7 downto 0);
				BUS_IN 	: in std_logic_vector(7 downto 0);
				ALUS1 	: in std_logic; 
				ALUS23 	: in std_logic_vector(1 downto 0);
				ALUS4 	: in std_logic; --Carry in
				OUT8	: out std_logic_vector (7 downto 0);
				Cout	: out std_logic;
				OVOUT	: out std_logic
			);
	end component;

	component mux1 is --Last multiplexer
	 port(A, B : in std_logic_vector(7 downto 0);
			SEL	: in std_logic; --ALUS7
		Z : out std_logic_vector(7 downto 0));
	end component;

	component mux3 is --Big multiplexer
		port(A, B : in std_logic_vector(7 downto 0);
			  SEL : in std_logic_vector (1 downto 0); --ALUS 5, ALUS 6
			  Z : out std_logic_vector(7 downto 0));
	end component;

	signal ADDEROUT : std_logic_vector(7 downto 0);
	signal BITWISEOUT : std_logic_vector(7 downto 0);
	signal ALUS23, ALUS56 :std_logic_vector(1 downto 0);

	signal Coutsig, OVOUTSIG : std_logic;

begin

	ALUS56 <= ALUS(5) & ALUS(4); --This is for bitwise
	ALUS23 <= ALUS(1) & ALUS(2); --o, bus or NBUS

	AG: AdderGroup port map(O_IN, AC_IN, BUS_IN, ALUS(0), ALUS23, ALUS(3), ADDEROUT, Coutsig, OVOUTSIG);
	MM: mux3			port map(AC_IN, BUS_IN, ALUS56, BITWISEOUT); --bitwise
	LM: mux1			port map(ADDEROUT, BITWISEOUT, ALUS(6), ACOUT); --bitwise OR addition

	cout <= Coutsig;
	OVout <= OVOUTSIG;
	
	process(ADDEROUT)
	begin
		if (ALUS23 = "10") then -- subtraction is/was active, the number is signed
	
			Negout <= ADDEROUT(7);
		
		else
	
			Negout <= '0';
		
		end if;
	end process;

end struct;