 library ieee;
use ieee.std_logic_1164.all;

entity counter_ret is 
	port( COUNT, EN, RESET: in std_logic;
	NUM : inout std_logic_vector(7 downto 0);
	CARRY : out std_logic); 
end counter_ret;	

architecture arch_count_ret of counter_ret is 	
begin
	process (COUNT, RESET)
	variable number: std_logic_vector(7 downto 0);
	begin
		if(RESET = '1') then
	        NUM <= "01010000";
			CARRY <= '0';
		elsif(EN = '1' and COUNT = '1' and COUNT'EVENT) then 
			
			case (NUM) is
				when "01010000"	=> number := "00100000";  CARRY <= '0'; 
				when "00100000"	=> number := "00010000";
				when "00010000"	=> number := "00000101";
				when "00000101"	=> number := "00000010";
				when "00000010"	=> number := "00000001";
				when "00000001"	=> number := "00000000";
				when "00000000"	=> number := "01010000";  CARRY <= '1';
				when others => number := "00000000";
			end case;
		NUM <= number;	
		end if;			
	end process;	
end arch_count_ret;
