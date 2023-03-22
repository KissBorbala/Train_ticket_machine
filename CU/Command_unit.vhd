library ieee;
use ieee.std_logic_1164.all;

entity command_unit is 
	port(  finish, cancel, rem_sum, pos0, pos1, done, CLK: in std_logic;
	distance, sub_money, calc_if_possible,
	error, restart, ret_inserted, ret_change, upload: out std_logic);
end command_unit;	

architecture arch_cu of command_unit is 

component memory_5 
	port( Q : in std_logic_vector (4 downto 0);  
	B : out std_logic_vector (2 downto 0) ); 
end component;
component mux_8_1 is 
	port( S : in std_logic_vector(2 downto 0);
	I0, I1, I2, I3, I4, I5, I6, I7: in std_logic;
	Output : out std_logic); 
end component;	 
component d_flip_flop
	port( D, CLK, SET : in std_logic;
	Q, Qn : out std_logic); 
end component; 
component dcd_4 is 
	port( D : in std_logic_vector (3 downto 0);
	Output : out std_logic_vector (0 to 15)); 
end component; 	 
signal I0, I1, D2, D1, D0, Q2, Q1, Q0: std_logic;
signal B, S: std_logic_vector(2 downto 0);
signal Q: std_logic_vector(4 downto 0);	
signal Outputv: std_logic_vector(0 to 15);
begin 
	S <= Q2 & Q1 & Q0;
	A1: mux_8_1 port map (S, finish, '0', rem_sum, '0', pos0, '0', '0', '0', I1);
	A2: mux_8_1 port map (S, cancel, '0', cancel, done, pos1, '0', done,  finish, I0);
	Q <= I1 & I0 & Q2 & Q1 & Q0;
	A3: memory_5  port map (Q, B);
	A4: d_flip_flop port map (B(2), CLK, '0', Q2, open); 
	A5: d_flip_flop port map (B(1), CLK, '0', Q1, open);
	A6: d_flip_flop port map (B(0), CLK, '0', Q0, open);	
	A7: dcd_4 port map (D(3) => '0',D(2) => Q2,D(1) => Q1,D(0) => Q0, Output => Outputv);
	distance <= Outputv(0);
	restart <= Outputv(1);
	sub_money <= Outputv(2);
	ret_inserted <= Outputv(3);
	calc_if_possible <= Outputv(4);
	error <= Outputv(5);
	ret_change <= Outputv(6);
	upload <= Outputv(7);

end arch_cu;		