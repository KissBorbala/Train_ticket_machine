library ieee;
use ieee.std_logic_1164.all;

entity mux_16 is 
	port( Input : in std_logic_vector (0 to 15);
	S : in std_logic_vector (3 downto 0);
	Output : out std_logic); 
end mux_16;	

architecture arch_mux of mux_16 is 

begin 	
	process (S, Input)
	begin
	   case S is
		   when "0000" => Output <= Input(0); 
		   when "0001" => Output <= Input(1);
		   when "0010" => Output <= Input(2);
		   when "0011" => Output <= Input(3);
		   when "0100" => Output <= Input(4);
		   when "0101" => Output <= Input(5); 
		   when "0110" => Output <= Input(6);
		   when "0111" => Output <= Input(7);
		   when "1000" => Output <= Input(8);
		   when "1001" => Output <= Input(9);
		   when "1010" => Output <= Input(10);
		   when "1011" => Output <= Input(11);
		   when "1100" => Output <= Input(12);
		   when "1101" => Output <= Input(13);
		   when "1110" => Output <= Input(14);
		   when "1111" => Output <= Input(15);
		   when others => Output <= Input(0);
	   end case;
	   end process;
	
end arch_mux;		