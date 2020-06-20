--------------------------------------------------------------------------------
-- Title       : sumadorCompleto_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\sumadorCompleto_1bit.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un sumador completo de un bit
--				Entradas:
--				A -> Palabra 1 
--				B -> Palabra 2 
--				Ci -> Acarreo de entrada
--				Salidas:
--				Co -> Acarreo generado
--				S -> Resultado suma bit	
-------------------------------------------------------------------------------			 
library IEEE;
use ieee.std_logic_1164.all;

entity sumadorCompleto_1bit is
	port(
	A : in std_logic;
	B : in std_logic;
	Ci : in std_logic := 'Z';
	Co : out std_logic := 'Z';
	S : out std_logic := 'Z'
	);
end entity;

architecture simple of sumadorCompleto_1bit is
begin
	--Concurrencia		 
	--Resultado de la suma
	S <= (not(Ci) and (A xor B)) or (Ci and not(A xor B));	 
	
	--Acarreo actual
	Co <= (Ci and (A or B)) or (A and B);
	
end architecture;

	