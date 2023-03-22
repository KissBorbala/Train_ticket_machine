library ieee;
use ieee.std_logic_1164.all;

entity return_part is 
	port(  ret_change, ret_insert, CLK: in std_logic;
	inserted, change: in std_logic_vector(3 downto 0);
	WE, ret, done: out std_logic;  
	number: out std_logic_vector(7 downto 0));
end return_part;	  

architecture arch_return of return_part is 

component counter_ret is 
	port( COUNT, EN, RESET: in std_logic;
	NUM : inout std_logic_vector(7 downto 0);
	CARRY : out std_logic); 
end component;	
component mux_2_4 is 
	port( Input0, Input1 : in std_logic_vector (3 downto 0);
	S : in std_logic;
	Output : out std_logic_vector(3 downto 0)); 
end component;
component comp_4 is 
	port( A, B : in std_logic_vector (3 downto 0);
	AGB, AEB, ALB : out std_logic); 
end component;
component button is 
	port( D, CLK : in std_logic;
	Output : out std_logic); 
end component;
signal muxA: std_logic_vector(3 downto 0);
signal G, E, L, EN, up, res: std_logic;	
signal num: std_logic_vector(7 downto 0);
begin 
	C1:  mux_2_4 port map (inserted, change, ret_change, muxA);
	C2:  comp_4 port map (muxA, "0000", G, E, L);
	WE <= G;  
	EN <= ret_insert or ret_change;
	up <= CLK and E;
	res <= not EN;
	C3: counter_ret port map (up, EN, res, num, done);
	number <= num; 
	ret <= (not CLK) and EN and G;
end arch_return;	
	

