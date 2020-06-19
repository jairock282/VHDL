--
-- Title       : Mux8_1
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Mux8_1.vhd
-- Generated   : Tue FEB 11 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Multiplexor, 8 in - 1 out
--				 I0, I1, I2, I3, I4, I5, I6, I7: entradas logicas
--				 Output: es una salida logica
--				 sel: es el selector que permite conectar las salidas con Output
-------------------------------------------------------------------------------		

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8_1 is
	port(	
	A, B, C, D: in std_logic;
	E, F, G, H: in std_logic;
	s2, s1, s0: in std_logic;
	Z: out std_logic
	);
end entity;			 

architecture simple of Mux8_1 is
begin
	
	--Concurrencia			 
	Z <= ( A and ((not(S2) and not(S1)) and not(S0)) )
	or ( B and ((not(S2) and not(S1)) and S0) ) 
	or ( C and ((not(S2) and S1) and not(S0)) ) 
	or ( D and ((not(S2) and S1) and S0) ) 
	or ( E and (( S2 and not(S1)) and not(S0)) ) 
	or ( F and ((S2 and not(S1)) and S0) )
	or ( G and ((S2 and S1) and not(S0)) )
	or ( H and ((S2 and S1) and S0) );
	
	-- Condicional
	--Z <= A when ( (not(S2) and not(S1)) and not(S0) )else
	--	 B when ... 
	
end architecture;

