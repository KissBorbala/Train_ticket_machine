library ieee;
use ieee.std_logic_1164.all;

entity mux_64_12 is 
	port( S : in std_logic_vector(5 downto 0);
	Output : out std_logic_vector(11 downto 0)); 
end mux_64_12;	

architecture arch_mux_64 of mux_64_12 is 

begin 	
	process (S)
	begin
	   case S is
		   when "000001" => Output <= "000000000001";
		   when "000010" => Output <= "000000000010"; 
		   when "000100" => Output <= "000000000101"; 
		   when "001000" => Output <= "000000010000";
		   when "010000" => Output <= "000000100000";
		   when "100000" => Output <= "000001010000";
		   when others   => Output <= "000000000000";
	   end case;
	   end process;
	
end arch_mux_64;	