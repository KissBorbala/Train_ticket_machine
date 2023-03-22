library ieee;
use ieee.std_logic_1164.all;

entity button is 
	port( D, CLK : in std_logic;
	Output : out std_logic); 
end button;	

architecture arch_butt of button is  

component d_flip_flop is 
	port( D, CLK, SET : in std_logic;
	Q, Qn : out std_logic); 
end component;
signal I, O: std_logic;
begin
	C: d_flip_flop port map (D, CLK, '0', open, O);
	I <= D;
	Output <= I and O;
end arch_butt;