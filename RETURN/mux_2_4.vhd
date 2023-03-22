library ieee;
use ieee.std_logic_1164.all;

entity mux_2_4 is 
	port( Input0, Input1 : in std_logic_vector (3 downto 0);
	S : in std_logic;
	Output : out std_logic_vector(3 downto 0)); 
end mux_2_4;	

architecture arch_mux_2_4 of mux_2_4 is 

begin 	
	process (S, Input0, Input1)
	begin
	   case S is
		   when '0' => Output <= Input0; 
		   when '1' => Output <= Input1;
		   when others => Output <= Input0;
	   end case;
	   end process;
	
end arch_mux_2_4;	