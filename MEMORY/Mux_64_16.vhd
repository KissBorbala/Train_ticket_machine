library ieee;
use ieee.std_logic_1164.all;

entity mux_64_16 is 
	port( S : in std_logic_vector(5 downto 0);
	Output : out std_logic_vector(15 downto 0)); 
end mux_64_16;	

architecture arch_mux_64_16 of mux_64_16 is 
begin 	
	process (S)
	begin
	   case S is
		   when "000001" => Output <= "0000000000000001";
		   when "000010" => Output <= "0000000100000000"; 
		   when "000100" => Output <= "0000000100000000"; 
		   when "001000" => Output <= "0000000000000001";
		   when "010000" => Output <= "0000000000010000";
		   when "100000" => Output <= "0000000000010000";
		   when "100100" => Output <= "0000000100010000";
		   when "001100" => Output <= "0000000100000001";
		   when "010010" => Output <= "0000000100010000";
		   when others   => Output <= "0000000000000000";
	   end case;
	   end process;
	
end arch_mux_64_16;	