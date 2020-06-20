-------------------------------------------------------------------------------
--
-- Title       : div_freq
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : div_freq.vhd
-- Generated   : Miercoles 25 de Mar 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Selector de bases de tiempo  
--				Inputs
--				Sel(2) -> Selector
--
--				Outputs
--				F1 -> Frecuencia 1
--				F2 -> Frecuencia 2
--				F3 -> Frecuencia 3
--				F4 -> Frecuencia 4
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div_freq is
	generic(
		n : integer := 4	--Funciona como un tipo constante
	);
	
	port(
	
	clk : in std_logic := '0';
	sel : in std_logic_vector(1 downto 0) := (others=>'0');
	f1, f2, f3, f4 : out std_logic := '0'
	
	);							  
end entity;

architecture behavioral of div_freq is

	signal scnt: std_logic_vector(n downto 0) := (others=>'0');
	signal pcnt: std_logic_vector(n downto 0) := (others=>'0');

begin		 
	
	pros1 : process(clk, pcnt, sel) is
	begin
		if clk 'event and clk='1' then	
			
			pcnt <= pcnt + 1;
			
		else	
		
			case sel is		 
				
				when "00" => 
					if (pcnt >= 0) and (pcnt < 1) then
						f1 <= '1';
						f2 <= '0';
						f3 <= '0';
						f4 <= '0';
		
						
					elsif (pcnt >= 1) and (pcnt < 2)then
						f1 <= '0';
						f2 <= '0';
						f3 <= '0';
						f4 <= '0';
						
					else						
						pcnt <= "00000";
						
					end if;	
					
				when "01" => 
					if (pcnt >= 0) and (pcnt < 2) then
						f2 <= '1';	
						f1 <= '0';
						f3 <= '0';
						f4 <= '0';
		
		
						
					elsif (pcnt >= 2) and (pcnt < 4)then
						f2 <= '0';	
						f1 <= '0';
						f3 <= '0';
						f4 <= '0';
		

					else						
						pcnt <= "00000";
						
					end if;	
					
				when "10" => 
					if (pcnt >= 0) and (pcnt < 3) then
						f3 <= '1';	
						f1 <= '0';
						f2 <= '0';
						f4 <= '0';
		
						
					elsif (pcnt >= 3) and (pcnt < 5)then
						f3 <= '0';	
						f1 <= '0';
						f2 <= '0';
						f4 <= '0';
		

					else						
						pcnt <= "00000";
						
					end if;	
					
				when others =>
					if (pcnt >= 0) and (pcnt < 5) then
						f4 <= '1';	
						f1 <= '0';
						f2 <= '0';
						f3 <= '0';
		
						
					elsif (pcnt >= 5) and (pcnt < 10)then
						f4 <= '0';	
						f1 <= '0';
						f2 <= '0';
						f3 <= '0';
		

					else						
						pcnt <= "00000";
						
					end if;
				
				end case;
				
			end if;	   
		
	end process; 
			
end architecture;
