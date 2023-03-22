library ieee;
use ieee.std_logic_1164.all;

entity dcd_4 is 
	port( D : in std_logic_vector (3 downto 0);
	Output : out std_logic_vector (0 to 15)    ); 
end dcd_4;	

architecture arch_dcd of dcd_4 is 

begin 	
	process (D)
	begin  
		Output<= "0000000000000000";
	   case D is
		   when "0000" => Output(0) <= '1';
		   when "0001" => Output(1) <= '1'; 
		   when "0010" => Output(2) <= '1'; 
		   when "0011" => Output(3) <= '1'; 
		   when "0100" => Output(4) <= '1'; 
		   when "0101" => Output(5) <= '1'; 
		   when "0110" => Output(6) <= '1'; 
		   when "0111" => Output(7) <= '1'; 
		   when "1000" => Output(8) <= '1'; 
		   when "1001" => Output(9) <= '1'; 
		   when "1010" => Output(10) <= '1'; 
		   when "1011" => Output(11) <= '1'; 
		   when "1100" => Output(12) <= '1'; 
		   when "1101" => Output(13) <= '1'; 
		   when "1110" => Output(14) <= '1'; 
		   when "1111" => Output(15) <= '1'; 
		   when others => Output <= "XXXXXXXXXXXXXXXX";
	   end case;
	end process;

end arch_dcd;		