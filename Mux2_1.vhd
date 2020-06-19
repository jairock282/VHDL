-------------------------------------------------------------------------------
--
-- Title       : Mux2_1
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
-- Description : This file has a Multiplexor, 2 in - 1 out
--				 I0 y I1: entradas logicas
--				 Output: es una salida logica
--				 sel: es el selector que permite conectar a I0 e I1 con Output
-------------------------------------------------------------------------------

--Declaramos las librerias y paquetes a utilizar
library IEEE;
use IEEE.std_logic_1164.all;

--Creamos nuestra entidad (caja negra)
entity Mux2_1 is
	--Definimos las entradas y salidas
	port( 					  
	
	I0, I1: IN std_logic; --Aqui pueden estar los 9 estados logicos
	Sel: IN std_logic;
	Output: OUT std_logic
	
	);
end entity;

--Definimos arquitectura (Fucionalidad)
		--Una practica es definir con el tipo de arquitectura a implementar
architecture flujo of Mux2_1 is
begin
	--Concurrencia
	--Output <= (Sel and I1) or (not(Sel) and I0);
	
	--Condicional
	Output <= I0 when (sel='0') else 
			  I1 when (sel='1') else 'Z';
	
end architecture;





