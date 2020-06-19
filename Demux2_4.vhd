-------------------------------------------------------------------------------
--
-- Title       : Demux2_4
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Demux2_4.vhd
-- Generated   : Martes 18 de Feb 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This file has a Demux 2_4
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Demux2_4 is
	port(
	input : in std_logic;
	sel : in std_logic_vector(1 downto 0);
	output : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of Demux2_4 is
begin	   
	--label : process(list)
	--La etiqueta es recomendada cuando hay más de un proceso
	process(sel)is --Determinamos en base al estado de qué se desencadenan las acciones "Lista de sensibilidad"
	begin

	output <= "ZZZZ"; --Mandamos todo a alta impedancia para que se inicialicen los valores
	
--	Opción A
--		if sel="00" then
--			output <= input&"000"; --Concatenamos la salida para volverla vector, de esta manera podemos mandar cualquier estado
--		elsif sel="01" then
--			output <= '0'&input&"00";
--		elsif sel="10" then
--			output <= "00"&input&'0';
--		else
--			output <= "000"&input; 
--		end if;	  

--	Opción B
	if sel="00" then
		output(0) <= input;
	elsif sel="01" then
		output(1) <= input;
	elsif sel="10" then
		output(2) <= input;
	else 
		output(3) <= input;
	end if;
		
	end process;
	
end architecture;