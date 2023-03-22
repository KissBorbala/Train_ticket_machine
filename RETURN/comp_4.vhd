library ieee;
use ieee.std_logic_1164.all;

entity comp_4 is 
	port( A, B : in std_logic_vector (3 downto 0);
	AGB, AEB, ALB : out std_logic); 
end comp_4;	

architecture arch_comp_4 of comp_4 is 
begin
	process(A, B)
	begin	
		
		if(A > B) then 
			AGB <= '1'; AEB <= '0'; ALB <= '0';
		elsif (A < B) then
			AGB <= '0'; AEB <= '0'; ALB <= '1';
		else
			AGB <= '0'; AEB <= '1'; ALB <= '0';	 
		end if;	
	end process;
end arch_comp_4;
	