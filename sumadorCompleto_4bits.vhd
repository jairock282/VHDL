--------------------------------------------------------------------------------
-- Title       : sumadorCompleto_4bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\sumadorCompleto_4bits.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un sumador completo de 4 bits
--				Entradas:
--				A(4), B(4), Ci
--				Salidas:
--				Co, S
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity sumadorCompleto_4bits is
	port(
	
	A : in std_logic_vector(3 downto 0) := (others => '0');
	B : in std_logic_vector(3 downto 0) := (others => '0');
	S : out std_logic_vector(4 downto 0) := (others => '0')	
	);
end entity;

architecture structure of sumadorCompleto_4bits is

	component sumadorCompleto_1bit is
		port(
		A : in std_logic;
		B : in std_logic;
		Ci : in std_logic;
		Co : out std_logic;
		S : out std_logic
		);
	end component;
	
	signal X, Y, Z : std_logic;

begin 
	
	bit0 : sumadorCompleto_1bit port map(A(0), B(0), '0', X, S(0));	   
	bit1 : sumadorCompleto_1bit port map(A(1), B(1), X, Y, S(1));
	bit2 : sumadorCompleto_1bit port map(A(2), B(2), Y, Z, S(2));
	bit3 : sumadorCompleto_1bit port map(A(3), B(3), Z, S(4), S(3));
	
end architecture;

