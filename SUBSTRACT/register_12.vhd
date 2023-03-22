library ieee;
use ieee.std_logic_1164.all;

entity register_12 is 
	port( CLK, RESET, SET : in std_logic; 
	Input, Data : in std_logic_vector (11 downto 0);
	Output : out std_logic_vector (11 downto 0));
end register_12;

architecture arch_registe of register_12 is 

begin  
	process(CLK, RESET, SET)
	begin 
		if(RESET = '1') then Output <= "000000000000";
		elsif(SET = '1') then Output <= Data;
		elsif CLK = '1' and CLK'EVENT  then 
			Output <= Input;
		end if;	
	end process;	
end arch_registe;