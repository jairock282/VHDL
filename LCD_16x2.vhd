-------------------------------------------------------------------------------
--
-- Title       : LCD 16x2
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : LCD_16x2.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Driver para una pantalla LCD 16x2
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LCD_16X2 is
	port(
	
		clk			:	in	std_logic;
		getData		:	in std_logic_vector(7 downto 0);
		ms			:	in	std_logic; --0 = 4bits | 1 = 8bits
		rs, rw		:	out	std_logic;
		DB			:	inout	std_logic_vector(7 downto 0) -- | DB7 | DB6 | ... | DB1 | DB0 |
	
	);
end entity;

architecture behaivoral of LCD_16X2 is

type estados is (CLEARD, RETURNH, ENTRYMS, DISPLAYC, CURSORDS, FUNCTIONS, SETCGRAM, WRITECGRAM, READBF, DATA);
signal epres, esig, euins: estados;
signal dataPres, dataSig : std_logic_vector(7 downto 0);
--Estado actual, Estado siguiente, Estado del que proviene

signal flag : std_logic := '0'; --dira que nibble enviar(0:MasSign 1:MenosSign)

begin
	
	comb : process( clk )
	begin
		
		if clk 'event and clk = '1' then
			epres <= esig;
		end if;
		
	end process;
	
	seq : process( epres )
	begin	   
		
		case epres is 
			
			when CLEARD =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"01";
					esig <= RETURNH;
					
				else 
					euins <= CLEARD; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"00"; -- 0000 XXXX
						esig <= READBF;	
						
					else
						db <= X"10"; -- 0001 XXXX
						esig <= RETURNH;
						
					end if;
				end if;	 
				
			when RETURNH =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"02";
					esig <= ENTRYMS;
				else 
					euins <= RETURNH; --Determina de que estado proviene
					
					if flag = '0' then
						db <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else
						db <= X"20"; -- 0010 XXXX 
						esig <= ENTRYMS;
					end if;
				end if;	
				
			when ENTRYMS =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"04";
					esig <= DISPLAYC;
				else 
					euins <= ENTRYMS; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else
						db <= X"40"; -- 0100 XXXX 
						esig <= DISPLAYC;
					end if;
				end if;
				
			when DISPLAYC =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"08";
					esig <= CURSORDS;
				else 
					euins <= DISPLAYC; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else
						db <= X"80"; -- 1000 XXXX 
						esig <= CURSORDS;
					end if;
				end if;
				
			when CURSORDS =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"10";
					esig <= FUNCTIONS;
				else 
					euins <= CURSORDS; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"10"; -- 0001 XXXX
						esig <= READBF;
					else
						db <= X"00"; -- 0000 XXXX 
						esig <= FUNCTIONS;
					end if;
				end if;	
				
			when FUNCTIONS =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"20";
					esig <= SETCGRAM;
				else 
					euins <= FUNCTIONS; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"20"; -- 0010 XXXX
						esig <= READBF;
					else
						db <= X"00"; -- 0000 XXXX 
						esig <= SETCGRAM;
					end if;
				end if;	
				
			when SETCGRAM =>	
				rs <= '0';
				rw <= '0';
				
				if ms = '1' then --8bits
					db <= X"40";
					esig <= WRITECGRAM;
				else 
					euins <= SETCGRAM; --Determina de que estado proviene	
					if flag = '0' then
						db <= X"40"; -- 0000 XXXX
						esig <= READBF;
					else
						db <= X"00"; -- 0001 XXXX 
						esig <= WRITECGRAM;
					end if;
				end if;	
				
			when WRITECGRAM =>	
				rs <= '1';
				rw <= '0';
				
				if ms = '1' then --8bits  
					db <= getData;
					esig <= DATA;
					
				else 
					euins <= WRITECGRAM; --Determina de que estado proviene	
					if flag = '0' then 
						
						db <= getData(7)&getData(6)&getData(5)&getData(4)&"XXXX"; -- 0000 XXXX
						esig <= READBF;
						
					else 
						db <= getData(3)&getData(2)&getData(1)&getData(0)&"XXXX"; -- 0001 XXXX
						esig <= WRITECGRAM;
						
					end if;
				end if;
			
			when DATA => 
			
				rs <= '1';
				rw <= '0';
				
				if ms = '1' then --8bits  
					db <= getData;
					esig <= WRITECGRAM;
					
				else 
					euins <= DATA; --Determina de que estado proviene	
					if flag = '0' then 
						
						db <= getData(7)&getData(6)&getData(5)&getData(4)&"XXXX"; -- 0000 XXXX
						esig <= READBF;
						
					else 
						db <= getData(3)&getData(2)&getData(1)&getData(0)&"XXXX"; -- 0001 XXXX
						esig <= WRITECGRAM;
						
					end if;
				end if;
				
				
			when others =>
				if DB(7) = '0' then --Leemos nuestra bandera, si esta en 0
					esig <= euins; --Volvemos al estado desde donde se leyó la BF
					
				else
					esig <= READBF; --Se mantiene en la lectura de la bandera
					
				end if;
		end case;
	end process; 
	
end architecture;
