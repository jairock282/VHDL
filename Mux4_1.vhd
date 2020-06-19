-------------------------------------------------------------------------------
--
-- Title       : Mux4_1
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\FCNT.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Multiplexor, 4 in - 1 out
--				 I0, I1, I2, I3: entradas logicas
--				 Output: es una salida logica
--				 sel: es el selector que permite conectar las salidas con Output
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4_1 is
	port(
	
	I0: IN std_logic;
	I1: IN std_logic;
	I2: IN std_logic;
	I3: IN std_logic;
	
	Sel0: IN std_logic;
	Sel1: In std_logic;
	
	Output: OUT std_logic
	
	);	
end entity;

architecture simple of Mux4_1 is
begin			 
	
	--Concurrencia
--	Output <= ((not Sel0)and(not Sel1)and(I3)) or ((not Sel0)and(Sel1)and(I2)) or ((Sel0)and(not Sel1)and(I1)) or ((Sel0)and(Sel1)and(I0));
	
	--Condicional
Output <=   I3 when ((Sel0 = '0') and (Sel1 = '0')) else
            I2 when ((Sel0 = '0') and (Sel1 = '1')) else
			I1 when ((Sel0 = '1') and (Sel1 = '0')) else
			I0 when ((Sel0 = '1') and (Sel1 = '1')) else 'Z';  
				
end architecture;