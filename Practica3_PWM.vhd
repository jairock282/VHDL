-------------------------------------------------------------------------------
--
-- Title       : Practica3_PWM
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : H:\Universidad\activeHDL\DPROG_2020\DPROG_2020\CLASE2020\src\Practica3_PWM.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Generador de ancho de pulso PWM
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Practica3_PWM is	
	generic(
		P : integer := 4 --Periodo PWM cuatro peridos de reloj fisico
	);
	port(
	
		clk : in std_logic := '0'; --Reloj físico
		dc : in std_logic_vector(1 downto 0) := (others => '0'); --Selector de porcentaje de ciclo de trabajo
		pwm : out std_logic := '0'; --Salida PWM
		

		rst : in std_logic := '0'
	
	);
end entity;

architecture behaivoral of Practica3_PWM is	  

	--Declaración de estados 
	type Estados is (duty1, duty2, duty3, duty4, Inicio); 
	
	--Inicializamos los estados
	signal Est_Gral : Estados := Inicio;
	
	--Contador de ciclos de trabajo
	--El periodo del PWM es de 80ns, si nuestro reloj fisico a 50MHz tiene un perido de 20ns
	--4 periodos de nuestro reloj equivale a 1 peridodo de nuestro PWM
	signal cnt : std_logic_vector(2 downto 0) := (others => '0');
	
begin
	
	--Maquina de estados
	maquina : process(clk, Est_Gral, dc, rst)
	begin
		
		if(rst = '1')then
			Est_Gral <= Inicio;
		else
			
			if( clk 'event and clk = '1' )then
				
				case Est_Gral is   
					
					when Inicio =>	 
					
						if( dc = "00")then
							Est_Gral <= duty1;
							
						elsif(dc = "01")then
							Est_Gral <= duty2;
							
						elsif(dc = "10")then
							Est_Gral <= duty3;
							
						elsif(dc = "11")then
							Est_Gral <= duty4;
							
						else
							Est_Gral <= Inicio;
						end if;	
						
					when duty1 => --25%
					
						if(dc = "01")then
							Est_Gral <= duty2;
							
						elsif(dc = "10")then
							Est_Gral <= duty3;
							
						elsif(dc = "11")then
							Est_Gral <= duty4;
							
						else
							Est_Gral <= duty1;
						end if;	
						
					when duty2 => --%50
					
						if(dc = "00")then
							Est_Gral <= duty1;
							
						elsif(dc = "10")then
							Est_Gral <= duty3;
							
						elsif(dc = "11")then
							Est_Gral <= duty4;
							
						else
							Est_Gral <= duty2;
						end if;
						
					when duty3 => --%75
					
						if(dc = "00")then
							Est_Gral <= duty1;
							
						elsif(dc = "01")then
							Est_Gral <= duty2;
							
						elsif(dc = "11")then
							Est_Gral <= duty4;
							
						else
							Est_Gral <= duty3;
						end if;
						
					when duty4 => --%100
					
						if(dc = "00")then
							Est_Gral <= duty1;
							
						elsif(dc = "01")then
							Est_Gral <= duty2;
							
						elsif(dc = "10")then
							Est_Gral <= duty4;
							
						else
							Est_Gral <= duty4;
						end if;
						
					when others =>
						Est_Gral <= Inicio;
					
				end case;
			end if;
		end if;	
	end process maquina;
	
	contador : process(clk, rst)
	begin
		if(rst = '1')then
			cnt <= "000";
		else
			if(clk 'event and clk = '1')then
				if( cnt < P)then
					cnt <= cnt + 1;
					
				else
					cnt <= "001";
					
				end if;
			end if;
		end if;
	end process contador;
	
	accion : process(clk, Est_gral, rst)
	begin			   
		
		if( clk 'event and clk = '1' )then 
			case Est_gral is

				when duty1 =>	   

					if(cnt <= 1)then --%25 DutyCycle
					 	
						pwm <= '1';						
						
					elsif(cnt <= 4)then
						
						pwm <= '0';
						
					end if;
					
				when duty2 =>

					if(cnt <= 2)then --%50 DutyCycle
					 	
						pwm <= '1';
						
					elsif(cnt <= 4)then
						
						pwm <= '0';
						
					end if;
				
				when duty3 =>
		
					if(cnt <= 3)then --%75 DutyCycle
					 	
						pwm <= '1';
						
					elsif(cnt <= 4)then
						
						pwm <= '0';
						
					end if;
					
				when duty4 =>
					pwm <= '1'; --%100 DutyCycle

				
				when others =>
					pwm <= '-'; --%100 DutyCycle

				
			end case;
		end if;
	end process accion;
end architecture;