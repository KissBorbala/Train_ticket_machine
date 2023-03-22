library ieee;
use ieee.std_logic_1164.all;

entity comparator_12 is 
	port( A, B : in std_logic_vector (11 downto 0);
	AGB, AEB, ALB : out std_logic); 
end comparator_12;	

architecture arch_comp of comparator_12 is 
begin
	process(A, B)
	begin	
		
		if (A(11 downto 8) > B(11 downto 8)) then
			AGB <= '1';	AEB <= '0'; ALB <= '0';
		elsif (B(11 downto 8) > A(11 downto 8))	then
			ALB <= '1'; AEB <= '0'; AGB <= '0';
		elsif (A(7 downto 4) > B(7 downto 4)) then
			AGB <= '1';	AEB <= '0'; ALB <= '0';
		elsif (B(7 downto 4) > A(7 downto 4))	then
			ALB <= '1';	AEB <= '0'; AGB <= '0';
		elsif (A(3 downto 0) > B(3 downto 0)) then
			AGB <= '1';	 AEB <= '0'; ALB <= '0';
		elsif (B(3 downto 0) > A(3 downto 0))	then
			ALB <= '1';	 AEB <= '0'; AGB <= '0';
		else  AEB <= '1'; AGB <= '0'; ALB <= '0';	
		end if;	
					
	end process;
end arch_comp;
	