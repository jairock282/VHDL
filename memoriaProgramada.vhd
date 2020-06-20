-------------------------------------------------------------------------------
--
-- Title       : Memoria Programada
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : memoriaProgramada.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Memoria de Programa para el funcionamiento del procesador
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity memoriaProgramada is
	port(
	
		cProg : in std_logic_vector(3 downto 0);
		info : out std_logic_vector(5 downto 0)
		
	);
end entity;

architecture simple of memoriaProgramada is
begin 
	
	with cProg select		
		--Ejemplo 3x8 = +3+3+3+3+3+3+3+3 = 24
--		info <= "111111"	when("0000"),
--				"000001"	when("0001"), --dato
--				"101001"	when("0010"), --Instrucción
--				"000010"	when("0011"),
--				"101001"	when("0100"),--
--				"000011"	when("0101"),
--				"101001"	when("0110"),
--				"000100"	when("0111"),
--				"101001"	when("1000"),
--				"000101"	when("1001"),
--				"101001"	when("1010"),
--				"000110"	when("1011"),
--				"101001"	when("1100"),
--				"000111"	when("1101"),
--				"101001"	when("1110"),
--				"001000" 	when("1111"),
--				"ZZZZZZ" 	when others;

		--Ejemplo 1+1-1+1-1 = 1
--		info <= "111111" 	when("0000"),
--				"111111" 	when("0001"),
--			   	"101001"	when("0010"),
--				"111111"	when("0011"),
--				"101001"	when("0100"),
--				"000001"	when("0101"),
--				"101001"	when("0110"),
--				"000001"	when("0111"),
--				"101001"	when("1000"),
--				"000001"	when("1001"),
--				"ZZZZZZ"	when others;   

		--Ejemplo 15*3+12-7 = 50
		info <= "111111"	when("0000"), --Pasar A
				"001111"	when("0001"), --Dato -> 15
				"101001"	when("0010"), --Instrucción suma A + B
				"001111"	when("0011"), --Dato -> 15
				"101001"	when("0100"), --Instrucción suma A + B
				"001111"	when("0101"), --Dato -> 15
				"101001"	when("0110"), --Instrucción suma A + B
				"001100"	when("0111"), --Dato -> 12
				"011111"	when("1000"), --Instrucción resta B - A
				"000111"	when("1001"), --Dato -> 7
				"ZZZZZZ"	when others;
	
end architecture;

