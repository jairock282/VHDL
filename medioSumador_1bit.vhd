--------------------------------------------------------------------------------
-- Title       : medioSumador_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\medioSumador_1bit.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un medio sumador de un bit
--				Entradas:
--				A, B
--				Salidas:
--				S
-------------------------------------------------------------------------------			 
library IEEE;
use ieee.std_logic_1164.all;

entity medioSumador_1bit is
	port(
		A : in std_logic;
		B : in std_logic;
		S : out std_logic
	);
end entity;

architecture simple of medioSumador_1bit is
begin	  
	
	--concurrencia	
	--Salida de la suma
	S <= (not(A) and B) or (A and not(B));
	
end architecture;
