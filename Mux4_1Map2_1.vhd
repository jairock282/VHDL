-------------------------------------------------------------------------------
--
-- Title       : Mux4_1 con dos 2_1
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\FCNT.vhd
-- Generated   : Martes 17 de Feb 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a multiplexor 4_1 made of two multiplexors of 2_1
--
-------------------------------------------------------------------------------	 
library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4_1Map2_1 is	   
	
	port(
		Input : in std_logic_vector(3 downto 0);
		Sel : in std_logic_vector(1 downto 0);
		Output : out std_logic
	);
	
end entity;

architecture structure of Mux4_1Map2_1 is  	 

component Mux2_1 is
	port( 					  	
		I0, I1: IN std_logic;
		Sel: IN std_logic;
		Output: OUT std_logic
	);
end component;	  

	--Señales internas
	signal x, y : std_logic;

begin	   
	
	bloque0 : Mux2_1 port map( Input(0), Input(1), Sel(0), X);	
	bloque1 : Mux2_1 port map( Input(2), Input(3), Sel(0), Y);
	bloque2 : Mux2_1 port map( x, y, Sel(1), Output);
	
end architecture;