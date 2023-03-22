library ieee;
use ieee.std_logic_1164.all;

entity mux_4_12 is 
	port( S : in std_logic_vector (1 downto 0);	
	Input0 : in std_logic_vector (11 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end mux_4_12;	

architecture arch_mux_4 of mux_4_12 is 

begin 	
	process (S, Input0)
	begin
	   case S is
		   when "00" => Output <= Input0;
		   when "01" => Output <= "000000000000";
		   when "10" => Output <= "000100000000";
		   when "11" => Output <= "000000000000"; 
		   when others => Output <= "000000000000";
	   end case;
	   end process;
	
end arch_mux_4;	