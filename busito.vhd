-------------------------------------------------------------------------------
--
-- Title       : busito
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : busito.vhd
-- Generated   : Miercoles 25 de Mar 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Manejo de bus de datos
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity busito is
	port(
	
		input	: in std_logic_vector(11 downto 0);
		out1	: out std_logic_vector(3 downto 0);
		out2 	: out std_logic_vector(1 downto 0);
		out3 	: out std_logic_vector(5 downto 0)
	);
end entity;

		--MSB
		--| 11 | 10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
		--1 0 1 1 1 0 1 0 1 0 1 1
architecture simple of Busito is
begin

	out1 <= input(3 downto 0);
	out2 <= input(11 downto 10);
	out3 <= input(9 downto 4);
	
end architecture;

