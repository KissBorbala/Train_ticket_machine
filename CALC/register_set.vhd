library ieee;
use ieee.std_logic_1164.all;

entity register_set is 
	port( CLK, SET : in std_logic; 
	Input, Data : in std_logic_vector (12 downto 0);
	Output : out std_logic_vector (12 downto 0));
end register_set;

architecture arch_reg_set of register_set is 

begin  
	process(CLK, SET)
	begin 
		if(SET = '1') then Output <= Data;
		elsif CLK = '1' and CLK'EVENT  then 
			Output <= Input;
		end if;	
	end process;	
end arch_reg_set;