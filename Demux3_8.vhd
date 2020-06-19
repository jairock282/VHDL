-------------------------------------------------------------------------------
--
-- Title       : Demux3_8
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Demux3_8.vhd
-- Generated   : Martes 18 de Feb 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Demux 3_8	 
-- Tabla de verdad
--+-------------------------------------------------------+
--¦ S0  ¦ S1 ¦ S3 ¦ O0 ¦ O1 ¦ O2 ¦ O3 ¦ O4 ¦ O5 ¦ O6 ¦ O7 ¦
--¦-----+----+----+----+----+----+----+----+----+----+----¦
--¦   0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  1 ¦
--¦   0 ¦  0 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  1 ¦  0 ¦
--¦   0 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  1 ¦  0 ¦  0 ¦
--¦   0 ¦  1 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  1 ¦  0 ¦  0 ¦  0 ¦
--¦   1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦
--¦   1 ¦  0 ¦  1 ¦  0 ¦  0 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦
--¦   1 ¦  1 ¦  0 ¦  0 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦
--¦   1 ¦  1 ¦  1 ¦  1 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦  0 ¦
--+-------------------------------------------------------+
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Demux3_8 is
	port(
	
		input : in std_logic;
		sel : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(7 downto 0)
	);
end entity;

--architecture flow of Demux3_8 is
--begin		  
--	--Selection Assignaments	   
--	
--	with sel select
--		output <= input&"0000000" when "000",   
--		"ZZZZZZZZ" when others;
--		
--	with sel select
--		output <= "0"&input&"000000" when "001",   
--		"ZZZZZZZZ" when others;		
--	
--	with sel select
--		output <= "00"&input&"00000" when "010",
--		"ZZZZZZZZ" when others;	   
--	
--	with sel select
--		output <= "000"&input&"0000" when "011",
--		"ZZZZZZZZ" when others;
--	
--	with sel select
--		output <= "0000"&input&"000" when "100",
--		"ZZZZZZZZ" when others;
--	
--	with sel select
--		output <= "00000"&input&"00" when "101",
--		"ZZZZZZZZ" when others;
--	
--	with sel select
--		output <= "000000"&input&"0" when "110",
--		"ZZZZZZZZ" when others;
--	
--	with sel select
--		output <= "0000000"&input when "111",
--		"ZZZZZZZZ" when others;		  			 
--		
---------------------------------------------------------------- 
----------------------------------------------------------------
--
--	--Conditional Assignaments	 
--
--output <= input&"0000000" when (sel = "000") else
--		'0'&input&"000000" when (sel = "001") else
--		"00"&input&"00000" when (sel = "010") else
--		"000"&input&"0000" when (sel = "011") else
--		"0000"&input&"000" when (sel = "100") else
--		"00000"&input&"00" when (sel = "101") else
--		"000000"&input&'0' when (sel = "110") else
--		"0000000"&input when (sel = "111") else
--		"ZZZZZZZZ";
--
--end architecture; 

architecture behavioral of Demux3_8 is
begin
	
	--Behavioral Assignaments
	process(sel, input)is
	begin
		if sel="000" then
			output <= input&"0000000";
		elsif sel="001" then
			output <= "0"&input&"000000";
		elsif sel="010" then
			output <= "00"&input&"00000";
		elsif sel="011" then
			output <= "000"&input&"0000";
		elsif sel="100" then
			output <= "0000"&input&"000";
		elsif sel="101" then
			output <= "00000"&input&"00";
		elsif sel="110" then
			output <= "000000"&input&'0';
		else
			output <= "0000000"&input; 
		end if;	
	end process;
	
end architecture;
