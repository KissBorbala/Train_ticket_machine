library ieee;
use ieee.std_logic_1164.all;

entity CIF_part is 
	port(  EN, CLK, cash : in std_logic;
	SUM: in std_logic_vector(11 downto 0);
	pos1, pos0, WE: out std_logic;
	adress: out std_logic_vector (7 downto 0));
end CIF_part;	   

architecture arch_cif of CIF_part is 

component substracter is 
	port( A2, A1, A0, B1, B0 : in std_logic_vector (3 downto 0);
	EN : in std_logic;
	SUM2, SUM1, SUM0 : out std_logic_vector (3 downto 0);
	SIGN : inout std_logic); 
end component; 
component register_set is 
	port( CLK, SET : in std_logic; 
	Input, Data : in std_logic_vector (12 downto 0);
	Output : out std_logic_vector (12 downto 0));
end component;
component counter_50_0 is 
	port( COUNT, EN, RESET: in std_logic;
	NUM : inout std_logic_vector(7 downto 0);
	CARRY : out std_logic); 
end component;
component comparator_sign is 
	port( A, B : in std_logic_vector (12 downto 0);
	AGB, AEB, ALB : out std_logic); 
end component;
component button is 
	port( D, CLK : in std_logic;
	Output : out std_logic); 
end component;	 

signal sg, sett, C, agb, alb, aeb, enable, up, rs, ncash, count, clkreg, n, nclk, poss1, posss1, carry, nsig, notn: std_logic;
signal res: std_logic_vector(11 downto 0);
signal numb: std_logic_vector(7 downto 0);
signal res2, res1, res0: std_logic_vector(3 downto 0); 
signal registerin, registerdt, A, compb, X: std_logic_vector(12 downto 0);
begin 
	
	registerdt <= '0' & SUM;
	C1: button port map (EN, CLK, sett);
	C2: substracter port map (X(11 downto 8), X(7 downto 4), X(3 downto 0), numb(7 downto 4), numb(3 downto 0), enable, res2, res1, res0, sg);
	res <= res2 & res1 & res0;	
	registerin <= sg & res;
	C3: comparator_sign port map (X, compb, agb, aeb, alb);
	compb <= "00000" & numb;
	up <= (not cash) or alb;
	count <= (up and not CLK) or (n and CLK);	  
	rs <= not EN;
	C4: counter_50_0 port map (count, EN, rs, numb, carry);
	pos0 <= carry or (n and not cash);
	enable <= EN and (agb or aeb) and cash;
	WE <= enable;
	pos1 <= cash and aeb; 
	adress <= numb;
	n <= not (numb(0) or numb(1) or numb(2) or numb(3) or numb(4) or numb(5) or numb(6) or numb(7));
	clkreg <= not sg and CLK;
	C5: register_set port map (clkreg, sett, registerin, registerdt, X);
end arch_cif;

	