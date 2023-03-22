library ieee;
use ieee.std_logic_1164.all;

entity memory_5 is 
	port( Q : in std_logic_vector (4 downto 0);  
	B : out std_logic_vector (2 downto 0) ); 
end memory_5;	

architecture arch_memory of memory_5 is 
 begin
	 process  (Q)
	 begin 
		 case Q is
			 when "00111" => B <= "111";
			 when "01111" => B <= "000";
			 when "10111" => B <= "111";
			 when "11111" => B <= "000";
			 when "00000" => B <= "000";
			 when "10000" => B <= "010";
			 when "01000" => B <= "001";
			 when "11000" => B <= "001"; 
			 when "00001" => B <= "000";
			 when "01001" => B <= "000";
			 when "10001" => B <= "000";
			 when "11001" => B <= "000";
			 when "00010" => B <= "010";
			 when "10010" => B <= "100";
			 when "01010" => B <= "011";
			 when "11010" => B <= "011";
			 when "00011" => B <= "011";	
			 when "10011" => B <= "011";
			 when "01011" => B <= "001";
			 when "11011" => B <= "001";
			 when "00100" => B <= "100";
			 when "01100" => B <= "110";
			 when "10100" => B <= "101";
			 when "11100" => B <= "101";
			 when "00101" => B <= "011"; 
			 when "01101" => B <= "011";
			 when "10101" => B <= "011";
			 when "11101" => B <= "011";
			 when "00110" => B <= "110";
			 when "10110" => B <= "110";
			 when "01110" => B <= "001";
			 when "11110" => B <= "001";
			 when others => B <= "111";
		 end case;
      end process; 

end arch_memory;		