library ieee;
use ieee.std_logic_1164.all;

entity project_train is 
	port(  CLK, finish, cancel, p10, p100, m10, m100,
	ins1, ins2, ins5, ins10, ins20, ins50, insticket: in std_logic;
	ticket, E1, E2, E5, E10, E20, E50: out std_logic;
	display: out std_logic_vector(15 downto 0));
end project_train;	

architecture arch_project of project_train is 

component mux_16_16 is 
	port( S : in std_logic_vector (3 downto 0);
	I0, I1: in std_logic_vector(11 downto 0);
	I2: in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(15 downto 0)); 
end component;
component mux_8_8 is 
	port( S : in std_logic_vector(3 downto 0);
	I0, I1, I2, I3: in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(7 downto 0)); 
end component;
component command_unit is 
	port(  finish, cancel, rem_sum, pos0, pos1, done, CLK: in std_logic;
	distance, sub_money, calc_if_possible,
	error, restart, ret_inserted, ret_change, upload: out std_logic);
end component;
component distance_part is 
	port(  plus10, plus100, minus10, minus100, CLK, distance: in std_logic;
	SUM : out std_logic_vector(11 downto 0));
end component;
component substract_part is 
	port(  sub, CLK, e1, e2, e5, e10, e20, e50 : in std_logic;
	SUMIN : in std_logic_vector(11 downto 0);
	WE : out std_logic;	 
	remain : inout std_logic;
	SUM: out std_logic_vector(11 downto 0);
	adress: out std_logic_vector(7 downto 0));
end component;
component CIF_part is 
	port(  EN, CLK, cash : in std_logic;
	SUM: in std_logic_vector(11 downto 0);
	pos1, pos0, WE: out std_logic;
	adress: out std_logic_vector (7 downto 0));
end component;
component return_part is 
	port(  ret_change, ret_insert, CLK: in std_logic;
	inserted, change: in std_logic_vector(3 downto 0);
	WE, ret, done: out std_logic;  
	number: out std_logic_vector(7 downto 0));
end component;
component memory_part is 
	port(  WE, CLK, pinsert, minsert, pcash, mcash, pchange, mchange, resinsert: in std_logic;
	adress: in std_logic_vector(7 downto 0);
	inserted, change: out std_logic_vector(3 downto 0);
	cash_register: out std_logic_vector(7 downto 0));
end component;
component sevensegment is 
	port( Input : in std_logic_vector (3 downto 0);
	a, b, c, d, e, f, g : out std_logic    ); 
end component;	
component dmux_adress is 
	port( S : in std_logic_vector (7 downto 0);
	Input: in std_logic;
	ticket, E1, E2, E5, E10, E20, E50: out std_logic); 
end component;
component mux_upload is 
	port( S : in std_logic_vector(6 downto 0);
	Output : out std_logic_vector(7 downto 0)); 
end component;
signal rem_sum, pos0, pos1, done, cash, WE_sub, WE_CIF, WE_ret, WE_mem, 
pinsert, minsert, pcash, mcash, pchange, mchange, resinsert, state2,
distance, sub_money, calc_if_possible, error, restart, ret_inserted, ret_change, ret_ins_ch, returning, upload, nCLK: std_logic;
signal distanceSUM, subSUM: std_logic_vector(11 downto 0);
signal cash_register, adress_sub, adress_CIF, adress_ret, adress_upload, adress_mem, cash_register_out: std_logic_vector(7 downto 0);
signal S_display, inserted, change: std_logic_vector(3 downto 0);
signal S_adress: std_logic_vector(3 downto 0);
signal S_upload: std_logic_vector(6 downto 0);
begin 
	C1: command_unit port map (finish, cancel, rem_sum, pos0, pos1, done, CLK, distance, sub_money, calc_if_possible,
	error, restart, ret_inserted, ret_change, upload);
	C2: distance_part port map (p10, p100, m10, m100, CLK, distance, distanceSUM);
	C3: substract_part port map (sub_money, CLK, ins1, ins2, ins5, ins10, ins20, ins50, distanceSUM, WE_sub, rem_sum, subSUM, adress_sub);
	C4: CIF_part port map (calc_if_possible, CLK, cash, subSUM, pos1, pos0, WE_CIF, adress_CIF); 
	C5: return_part port map (ret_change, ret_inserted, CLK, inserted, change, WE_ret, returning, done, adress_ret);
	C6: memory_part port map (WE_mem, CLK, pinsert, minsert, pcash, mcash, pchange, mchange, resinsert, adress_mem, inserted, change, cash_register);
	WE_mem <= (WE_sub and sub_money) or (WE_CIF and calc_if_possible) or (WE_ret and (ret_inserted or ret_change)) or restart
	or ((ins1 or ins2 or ins5 or ins10 or ins20 or ins50 or insticket) and upload); 
	cash <= cash_register(0) or cash_register(1) or cash_register(2) or cash_register(3) or cash_register(4) or
	cash_register(5) or cash_register(6) or	 cash_register(7);
	pinsert <= (WE_sub and sub_money);
	minsert <= (WE_ret and ret_inserted);
	pcash <= (WE_sub and sub_money) or ((ins1 or ins2 or ins5 or ins10 or ins20 or ins50 or insticket) and upload);
	mcash <= (WE_ret and (ret_inserted or ret_change));
	pchange <= (WE_CIF and calc_if_possible);
	mchange <= (WE_ret and ret_change);
	resinsert <= (WE_ret and ret_change);
	ret_ins_ch <= ret_inserted or ret_change;
	S_adress <= upload  & ret_ins_ch & calc_if_possible & sub_money;
	C7: mux_8_8 port map (S_adress, adress_sub, adress_CIF, adress_ret, adress_upload, adress_mem);
	state2 <= calc_if_possible or ret_ins_ch;
	S_display <= error & state2 & sub_money & distance; 
	C8: mux_16_16 port map (S_display, distanceSUM, subSUM, subSUM(7 downto 0), display);
	C9: dmux_adress	port map (adress_mem, returning, ticket, E1, E2, E5, E10, E20, E50);
	S_upload <= ins1 & ins2 & ins5 & ins10 & ins20 & ins50 & insticket;
	D1: mux_upload port map (S_upload, adress_upload);	 
end arch_project;