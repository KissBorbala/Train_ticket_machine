library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop_res is 
	port( D, CLK, RESET : in std_logic;
	Q, Qn : out std_logic); 
end d_flip_flop_res;	

architecture arch_d_flipflop_res of d_flip_flop_res is 

begin 	
	process(CLK, RESET)
	begin 	
		if(RESET = '1') then Q <= '0';
		elsif CLK'EVENT and CLK='1' then
			Q <= D;
			Qn <= not D;
		end if;	
	end process;
	
	
end arch_d_flipflop_res;	