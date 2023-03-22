library ieee;
use ieee.std_logic_1164.all;

entity mux_upload is 
	port( S : in std_logic_vector(6 downto 0);
	Output : out std_logic_vector(7 downto 0)); 
end mux_upload;	

architecture arch_mux_upload of mux_upload is 
begin 	
	process (S)
	begin
	   case S is
		   when "1000000" => Output <= "00000001";
		   when "0100000" => Output <= "00000010"; 
		   when "0010000" => Output <= "00000101"; 
		   when "0001000" => Output <= "00010000";
		   when "0000100" => Output <= "00100000";
		   when "0000010" => Output <= "01010000";
		   when "0000001" => Output <= "00000000";
		   when others   => Output <= "00000011";
	   end case;
	   end process;
	
end arch_mux_upload;	