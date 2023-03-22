library ieee;
use ieee.std_logic_1164.all;

entity mux_8_8 is 
	port( S : in std_logic_vector(3 downto 0);
	I0, I1, I2, I3: in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(7 downto 0)); 
end mux_8_8;	

architecture arch_mux_8_8 of mux_8_8 is 
begin 	
	process (S, I0, I1, I2, I3)
	begin
	   case S is
		   when "0001" => Output <= I0;
		   when "0010" => Output <= I1; 
		   when "0100" => Output <= I2;
		   when "1000" => Output <= I3;
		   when others   => Output <= "00000000";
	   end case;
	   end process;
	
end arch_mux_8_8;	