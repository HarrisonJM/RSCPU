--TOP
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TB is
port (
			clk, reset : in std_logic;
			read_data : out std_logic_vector(7 downto 0); --CPU TO MEMORY
			read_data2 : out std_logic_vector(7 downto 0); --MEMORY TO CPU
			read_address : out std_logic_vector(15 downto 0);
      AC_CONTENTS : out std_logic_vector(7 downto 0);
      R_CONTENTS : out std_logic_vector(7 downto 0);
      PC_CONTENTS : out std_logic_vector(15 downto 0)
		);
end TB;


architecture struct of TB is

	component sync_ram is
	  port (
		 clock   : in  std_logic;
		 writed  : in  std_logic; --write datain
		 readd	: in std_logic; --read data from, useless. Can't girute out how to use
		 address : in  std_logic_vector;
		 datain  : in  std_logic_vector;
		 dataout : out std_logic_vector
	  );
	end component;

	component RSCPU is
		port (	
		 clk, reset : in std_logic;
		 MEMIN 		: in std_logic_vector(7 downto 0);		 
		 ADDROUT		: out std_logic_vector(15 downto 0);
		 memwrite 	: out std_logic;
 		 memread: out std_logic;
		 MEMOUT		: out std_logic_vector(7 downto 0);
     AC_CONTENTS : out std_logic_vector(7 downto 0);
     R_CONTENTS : out std_logic_vector(7 downto 0);
     PC_CONTENTS : out std_logic_vector(15 downto 0)
	  );
	end component;
	
	signal memCPU : std_logic_vector(7 downto 0); --mem <= CPU
	signal CPUMEM : std_logic_vector(7 downto 0);
	signal ADDRMEM : std_logic_vector(15 downto 0);
	
	signal ACCON : std_logic_vector(7 downto 0);
	signal RCON : std_logic_vector(7 downto 0);
	signal PCCON : std_logic_vector(15 downto 0);
	
	signal writebit : std_logic;
	signal readbit : std_logic;


begin

	MEMORY 	: sync_ram port map(clk, writebit, readbit, ADDRMEM, memCPU, CPUMEM);
	  
	CPU 		: RSCPU port map (clk, reset, CPUMEM, ADDRMEM, writebit, readbit, memCPU, ACCON, RCON, PCCON);
	
	read_data <= memCPU;
	read_address <= ADDRMEM;
	read_data2 <= CPUMEM;
	
  AC_CONTENTS <= ACCON;
  R_CONTENTS  <= RCON;
  PC_CONTENTS  <= PCCON;
	
	

end struct;
