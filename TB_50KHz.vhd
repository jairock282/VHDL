-------------------------------------------------------------------------------
--
-- Title       : Demux3_8
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\TB_50KHz.vhd
-- Generated   : Jueves 27 de Feb 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Base de tiempo a 50KHz 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all; --Se necesita determinar si son con signo para poder realizar las operaciones aritmeticas

entity TB_50KHz is
	port(
	
	clkIn: in std_logic;
	clkOut: out std_logic
	
	);
end entity;

architecture behaivoral of TB_50KHz is
	--Por el tipo de frecuencia obtenemos la cantidad máxima de nuestro contador
	-- F = 50MHz/50KHz = 50 000 000/50 000 = 1000
	-- La cantidad de bits que necesitamos para representar 1000 es de 10bits
	-- ln(1000)/ln(2) = 9.96 = 10
	
	--1000 representa el periodo completo, pero necesitamos mantener la mitad en alto y la otra en bajo
	--1111101000 -> 1000
	--0111110100 -> 500
	
	--Señal interna que será nuestro contador
	signal cnt : std_logic_vector(9 downto 0) := "0000000000";
begin 
	process(clkIn)
	begin
		--Utilizamos if ya que nos permite mantener el estado anterior, similar a un flipflop, detectamos cada vez
		--que haya un cambio de estado (cualquiera de los 7) y sea 1
		if(clkIn 'event and clkIn='1') then --rising_edge(clkIn) <- solo detecta los cambios 1-0 y 0-1
			--Verificamos si ha sucedido algun cambio
			--Contamos pulsos
			cnt <= cnt + 1;
			if(cnt < "0111110100")then
				clkOut <= '1';	
				
			elsif(cnt < "1111101000")then
				clkOut <= '0';
			else
				cnt <= "0000000000";
			end if;
		end if;
	end process;
end architecture;								
	