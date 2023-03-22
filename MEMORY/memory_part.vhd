library ieee;
use ieee.std_logic_1164.all;

entity memory_part is 
	port(  WE, CLK, pinsert, minsert, pcash, mcash, pchange, mchange, resinsert: in std_logic;
	adress: in std_logic_vector(7 downto 0);
	inserted, change: out std_logic_vector(3 downto 0);
	cash_register: out std_logic_vector(7 downto 0));
end memory_part;	  

architecture arch_memory_part of memory_part is 

component memory_cash is 
	port( adress : in std_logic_vector (7 downto 0);  
	WE, CLK: in std_logic;	 
	Update: in std_logic_vector(15 downto 0);
	Output : out std_logic_vector (15 downto 0) ); 
end component;
component mux_64_16 is 
	port( S : in std_logic_vector(5 downto 0);
	Output : out std_logic_vector(15 downto 0)); 
end component;
component bin_ad_sub is 
	port( A, B: in std_logic_vector (15 downto 0);
	SUB, RESET : in std_logic;
	SUM: out std_logic_vector (15 downto 0));
end component;

signal data, A, B: std_logic_vector(15 downto 0);
signal S: std_logic_vector(5 downto 0);
signal SUB: std_logic;
begin 
	C1: memory_cash port map (adress, WE, CLK, data, A); 
	S <= minsert & pinsert & mchange & mcash & pcash & pchange;
	C2: mux_64_16 port map (S, B);
	SUB <= minsert or mchange or mcash;
	C3: bin_ad_sub port map (A, B, SUB, resinsert, data);
	cash_register <= A(15 downto 8);
	inserted <= A(7 downto 4);
	change <= A(3 downto 0);
end arch_memory_part;	
	

