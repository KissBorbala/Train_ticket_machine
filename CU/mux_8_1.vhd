library ieee;
use ieee.std_logic_1164.all;

entity mux_8_1 is 
	port( S : in std_logic_vector(2 downto 0);
	I0, I1, I2, I3, I4, I5, I6, I7: in std_logic;
	Output : out std_logic); 
end mux_8_1;	

architecture arch_mux_8_1 of mux_8_1 is 
begin 	
	process (S, I0, I1, I2, I3, I4, I5, I6, I7)
	begin
	   case S is
		   when "000" => Output <= I0;
		   when "001" => Output <= I1; 
		   when "010" => Output <= I2; 
		   when "011" => Output <= I3;
		   when "100" => Output <= I4;
		   when "101" => Output <= I5;
		   when "110" => Output <= I6;
		   when "111" => Output <= I7;
		   when others   => Output <= '0';
	   end case;
	   end process;
	
end arch_mux_8_1;	