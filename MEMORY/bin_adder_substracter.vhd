library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bin_ad_sub is 
	port( A, B: in std_logic_vector (15 downto 0);
	SUB, RESET : in std_logic;
	SUM: out std_logic_vector (15 downto 0));
end bin_ad_sub;

architecture arch_bin_ad_sub of bin_ad_sub is 
begin
	process(A, B, SUB, RESET) 
	variable result: std_logic_vector(15 downto 0);
	begin
		if(RESET = '1') then
			if(SUB = '1') then 
				result := A - B;
				SUM <= result(15 downto 8) & "0000" & result(3 downto 0);
			elsif (SUB = '0') then
				result := A + B;
				SUM <= result(15 downto 8) & "0000" & result(3 downto 0);
			end if;
		elsif (SUB = '1') then
			SUM <= A - B;
		elsif (SUB = '0') then
			SUM <= A + B;
        end if;
	end process;
end arch_bin_ad_sub;
