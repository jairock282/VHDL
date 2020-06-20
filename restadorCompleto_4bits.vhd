--------------------------------------------------------------------------------
-- Title       : restadorCompleto_4bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\restadorCompleto_4bits.vhd
-- Generated   : Viernes 17 de abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un restador completo de 4 bits
--				Entradas:
--				A(4), B(4), Bi
--
--				Salidas:
--				Bo, R
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity restadorCompleto_4bits is
	port(
	
		A : in std_logic_vector(3 downto 0) := (others => '0');
		B : in std_logic_vector(3 downto 0) := (others => '0');
		R : out std_logic_vector(4 downto 0) := (others => '0')	
	);
end entity;

architecture structure of restadorCompleto_4bits is

	component restadorCompleto_1bit is
		port(
			A : in std_logic;
			B : in std_logic;
			Bi : in std_logic;
			R : out std_logic;
			Bo : out std_logic
		);
	end component;
	
	signal X, Y, Z : std_logic;

begin 
	
	Bit0 : restadorCompleto_1bit port map(A(0), B(0), '0', R(0), X);
	Bit1 : restadorCompleto_1bit port map(A(1), B(1), X, R(1), Y);
	Bit2 : restadorCompleto_1bit port map(A(2), B(2), Y, R(2), Z);
	Bit3  : restadorCompleto_1bit port map(A(3), B(3), Z, R(3), R(4));
	
end architecture;

