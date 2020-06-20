--------------------------------------------------------------------------------
-- Title       : commparadorCompleto_4bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\comparadorCompleto_4bits.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un medio comparador de 4bits
--				Entradas:
--				A, B, Gi, Ei, Li
--				Salidas:
--				Go, Eo, Lo
-------------------------------------------------------------------------------				  
library IEEE;
use ieee.std_logic_1164.all;

entity comparadorCompleto_4bits is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Go : out std_logic;
		Eo : out std_logic;
		Lo : out std_logic
	);
end entity;

architecture structural of comparadorCompleto_4bits is	
	component comparadorCompleto_1bit is
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
	end component;			
	
	signal X0, Y0, Z0 : std_logic;
	signal X1, Y1, Z1 : std_logic;
	signal X2, Y2, Z2 : std_logic;
	
begin	   
	
	bloque0 : comparadorCompleto_1bit port map(A(0), B(0), '0', '1', '0', X0, Y0, Z0); 
	bloque1 : comparadorCompleto_1bit port map(A(1), B(1), X0, Y0, Z0, X1, Y1, Z1);
	bloque2 : comparadorCompleto_1bit port map(A(2), B(2), X1, Y1, Z1, X2, Y2, Z2);
	bloque3 : comparadorCompleto_1bit port map(A(3), B(3), X2, Y2, Z2, Go, Eo, Lo);
	
end architecture;
