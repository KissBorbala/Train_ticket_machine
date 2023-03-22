library ieee;
use ieee.std_logic_1164.all;

entity memory_cash is 
	port( adress : in std_logic_vector (7 downto 0);  
	WE, CLK: in std_logic;	 
	Update: in std_logic_vector(15 downto 0);
	Output : out std_logic_vector (15 downto 0) ); 
end memory_cash;	

architecture arch_memory_cash of memory_cash is 
  type mem is array (0 to 6) of std_logic_vector (15 downto 0);
 begin
	 process  (adress, CLK)	  
	 variable m: mem := ("0000000000000000", "0000000000000000", "0000000000000000", "0000000000000000",
	 "0000000000000000", "0000000000000000", "0000000000000000");
	 begin 
		 if(WE = '1' and CLK = '1' and CLK'EVENT) then
			 case (adress) is
				 when "00000000" => m(0) := Update; 
				 when "01010000" => m(1) := Update;	
				 when "00100000" => m(2) := Update;
				 when "00010000" => m(3) := Update;
				 when "00000101" => m(4) := Update;
				 when "00000010" => m(5) := Update;
				 when "00000001" => m(6) := Update;
				 when others =>  
			 end case;	
		 end if;
			  case (adress) is
				 when "00000000" => Output <= m(0); 
				 when "01010000" => Output <= m(1); 	
				 when "00100000" => Output <= m(2); 
				 when "00010000" => Output <= m(3); 
				 when "00000101" => Output <= m(4); 
				 when "00000010" => Output <= m(5); 
				 when "00000001" => Output <= m(6); 
				 when others =>  Output <= "0000000000000000";
			 end case; 
      end process;
end arch_memory_cash;	