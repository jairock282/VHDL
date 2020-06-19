-------------------------------------------------------------------------------
--
-- Title       : Demux2_1
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Demux2_1.vhd
-- Generated   : Martes 18 de Feb 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Demux 2_1
--
-------------------------------------------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;

entity Demux2_1 is
	port( 
	input : in std_logic;
	sel : in std_logic;
	out1 : out std_logic;
	out2 : out std_logic
	);
end entity;

architecture flow of Demux2_1 is
begin
	
	--Selection assignment	   
	--Solo se puede hacer la asignación con un solo valor
	--Si existen más se debe realizar otra estructura de selección
--	with sel select			 
--		out1 <= input when('0'),
--		'Z' when others; --Todos los demas casos
--		
--	with sel select
--		out2 <= input when('1'),
--		'Z' when others;   

	--Conditional assignments
--		out1 <= input when (sel='0')else
--		'Z';
--
--		out2 <= input when (sel='1')else
--		'Z';	  

	--Concurrence Assignaments
	out1 <= input and (not(sel));
	out2 <= input and sel;
	
	
end architecture;