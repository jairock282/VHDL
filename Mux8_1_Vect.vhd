-------------------------------------------------------------------------------
--
-- Title       : Mux2_1
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : Mux8_1_vect.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Multiplexor, 8 in - 1 out
--				 I(8): entradas logicas
--				 Output: es una salida logica
--				 sel(3): es el selector que permite conectar a I0 e I1 con Output
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8_1_Vect is
	port(										 
		--Declaramos vector
		I : in std_logic_vector(7 downto 0); --0 to 7
		S : in std_logic_vector(2 downto 0);
		Z : out std_logic
	);
end entity;

architecture simple of Mux8_1_Vect is
begin		
	-- Asignaciones condicionales
	Z <= I(0) when (S = "000") else
		 I(1) when (S = "001") else
		 I(2) when (S = "010") else
		 I(3) when (S = "011") else
		 I(4) when (S = "100") else
		 I(5) when (S = "101") else
		 I(6) when (S = "110") else
		 I(7) when (S = "111") else 'Z';
	
end architecture;