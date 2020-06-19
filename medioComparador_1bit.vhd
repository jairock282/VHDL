--------------------------------------------------------------------------------
-- Title       : medioComparador_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\medioComparador_1bit.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un medio comparador de 1bit
--				Entradas:
--				A, B
--				Salidas:
--				G, E, L
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity medioComparador_1bit is
	port(
		A : in std_logic; --Palabra a compararse
		B : in std_logic; --Palabra a compararse	
		G : out std_logic; --Grater than
		E : out std_logic; --Equal
		L : out std_logic  --Less than
	);
end entity;							  

architecture simple of medioComparador_1bit is
begin												   
	
	--Operación para verificar igualdad en las palabras
	E <= ((not(A))and(not(B))) or (A and B);
	--Operación para verificar si A>B
	L <= (not(A)) and (B);
	--Operación para verificar si A<B
	G <= A and (not(B));		
	
end architecture;

