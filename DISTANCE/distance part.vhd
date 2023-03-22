library ieee;
use ieee.std_logic_1164.all;

entity distance_part is 
	port(  plus10, plus100, minus10, minus100, CLK, distance: in std_logic;
	SUM : out std_logic_vector(11 downto 0));
end distance_part;	  

architecture arch_distance of distance_part is 

	component BCD_ad_sub_12 is 
	port( A2, A1, A0, B2, B1, B0 : in std_logic_vector (3 downto 0);
	SUB, EN, RESET : in std_logic;
	SUM2, SUM1, SUM0 : out std_logic_vector (3 downto 0);
	SIGN : inout std_logic); 
end component;
component comparator_sign is 
	port( A, B : in std_logic_vector (12 downto 0);
	AGB, AEB, ALB : out std_logic); 
end component;	
	component comparator_12 is 
	port( A, B : in std_logic_vector (11 downto 0);
	AGB, AEB, ALB : out std_logic); 
end component;
	component mux_16_13 is 
	port( S : in std_logic_vector (3 downto 0);
	Output : out std_logic_vector(12 downto 0)); 
end component;
	component button is 
	port( D, CLK : in std_logic;
	Output : out std_logic); 
end component;	
	component mux_4_12 is 
	port( S : in std_logic_vector (1 downto 0);	
	Input0 : in std_logic_vector (11 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end component;
	component register_13 is 
	port( CLK, RESET : in std_logic; 
	Input : in std_logic_vector (12 downto 0);
	Output : out std_logic_vector (12 downto 0));
end component;	 
signal B3, B2, B1, B0, C, S1, S0, sg, D: std_logic;
signal num, res, A: std_logic_vector(12 downto 0);
signal mux: std_logic_vector(11 downto 0); 
signal res2, res1, res0: std_logic_vector(3 downto 0);
begin 
	C1: button port map (plus10, CLK, B3);
	C2: button port map (plus100, CLK, B2);
	C3: button port map (minus10, CLK, B1);
	C4: button port map (minus100, CLK, B0);
	B: button port map (distance, CLK, D); 
	C5: mux_16_13 port map (S(0) => B0, S(1) => B1, S(2) => B2, S(3) => B3, Output => num);
	C <= not (B3 or B2 or B1 or B0);
	C6: register_13 port map (C, D, res, A); 
	C7: comparator_12 port map (A(11 downto 0), "000100000000", S1, open, open);
	B7: comparator_sign port map (A, "0000000000000", open, open, S0);	  
	C8: BCD_ad_sub_12 port map (mux(11 downto 8), mux(7 downto 4), mux(3 downto 0), num(11 downto 8), num(7 downto 4), num(3 downto 0),
	num(12), distance, '0', res2, res1, res0, sg);	
	C9: mux_4_12 port map (S(1) => S1, S(0) => S0, Input0 => A(11 downto 0), Output => mux);	
	SUM <= mux; 
	res <= sg & res2 & res1 & res0; 
end arch_distance;	