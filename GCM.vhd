-------------------------------------------------------------------------------
--
-- Title       : GCM
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : GCM.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : GCM
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity GCM is
	port(
	
		clk : in std_logic;
		ABCDE : out std_logic_vector(4 downto 0)
	
	);
end entity;

architecture behaivoral of GCM is

type Estados is (T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11); 

signal Qp, Qn : Estados := T11; --Qp y Qn tendran los estados de T0-T9
						 --Qp: estado actual, Qn: estado siguiente

begin
	
	sec : process( clk ) --Proceso secuencial
	begin	   
		
		if(clk 'event and clk = '1')then
			Qp <= Qn;
			
		end if;
	end process;
	
	comb : process( Qp )
	begin		
		
		case Qp is
			when T0 =>
				ABCDE <= "01000"; --RegInt
				Qn <= T1;
			
			when T1 =>
				ABCDE <= "00000";
				Qn <= T2; 
				
			when T2 =>
				ABCDE <= "10000"; --cntProg
				Qn <= T3;
				
			when T3 =>
				ABCDE <= "00000";
				Qn <= T4;
				
			when T4 =>
				ABCDE <= "00100"; --RegData
				Qn <= T5;
				
			when T5 =>
				ABCDE <= "00000";
				Qn <= T6;
				
			when T6 =>
				ABCDE <= "00010"; --Temp1
				Qn <= T7;
				
			when T7 =>
				ABCDE <= "00000";
				Qn <= T8;
				
			when T8 =>
				ABCDE <= "00001"; --Temp2
				Qn <= T9;
				
			when T9 =>
				ABCDE <= "00000";
				Qn <= T10; 
				
			when T10 =>
				ABCDE <= "10000"; --
				Qn <= T11;
				
			when T11 =>
				ABCDE <= "00000";
				Qn <= T0;	
				
		end case;
	end process;
end architecture;