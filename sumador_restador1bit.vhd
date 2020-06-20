
--------------------------------------------------------------------------------
-- Title       : sumador_restador1bit
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\sumador_restador1bit.vhd
-- Generated   : Domingo 19 de abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un sumador_restador de 1bit
--				Entradas:
--				A
--				B
--				Xi -> (prestamo recibido | acarreo recibido)
--				Op -> selector de operacion (suma | resta)
--
--				Salidas:
--				Xo -> (se realizo prestamo | se realizo acarreo)
--				SR -> Resultado (suma | resta)
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity sumador_restador is
	port(
	
		A : in std_logic := '0';
		B : in std_logic := '0';
		Xi : in std_logic := '0';
		Op : in std_logic := '0'; --0 = suma | 1 = resta
		Xo : out std_logic := '0';
		SR : out std_logic := '0'
		
	);
end entity;

architecture simple of sumador_restador  is
-------------------------------------------
-- **Ci = Bi

--Ecuaciones suma
-- S = Ci xor A xor B
-- Co = CiB + CiA + AB
--
--Ecuaciones resta
-- R = Bi xor A xor B
-- Bo = BiB + Binot(A) + not(A)B 
--
--Ecuaciones sumador_restador
-- SR = Xi xor A xor B
-- Xo = XiB + Xi(A xor Op) + B(A xor Op) <- Agregamos un operador XOR para determinar (dependiendo del estado del selector de operacion, que operación se esta realizando),
--										de esta manera, si se esta sumando A pasará igual (como en su ecuación original) y si estamos reestando el xor negará A
--										permitiendo actuar como la ecuación original de la resta.
--
-------------------------------------------	
begin	

	--Concurrencia
	--sumador_restador
	SR <= Xi xor A xor B;	 
	
	--Resta
	--Acarreo actual | petición de prestamo
	Xo <= (Xi and B) or (Xi and (A xor Op)) or (B and (A xor Op));
	
	
	
end architecture;