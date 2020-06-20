--------------------------------------------------------------------------------
-- Title       : restadorCompleto_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\restadorCompleto_1bit.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un restador completo de un bit
--				Entradas:
--				A, B -> palabras de 1bit
--				Bi -> bit prestado resta anterior

--				Salidas:
--				R -> Resultado de la operación
--				Bo -> Borrow
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity restadorCompleto_1bit is
	port(
	
		A : in std_logic := '0';
		B : in std_logic := '0';
		Bi : in std_logic := '0';
		
		R : out std_logic := '0';
		Bo : out std_logic := '0'
	
	);
end entity;	

architecture simple of restadorCompleto_1bit is
begin 

	--Resultado resta
	R <= (Bi xor (A xor B));
	
	--Hubo prestadp? (Borrow)
	Bo <= ((not(A)) and B) or (Bi and (not(A))) or (Bi and B);
	
end architecture;

