--------------------------------------------------------------------------------
-- Title       : medioRestador_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\medioRestador_1bit.vhd
-- Generated   : Viernes 17 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un medio restador de un bit
--				Entradas:
--				A, B
--				Salidas:
--				R, Bo
-------------------------------------------------------------------------------	
library IEEE;
use ieee.std_logic_1164.all;

entity medioRestador_1bit is
	port(
		A : in std_logic := '0';
		B : in std_logic := '0';
		
		R : out std_logic := '0';
		Bo : out std_logic := '0'
	);
end entity;	 

architecture simple of medioRestador_1bit is
begin
	
	--Concurrencia
	R <= (A xor B); --Salida resta
	Bo <= ((not(A)) and B); --Hubo prestamo? (Borrow)
	
end architecture;

