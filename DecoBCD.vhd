--------------------------------------------------------------------------------
-- Title       : sumadorCompleto_4bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : DecoBCD.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un decodificador BCD a un display de 7 segmentos
--				Entradas:
--				input(4)
--				Salidas:
--				output(8)	   
--
--	+-------+---+---+---+---+---+---+---+---+----+----+
--	| Input | h | g | f | e | d | c | b | a | m  | M  |
--	+-------+---+---+---+---+---+---+---+---+----+----+
--	|  0000 | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 3F | C0 |
--	|  0001 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 06 | F5 |
--	|  0010 | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 5B | A4 |
--	|  0011 | 0 | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 4F | B0 |
--	|  0100 | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 66 | 66 |
--	|  0101 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 6D | 92 |
--	|  0110 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 7D | 82 |
--	|  0111 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 07 | F8 |
--	|  1000 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 7F | 80 |
--	|  1001 | 0 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 6F | 90 |
--	|  1010 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 77 | 88 |
--	|  1011 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 7C | 83 |
--	|  1100 | 0 | 0 | 1 | 1 | 1 | 0 | 0 | 1 | 39 | C6 |
--	|  1101 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 5E | A1 |
--	|  1110 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 79 | 86 |
--	|  1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 71 | 8E |
--	+-------+---+---+---+---+---+---+---+---+----+----+
--
library IEEE;
use IEEE.std_logic_1164.all;

entity DecoBCD is
	port(
	
	input: in std_logic_vector(3 downto 0);
	output: out std_logic_vector( 7 downto 0)
	
	);
end entity;

architecture simple of DecoBCD is
begin 						 
	
	--Conditional Assignaments 
	--Activado con Minterminos -> Catodo Comun	
			--Asigamos un valor Hexadecimal
	output <= X"3F" when (input=X"0") else
			  X"06" when (input=X"1") else
			  X"5B" when (input=X"2") else
			  X"4F" when (input=X"3") else
		      X"66" when (input=X"4") else
		 	  X"6D" when (input=X"5") else
			  X"7D" when (input=X"6") else
			  X"07" when (input=X"7") else
			  X"7F"	when (input=X"8") else
			  X"6F" when (input=X"9") else
			  X"77" when (input=X"A") else
			  X"7C" when (input=X"B") else
			  X"39" when (input=X"C") else
			  X"5E" when (input=X"D") else
			  X"79" when (input=X"E") else
			  X"71";
		
end architecture;
	