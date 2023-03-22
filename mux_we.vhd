library ieee;
use ieee.std_logic_1164.all;

entity mux_we is 
	port( S : in std_logic_vector(2 downto 0);
	I0, I1, I2: in std_logic;
	Output : out std_logic); 
end mux_we;	

architecture arch_mux_we of mux_we is 
begin 	
	process (S, I0, I1, I2)
	begin
	   case S is
		   when "001" => Output <= I0;
		   when "010" => Output <= I1; 
		   when "100" => Output <= I2; 
		   
		   when others   => Output <= '0';
	   end case;
	   end process;
	
end arch_mux_we;	