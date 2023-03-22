library ieee;
use ieee.std_logic_1164.all;

entity dmux_adress is 
	port( S : in std_logic_vector (7 downto 0);
	Input: in std_logic;
	ticket, E1, E2, E5, E10, E20, E50: out std_logic); 
end dmux_adress;	  

architecture arch_dmux_adress of dmux_adress is 

begin 	
	process (S, Input)
	begin
		ticket <= '0'; E1 <= '0'; E2 <= '0'; E5 <= '0';
		E10 <= '0'; E20 <= '0'; E50 <= '0';
		if(Input = '1') then
	   case S is
		   when "00000000" => ticket <= Input;
		   when "00000001" => E1 <= Input;
		   when "00000010" => E2 <= Input;
		   when "00000101" => E5 <= Input;
		   when "00010000" => E10 <= Input;
		   when "00100000" => E20 <= Input;
		   when "01010000" => E50 <= Input;
		   when others => 
	   end case;
	   end if;
	   end process;
	
end arch_dmux_adress;	