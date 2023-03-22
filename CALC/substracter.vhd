library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity substracter is 
	port( A2, A1, A0, B1, B0 : in std_logic_vector (3 downto 0);
	EN : in std_logic;
	SUM2, SUM1, SUM0 : out std_logic_vector (3 downto 0);
	SIGN : inout std_logic); 
end substracter;	

architecture arch_substract of substracter is 	
begin
	process (EN, A2, A1, A0, B1, B0)
	variable CARRY1, CARRY0 : std_logic;
	begin
		if (EN = '1') then 
			 if (A2 > "0000" or (A2 = "0000" and A1 > B1) or (A2 = "0000" and A1 = B1 and A0 > B0)) then	 
			    if (A0 >= B0) then 
					SUM0 <= A0 - B0; CARRY0 := '0';  
				else SUM0 <= A0 + 10 - B0; CARRY0 := '1';	
				end if;	
				if (A1 >= B1 + CARRY0) then 
					SUM1 <= A1 - B1 - CARRY0; CARRY1 := '0';  
				else SUM1 <= A1 + 10 - B1 - CARRY0; CARRY1 := '1';	
				end if;	
				if (CARRY1 = '1') then 
					SUM2 <= "0000"; 
				else SUM2 <= A2;	
				end if; 
	            SIGN <= '0';
		     else 
				if (B0 >= A0)then 
					SUM0 <= B0 - A0; CARRY0 := '0';  
				else SUM0 <= B0 + 10 - A0; CARRY0 := '1';	
				end if;	
				if (B1 >= A1 + CARRY0) then 
					SUM1 <= B1 - A1 - CARRY0; CARRY1 := '0';  
				else SUM1 <= B1 + 10 - A1 - CARRY0; CARRY1 := '1';	
				end if;	
				SUM2 <= "0000";
				SIGN <= '1';
			  end if; 
		end if;
	end process;
end arch_substract;
