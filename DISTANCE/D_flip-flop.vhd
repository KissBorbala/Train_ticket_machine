library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is 
	port( D, CLK, SET : in std_logic;
	Q, Qn : out std_logic); 
end d_flip_flop;	

architecture arch_d_flipflop of d_flip_flop is 

begin 	
	process(CLK)
	begin 
		if CLK'EVENT and CLK='1' then
			Q <= D;
			Qn <= not D;
		end if;	
	end process;
	
	
end arch_d_flipflop;	