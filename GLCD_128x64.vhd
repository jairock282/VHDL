-------------------------------------------------------------------------------
--
-- Title       : GLCD 128x64
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : GLCD_128x64.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Driver para una pantalla GLCD 128x64
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity GLCD_128x64 is
	port(
	
		clk 	: in std_logic; --Reloj Físico
		rst 	: in std_logic := '1'; --Reset General
		RS 		: inout std_logic := '0'; --RS
		RW 		: out std_logic := '0'; --RW
		CS1 	: out std_logic := '1'; --Chip1
		CS2 	: out std_logic := '1'; --Chip2
		DB		: out std_logic_vector(7 downto 0) := "00111111" --Datos
	
	);
end entity;

architecture behaivoral of GLCD_128x64 is 

type estados is (DISP, SET_Y, SET_X, WRITE);

signal epres, esig : estados;	

signal start : std_logic := '0'; --Señal para determinar el inicio del conteo de las direcciones de Y 
signal changePage : std_logic := '0'; --Señal para determinar el cambio de página
signal cntX : std_logic_vector(2 downto 0) := (others => '0'); --Paginas	
signal cntY : std_logic_vector(6 downto 0) := (others => '0'); --Direcciones en Y	

begin 
	
	--Contadores de las páginas en X (0-7) y de los 64 espacios en Y
	contadores: process(clk)
	begin
		if(rst = '0')then
			
			cntX <= (others => '0');
			cntY <= (others => '0');
			
		else
			 if(clk 'event and clk = '1')then
				if(start = '1')then
					if(cntY < "1000000")then	
						changePage <= '0';
						cntY <= cntY + 1;
					else  
						changePage <= '1'; --Se determina que hubo un cambio de página
						cntX <= cntX + 1;
						cntY <= (others => '0');
						
					end if;
				end if;	 
			end if;
		end if;
		
	end process contadores;
	
	--Asignación de estado de la máquina de estados
	comb : process( clk )
	begin
		
		if clk 'event and clk = '1' then
			if( rst = '1')then
				epres <= esig;
			else
				epres <= DISP;
			end if;
		end if;
		
	end process;
	
	--Secuencia de asignación y envió de comandos en la máquina de estados
	seq : process( epres, changePage )
	begin	   
		case epres is 
			
			--Estado de Encendido del Display
			when DISP =>	
				RS <= '0';
				RW <= '0';
				DB <= "00111111"; --Comando
				esig <= SET_Y; 
			
			--Definición de la dirección de inicio de Y
			when SET_Y =>	
				RS <= '0';
				RW <= '0';
				DB <= "01000000"; --Y = 0;
				esig <= SET_X;	 
			
			--Definición de la direccion de inicio de X
			when SET_X =>
				RS <= '0';
				RW <= '0';
				start <= '1'; 
				DB <= "10111"&cntX;	
				esig <= WRITE;	
			
			--Estado de escritura, se manda la combinación de pixeles a encender
			when others =>
				if(changePage = '0')then
					RS <= '1';
					RW <= '0'; 
					
					--Memoria de programa, por cada paginación una combinación distinta de pixeles
					case cntX is
						when "000" =>
							DB <= "11001100";
						when "001" =>
							DB <= "11100011";
						when "010" =>
							DB <= "11110000";
						when "011" =>
							DB <= "00001111";
						when "100" =>
							DB <= "11101110";
						when "101" =>
							DB <= "00010001";
						when "110" =>
							DB <= "00000000";
						when others =>
							DB <= "11111111";
					end case;			
					esig <= WRITE;
			
				else   
					start <= '0';
					esig <= SET_X;
					
				end if;
		end case;
			
	end process seq; 
	
end architecture;
