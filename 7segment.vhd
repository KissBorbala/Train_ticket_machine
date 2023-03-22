library ieee;
use ieee.std_logic_1164.all;

entity sevensegment is 
	port( Input : in std_logic_vector (3 downto 0);
	a, b, c, d, e, f, g : out std_logic    ); 
end sevensegment;	 

architecture arch_7s of sevensegment is 

begin 	
	process (Input)	
	
	begin  	   
		  a <= '0'; b <= '0'; c <= '0';
			d <= '0'; e <= '0'; f <= '0';
			g <= '0'; 
		case Input is
			when "0000" =>
			a <= '1'; b <= '1'; c <= '1';
			d <= '1'; e <= '1'; f <= '1'; 
			when "0001" => 
			b <= '1'; c <= '1';
			when "0010" =>  
			a <= '1'; b <= '1'; g <= '1';
			e <= '1'; d <= '1';	 
			when "0011" =>
			a <= '1'; b <= '1'; c <= '1';
			d <= '1'; g <= '1';
			when "0100" =>
			b <= '1'; c <= '1'; f <= '1';
			g <= '1';
			when "0101" =>
			a <= '1'; c <= '1'; d <= '1';
			f <= '1'; g <= '1';
			when "0110" =>
			a <= '1'; c <= '1'; d <= '1';
			e <= '1'; f <= '1'; g <= '1';
			when "0111" =>
			a <= '1'; b <= '1'; c <= '1'; 
			when "1000" =>
			a <= '1'; b <= '1'; c <= '1';
			d <= '1'; e <= '1'; f <= '1';
			g <= '1'; 
			when "1001" => 
			a <= '1'; b <= '1'; c <= '1';
			d <= '1'; f <= '1'; g <= '1'; 
			when "1100" =>
			a <= '1'; d <= '1'; e <= '1';
			f <= '1'; g <= '1'; 
			when others => 
			   g <= '1';   
		end case;
		end process;
			
			
end arch_7s;