-------------------------------------------------------------------------------
--
-- Title       : FCNT
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : grayCode.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Gray Code
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity GrayCode is
	port(
		input: in std_logic_vector(2 downto 0);	
		gray: out std_logic_vector(2 downto 0)
	     );
end entity;

--architecture simple of GrayCode is
--begin
--	--Conditional Assignaments
--	gray <= "000" when (input="000") else
--		"001" when (input="001") else
--		"011" when (input="010") else
--		"010" when (input="011") else
--		"110" when (input="100") else
--		"111" when (input="101") else
--		"101" when (input="110") else
--		"100" when (input="111");		  
---------------------------------------------------------------- 
----------------------------------------------------------------	
--
--	--Selection Assignaments
--	with input select
--	gray <= "000" when "000",
--			"001" when "001",	  
--			"011" when "010",
--			"010" when "011",
--			"110" when "100",
--			"111" when "101",
--			"101" when "110",
--			"100" when "111",
--			"ZZZ" when others;
--
--end architecture;  

architecture behavioral of GrayCode is
begin
	--Behavioral Assignaments
	process(input)is
	begin
		if(input="000")then
			gray <= "000";
			
		elsif(input="001")then
			gray<= "001";
			
		elsif(input="010")then
			gray <= "011";
			
		elsif(input="011")then
			gray <= "010";
			
		elsif(input="100")then
			gray <= "110";
			
		elsif(input="101")then
			gray <= "111";
		
		elsif(input="110")then
			gray <= "101";
			
		elsif(input="111")then
			gray <= "100";
			
		else
			gray <= "ZZZ";	
			
		end if;
	end process;

end architecture;