-------------------------------------------------------------------------------
--
-- Title       : Flip_FlopD
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : FlipFlopD.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Flip_FlopD
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity FlipFlopD is
	port(
	
		clk : in std_logic; --Clock
		rst : in std_logic;	--Reset
		LD : in std_logic := 'Z';--Load
		D : in std_logic := 'Z';--Estados siguiente
		Q : out std_logic := 'Z';--Estado presente
		Qn : out std_logic := 'Z'--Estado presente negado
	
	);
end entity;	

architecture behaivoral of FlipFlopD is
begin			 
	
	process(clk)
	begin
		if( rst = '1' )then			
			if(clk 'event and clk = '1')then			
				if( LD = '1' )then
					Q <= D;
					QN <= not(D);
				end if;
			 end if;
		else  
			Q <= 'Z';
			Qn <= 'Z';	
		end if;
	end process;
end architecture;
