library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity BCD_ad_sub_12 is 
	port( A2, A1, A0, B2, B1, B0 : in std_logic_vector (3 downto 0);
	SUB, EN, RESET : in std_logic;
	SUM2, SUM1, SUM0 : out std_logic_vector (3 downto 0);
	SIGN : inout std_logic); 
end BCD_ad_sub_12;	

architecture arch_BCD_AS of BCD_ad_sub_12 is 	
begin
	process (EN, A2, A1, A0, B2, B1, B0, SUB, RESET)
	variable CARRY1, CARRY0 : std_logic;
	begin
		if (RESET = '1') then  SUM2 <= "0000"; SUM1 <= "0000"; SUM0 <= "0000"; SIGN <= '0';
		elsif (EN = '1') then 
			if (SUB = '0') then
				if(SIGN = '1' and (A2 > B2 or (A2 = B2 and A1 > B1) or (A2 = B2 and A1 = B1 and (A0 > B0 or A0 = B0)))) then SIGN <= '1';
				else SIGN <= '0';
					end if;
				if (A0 + B0 <= 9 ) then
					if(A0 + B0 <= 2 and (A0 > 7 or B0 > 8)) then 
						SUM0 <= A0 + B0 + 6; CARRY0 := '1';
					else 	SUM0 <= A0 + B0;  CARRY0 := '0'; 
					end if;
				else 
					SUM0 <= A0 + B0 + 6; CARRY0 := '1';
			    end if;	
				if (A1 + B1 + CARRY0 <= 9 ) then
					if(A1 + B1 <= 2 and (A1 + CARRY0 > 7 or B1 + CARRY0 > 8)) then 
						SUM1 <= A1 + B1 + 6+ CARRY0; CARRY1 := '1';
					else 	SUM1 <= A1 + B1 + CARRY0;  CARRY1 := '0'; 
					end if;
				else 
					SUM1 <= A1 + B1 + 6 + CARRY0; CARRY1 := '1';
			    end if;
				if (A2 + B2 + CARRY1 <= 9 ) then
					if(A2 + B2 <= 2 and (A2 + CARRY1 > 7 or B2 + CARRY1 > 8)) then 
						SUM2 <= A2 + B2 + 6+ CARRY1; 
					else 	SUM2 <= A2 + B2 + CARRY1; 
					end if;
				else 
					SUM2 <= A2 + B2 + 6 + CARRY1;
			    end if;
			elsif (SUB = '1') then 
			 if (A2 > B2 or (A2 = B2 and A1 > B1) or (A2 = B2 and A1 = B1 and A0 > B0)) then	 
			  if (A0 >= B0) then 
					SUM0 <= A0 - B0; CARRY0 := '0';  
				else SUM0 <= A0 + 10 - B0; CARRY0 := '1';	
				end if;	
				if (A1 >= B1 + CARRY0) then 
					SUM1 <= A1 - B1 - CARRY0; CARRY1 := '0';  
				else SUM1 <= A1 + 10 - B1 - CARRY0; CARRY1 := '1';	
				end if;	
				if (A2 >= B2 + CARRY1) then 
					SUM2 <= A2 - B2 - CARRY1; 
				else SUM2 <= A2 + 10 - B2 - CARRY1;
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
				if (B2 >= A2 + CARRY1) then 
					SUM2 <= B2 - A2 - CARRY1; 
				else SUM2 <= B2 + 10 - A2 - CARRY1;
				end if;
				  SIGN <= '1';
			  end if; 
			 end if;
			end if;
					
	end process;
end arch_BCD_AS;
