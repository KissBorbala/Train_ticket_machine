library ieee;
use ieee.std_logic_1164.all;

entity mux_16_16 is 
	port( S : in std_logic_vector (3 downto 0);
	I0, I1: in std_logic_vector(11 downto 0);
	I2: in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(15 downto 0)); 
end mux_16_16;	

architecture arch_mux_16_16 of mux_16_16 is 

begin 	
	process (S, I0, I1, I2)
	begin
	   case S is
		   when "0001" => Output <= I0 & "0000";
		   when "0010" => Output <= I1 & "1100";
		   when "0100" => Output <= "1101" & I2 & "1100";
		   when "1000" => Output <= "1101110111011101";
		   when others => Output <= "0000000000000000";
	   end case;
	   end process;
	
end arch_mux_16_16;		