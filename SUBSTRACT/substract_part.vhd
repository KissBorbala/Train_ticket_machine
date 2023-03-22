library ieee;
use ieee.std_logic_1164.all;

entity substract_part is 
	port(  sub, CLK, e1, e2, e5, e10, e20, e50 : in std_logic;
	SUMIN : in std_logic_vector(11 downto 0);
	WE : out std_logic;	 
	remain : out std_logic;
	SUM: out std_logic_vector(11 downto 0);
	adress: out std_logic_vector(7 downto 0));
end substract_part;

architecture arch_sub of substract_part is

component register_12 is 
	port( CLK, RESET, SET : in std_logic; 
	Input, Data : in std_logic_vector (11 downto 0);
	Output : out std_logic_vector (11 downto 0));
end component;
component BCD_ad_sub_12 is 
	port( A2, A1, A0, B2, B1, B0 : in std_logic_vector (3 downto 0);
	SUB, EN, RESET : in std_logic;
	SUM2, SUM1, SUM0 : out std_logic_vector (3 downto 0);
	SIGN : inout std_logic); 
end component;
component mux_64_12 is 
	port( S : in std_logic_vector(5 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end component;
component mux_2_12 is 
	port( S : in std_logic;
	Input0, Input1: in std_logic_vector(11 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end component;
component button is 
	port( D, CLK : in std_logic;
	Output : out std_logic); 
end component; 
component d_flip_flop_res is 
	port( D, CLK, RESET : in std_logic;
	Q, Qn : out std_logic); 
end component;
signal sel, B0, B1, B2, B3, B4, B5, C, X, Y, sg, set: std_logic; 
signal reg, A, B, res, num_we: std_logic_vector(11 downto 0);
signal res2, res1, res0: std_logic_vector(3 downto 0);
begin 
	C1:  button port map (sub, CLK, set);
	D1:  button	port map (e1, CLK, B0);
	D2:  button	port map (e2, CLK, B1);
	D3:  button	port map (e5, CLK, B2);
	D4:  button	port map (e10, CLK, B3);
	D5:  button	port map (e20, CLK, B4);
	D6:  button	port map (e50, CLK, B5);	
	C2:  mux_64_12 port map (S(0) => e1, S(1) => e2, S(2) => e5, S(3) => e10, S(4) => e20, S(5) => e50, Output => num_we);
	C3:  mux_64_12 port map (S(0) => B0, S(1) => B1, S(2) => B2, S(3) => B3, S(4) => B4, S(5) => B5, Output => B);
	C4:  BCD_ad_sub_12 port map (reg(11 downto 8), reg(7 downto 4), reg(3 downto 0), B(11 downto 8), B(7 downto 4), B(3 downto 0),
	'1', sub, '0', res2, res1, res0, sg);
	res <= res2 & res1 & res0;	 
	SUM <= reg;
	C <= not(B0 or B1 or B2 or B3 or B4 or B5); 
	C5: register_12 port map (C, '0', set, res, SUMIN, reg);
	adress <=num_we(7 downto 0);
	X <= B(7) or B(6) or B(5) or B(4) or B(3) or B(2) or B(1) or B(0);
	WE <= X and sub; 
	C7: d_flip_flop_res port map (sg, C, set, remain, open);
end arch_sub;	