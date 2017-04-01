--BufferPlexer
library IEEE;
use IEEE.std_logic_1164.all;

entity BufferPlexer is
port(	enables 	: in std_logic_vector(6 downto 0);

		MEMBUS 	: in std_logic_vector(7 downto 0);
		PCBUS 	: in std_logic_vector(15 downto 0);
		DRHBUS	: in std_logic_vector(7 downto 0);
		DRLBUS 	: in std_logic_vector(7 downto 0);
		TRBUS 	: in std_logic_vector(7 downto 0);
		RBUS 		: in std_logic_vector(7 downto 0);
		ACBUS 	: in std_logic_vector(7 downto 0);
		
		BUS_OUT		: out std_logic_vector(15 downto 0)
	 );

end bufferplexer;


architecture struct of BufferPlexer is

	component encoder is

	port(	enables 	: in std_logic_vector(6 downto 0);
			encinst	: out std_logic_vector(3 downto 0)
		  );
		  
	end component;

	component MuxBus is
	port( encinst 	: in std_logic_vector(3 downto 0);
			MEMBUS 	: in std_logic_vector(7 downto 0);
			PCBUS 	: in std_logic_vector(15 downto 0);
			DRHBUS	: in std_logic_vector(7 downto 0);
			DRLBUS 	: in std_logic_vector(7 downto 0);
			TRBUS 	: in std_logic_vector(7 downto 0);
			RBUS 		: in std_logic_vector(7 downto 0);
			ACBUS 	: in std_logic_vector(7 downto 0);
			
			BUS_OUT	: out std_logic_vector(15 downto 0)
			);

	end component;

	signal encs : std_logic_vector(3 downto 0);

begin

	inst1	: encoder 	port map(enables, encs);
	inst2	: MuxBus		port map(encs, MEMBUS, PCBUS, DRHBUS, DRLBUS, TRBUS, RBUS, ACBUS, BUS_OUT);


end struct;