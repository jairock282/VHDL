-------------------------------------------------------------------------------
--
-- Title       : Mux8_1 Mapeo
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
-- Description : Este archivo contiene un multiplexor 8-1 utilizando mapeo(llamando componentes de otro archivos)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8_1Map is
	port(
		Input : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(2 downto 0);
		Output : out std_logic
	);
end entity;	  

architecture structure of Mux8_1Map is
	--Llamar componentes desde otros archivos
	--Copiar toda la entidad y cambiar por "component"
	component Mux2_1 is
		port( 					  
		
		I0, I1: IN std_logic; 	
		Sel: IN std_logic;
		Output: OUT std_logic
		
		);
	end component; 
	
	component Mux4_1 is
		port(
		
		I0: IN std_logic;
		I1: IN std_logic;
		I2: IN std_logic;
		I3: IN std_logic;
		
		Sel0: IN std_logic;
		Sel1: In std_logic;
		
		Output: OUT std_logic
		
		);	
	end component;	
	
	--Declar las señales internas, son las conexiones interiores, como cables
	signal x, y: std_logic;	 
	
begin 
	
	--Realizamos el MAPEO
	-- label: component port map(signal)
		--Se asignan las señales a cada uno de los puertos definidos en el componente seleccionado
		--Se debe respetar el orden en el que se declararon para que se asignen de manera correcta
		bloque0: Mux4_1 port map(Input(0), Input(1), Input(2), Input(3), sel(1), sel(0), x); --x es mi señal declarada arriba, en base al dibujo 
		
		bloque1: Mux4_1 port map(Input(4), Input(5), Input(6), Input(7), sel(1), sel(0), y);  
		
		bloque2: Mux2_1 port map(x, y, sel(2), Output);
end architecture;