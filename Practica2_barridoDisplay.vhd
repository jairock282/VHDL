-------------------------------------------------------------------------------
--
-- Title       : Practica2_barridoDisplay
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Practica2_barridoDisplay.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Control de 4 displays de 7 segmentos multiplexados 
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Practica2_barridoDisplay is 
	
	Port(	
	
		clk : in std_logic := '0'; --Reloj físico 
		rst : in std_logic := '0'; --Reset de emergencia
		vect_in : in std_logic_vector(15 downto 0) := "0001001000110100";	--Vector de entrada|dato a desplegar 
		ctrl : out std_logic_vector(3 downto 0) := (others => '0'); --Controles de activación para los display multiplexados		
		vect_out : out std_logic_vector(7 downto 0) := (others => '0') --Valor a desplegar en los display 
		
	);
end entity;

architecture behaivoral of Practica2_barridoDisplay is

	--Componente para el control de un display de 7 segmentos
	component DecoBCD is
		port(
		
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector( 7 downto 0)
		
		);
	end component;	 
	
	--Base de tiempo
	component TB_50KHz is
		port(
	
		clkIn: in std_logic;
		clkOut: out std_logic
		
		);
	end component;	
	
	--Declaración de estados 
	type Estados is (Disp1, Disp2, Disp3, Disp4, Inicio);
	
	--Inicializamos los estados
	signal Est_Gral : Estados := Inicio;
	
	--Señal de reloj en base de tiempo 50kHz
	signal C : std_logic := '0';					
	
	--Contador
	signal cnt : std_logic_vector(2 downto 0) := (others => '0'); 
	
	--Numero para desplegar en uno de los 4 display
	signal hexaNum : std_logic_vector(3 downto 0) := (others => '0');	
	
begin
	
	--Base de tiempo
	tempo : TB_50KHz port map( clk, C );	
	
	contador : process(C, rst)
	begin 
		
		if(rst = '1')then
			cnt <= "000";
		else
			if(C 'event and C='1') then
				
				if(cnt < "100")then
					cnt <= cnt + 1;
					
				elsif(cnt >= "100")then
					cnt <= "001"; 
					
				end if;
				
			end if;
		end if;
	end process contador;
	
	--Barrido de los Displays
	maquina : process(C, Est_Gral, rst)
	begin
	   
		--Si se acciona "rst" en cualquier momento, Est_gral pasa a Inicio
		if(rst = '1')then
			Est_Gral <= Inicio;
		else   
			
			if(C 'event and C = '1')then
				
				case Est_Gral is  
					--Esta transaccion solo dura un ciclo de reloj físico (clk)
					when Inicio =>	
							Est_Gral <= Disp1; --cnt = 00
					
					--Todas las demas trasacciones van acorde al contador el cual tiene una base de tiempo de 50kHz
					when Disp1 =>
						if(cnt = "001")then
							Est_Gral <= Disp2;
					   	else
							Est_Gral <= Disp1;
						end if;
						  
					when Disp2 =>
						if(cnt = "010")then
							Est_Gral <= Disp3;
						else
							Est_Gral <= Disp2;
						end if;
					
					when Disp3 =>
						if(cnt = "011")then
							Est_Gral <= Disp4;
						else
							Est_Gral <= Disp3;
						end if;	 
						
					when Disp4 =>
						if(cnt = "100")then
							Est_Gral <= Disp1;
						else
							Est_Gral <= Disp4;
						end if;
						
					when others=>
						Est_Gral <= Inicio;	
					
				end case;
			end if;
		end if;
	end process maquina;
	
	--Acciones de cada estado
	--Estas acciones se verificaran en base a nuestro reloj físico(clk)
	--al ser más veloz que el contador, al detectar un cambio de estado se accionará de inmediato
	accion : process(clk, Est_Gral, rst)
	begin
		
		if(rst = '1')then
			ctrl <= "0000";
		else
			
			if(clk 'event and clk = '1')then
				case Est_Gral is
					--Activamos el display a desplegar y obtenemos el valor hexadecimal del digito
					when Disp1 =>
						ctrl <= "1110";	--activamos display 1
						hexaNum <= vect_in(3)&vect_in(2)&vect_in(1)&vect_in(0); --Obtenemos los 4bits necesarios para formar nuestro valor hexa	 
						
					when Disp2 =>
						ctrl <= "1101"; --activamos display 2	
						hexaNum <= vect_in(7)&vect_in(6)&vect_in(5)&vect_in(4); --Obtenemos los 4bits necesarios para formar nuestro valor hexa	
					
					when Disp3 =>
						ctrl <= "1011"; --activamos display 3	
						hexaNum <= vect_in(11)&vect_in(10)&vect_in(9)&vect_in(8); --Obtenemos los 4bits necesarios para formar nuestro valor hexa

					when Disp4 =>
						ctrl <= "0111"; --activamos display 4	 
						hexaNum <= vect_in(15)&vect_in(14)&vect_in(13)&vect_in(12); --Obtenemos los 4bits necesarios para formar nuestro valor hexa

					
					when others =>
						ctrl <= "1111";	--No activamos ningun display

					
				end case;
			end if;
		end if;
	end process accion;
	
	--Asignacion y obtención del digito para el display
	display : DecoBCD port map(hexaNum, vect_out);	   
	
end architecture;

