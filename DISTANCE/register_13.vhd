library ieee;
use ieee.std_logic_1164.all;

entity register_13 is 
	port( CLK, RESET : in std_logic; 
	Input : in std_logic_vector (12 downto 0);
	Output : out std_logic_vector (12 downto 0));
end register_13;

architecture arch_register of register_13 is 

begin  
	process(CLK, RESET)
	begin 
		if(RESET = '1') then Output <= "0000000000000";
		elsif CLK = '1' and CLK'EVENT  then 
			Output <= Input;
		end if;	
	end process;	
end arch_register;