library ieee;
use ieee.std_logic_1164.all;

entity mux_2_12 is 
	port( S : in std_logic;
	Input0, Input1: in std_logic_vector(11 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end mux_2_12;	

architecture arch_mux_2 of mux_2_12 is 

begin 	
	process (S, Input0, Input1)
	begin
	   case S is
		   when '0' => Output <= Input0;
		   when '1' => Output <= Input1;
		   when others => Output <= Input0;
	   end case;
	   end process;
	
end arch_mux_2;	