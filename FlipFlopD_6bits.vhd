-------------------------------------------------------------------------------
--
-- Title       : Flip_Flop D de 6bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : FlipFlopD_6bits.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Registro de memoria de 6bits desarrollado con Flip-Flops tipo D
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity FlipFlopD_6bits is
	
	generic(
	
		n : integer := 5
	
	);	
	
	port(
	
		clk : in std_logic; --Clock
		rst : in std_logic;	--Reset
		LD : in std_logic; --Load
		D : in std_logic_vector(n downto 0); 	--Estados siguiente
		Q : out std_logic_vector(n downto 0); 	--Estado presente
		Qn : out std_logic_vector(n downto 0)	--Estado presente negado
	
	);
end entity;	

architecture behaivoral of FlipFlopD_6bits is --Registro Paralelo
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
			Q <= (others => 'Z');
			Qn <= (others => 'Z');
			
		end if;
	end process;
end architecture;