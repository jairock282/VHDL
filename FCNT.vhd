-------------------------------------------------------------------------------
--
-- Title       : FCNT
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : FCNT.vhd
-- Generated   : Tue Jan 28 08:26:01 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Basics of VHDL
--
-------------------------------------------------------------------------------
--Declaración de librerías
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_Logic_1164.bit;  
--use IEEE.std_logic_1164.entity;

--Nombre de la entidad (Caja negra)
entity FCNT is						  
	-- Aqui pueden existir otros tipos de variables
	--...
	
	--Entradas y salidas de la entidad
	port(							  
								--Estamos asignando un valor :=
		 A, B, C : in STD_LOGIC := '0';
--		 B : in STD_LOGIC;
--		 C : in STD_LOGIC;
		 Y : out STD_LOGIC
	     );
end FCNT; --Cerramos la entidad
--end entity
--end entity FCNT
--Cualquiera de las tres formas funcionan

architecture Simple of FCNT is --nombreArquitectura y a quién pertenece 
begin
	--aquí se determina que hace nuestra caja negra 
	
	Y <= B or ( (not C) and (not A)); --Asignaciones concurrentes

end Simple; --Cerramos la arqutectura
--end architecture
--end architecture simple
--Cualquiera de las tres formas funciona
