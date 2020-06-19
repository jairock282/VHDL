--------------------------------------------------------------------------------
-- Title       : commparadorCompleto_1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\comparadorCompleto_1bit.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un medio comparador de 1bit
--				Entradas:
--				A, B, Gi, Ei, Li
--				Salidas:
--				Go, Eo, Lo
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity comparadorCompleto_1bit is
	port(
	A : in std_logic;
	B : in std_logic;
	Gi : in std_logic := '0';
	Ei : in std_logic := '1';
	Li : in std_logic := '0';
	Go : out std_logic;
	Eo : out std_logic;
	Lo : out std_logic
	);
end entity;

architecture simple of comparadorCompleto_1bit is
begin
	
	--Función para determinar igualdad entre los bits comparados
	Eo <= (Ei and (not(A))and(not(B))) or (Ei and A and B);
	
	--Función para determinar si A>B
	Go <= (Ei and (A and (not(B)))) or Gi;
	
	--Función para determinar si A<B
	Lo <= (Ei and ((not(A)) and B)) or Li;

end architecture;
	