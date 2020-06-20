-------------------------------------------------------------------------------
--
-- Title       : Contador de programa
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : contProg.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Contador de Programa
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contProg2 is	
	generic( 
	
		n : integer := 3 
	);
	port(
	
		clk : in std_logic; --Reloj físico
		addr : out std_logic_vector(n downto 0) := (others => 'Z')
	
	);
end entity;

architecture behaivoral of contProg2 is

signal cnt : std_logic_vector(n downto 0) := (others => 'Z');

begin

	contador : process(clk)
	begin
		if(rising_edge(clk))then
			if( cnt < "1111")then
				cnt <= cnt + 1;
					
			else
				cnt <= "0000";
					
			end if;	
			
			addr <= cnt; 
						
		end if;
		
	end process contador;

end architecture;
