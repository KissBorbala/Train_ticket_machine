library ieee;
use ieee.std_logic_1164.all;

entity mux_16_13 is 
	port( S : in std_logic_vector (3 downto 0);
	Output : out std_logic_vector(12 downto 0)); 
end mux_16_13;	

architecture arch_mux_13 of mux_16_13 is 

begin 	
	process (S)
	begin
	   case S is
		   when "0001" => Output <= "1000000010000";
		   when "0010" => Output <= "1000000000001";
		   when "0100" => Output <= "0000000010000";
		   when "1000" => Output <= "0000000000001";
		   when others => Output <= "0000000000000";
	   end case;
	   end process;
	
end arch_mux_13;		