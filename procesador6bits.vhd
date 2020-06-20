-------------------------------------------------------------------------------
--
-- Title       : Procesador de 6bits
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : procesador6bits.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Procesador de 6bits
--
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

entity procesador6bits is
	port(
	
		clk : in std_logic;
		salida : out std_logic_vector(5 downto 0) := (others => '0')
	
	);
end entity;

architecture structural of procesador6bits is

component GCM is
	port(
	
		clk : in std_logic;
		ABCDE : out std_logic_vector(4 downto 0)
	
	);
end component;
 
component contProg2 is	
	generic( 
	
		n : integer := 3 
	);
	port(
	
		clk : in std_logic := '0'; --Reloj físico
		addr : out std_logic_vector(n downto 0) := (others => '0')
	
	);
end component;

component memoriaProgramada is
	port(
	
		cProg : in std_logic_vector(3 downto 0);
		info : out std_logic_vector(5 downto 0)
		
	);
end component;

component FlipFlopD_6bitMap is	 
	
	generic(
	
		n : integer := 5

	);
	
	port(
	
		clk : in std_logic; --Reloj
		rst : in std_logic; --Reset
		LD : in std_logic;	--Load
		D : in std_logic_vector(n downto 0); 
		MQ : out std_logic_vector(n downto 0);
		MQn : out std_logic_vector(n downto 0)
	
	);
	
end component;

component ALU is 
	
	port(
											  --sel(5)|sel(4)|     . . . |sel(0)|    
		sel : 	in std_logic_vector(5 downto 0); --| Cn | M | S3 | S2 | S1 | S0 |
		A,B : 	in std_logic_vector(5 downto 0);							--Menos significativo
		O : 	out std_logic_vector(5 downto 0)
	
	);
end component;


signal pulsoGCM : std_logic_vector(4 downto 0) := (others => '0'); --|cntProg|RegInstru|RegData|RegTemp1|RegTemp2|
signal numCntProg : std_logic_vector(3 downto 0) := (others => '0'); --Digito del contador de programa	
signal RIRD : std_logic_vector(5 downto 0) := (others => '0'); --lectura de registro de memoria programada
signal regIns : std_logic_vector(5 downto 0) := (others => '0'); --Dato para la ALU	 


--ALU
signal regDato : std_logic_vector(5 downto 0) := (others => '0');
signal ALU_B : std_logic_vector(5 downto 0) := (others => '0');
signal SalidaALU : std_logic_vector(5 downto 0) := (others => '0'); --Resultado ALU 

signal Temp1 : std_logic_vector(5 downto 0) := (others => '0'); --Salida registro temp1		



begin  
	
	
	pro_GCM : GCM port map(clk, pulsoGCM); --GCM
	pro_cProg : contProg2 port map(pulsoGCM(4), numCntProg); --contador de Programa	
	
	
	pro_memory : memoriaProgramada port map(numCntProg, RIRD); --Memoria de programa
	
--	Registros instrucciones|datos -> ALU
	pro_regIns : FlipFlopD_6bitMap port map(pulsoGCM(3), '1', '1', RIRD, regIns, open);
	pro_regDato : FlipFlopD_6bitMap port map(pulsoGCM(2), '1', '1', RIRD, regDato, open);  

	
	--ALU			             --Sel| A | B | Salida |
	pro_ALU : ALU port map(regIns, regDato, ALU_B, SalidaALU);
	
	--Registros temporales 1 y 2
	pro_regTemp1 : FlipFlopD_6bitMap port map(pulsoGCM(1), '1', '1',  SalidaALU, Temp1);
	pro_regTemp2 : FlipFlopD_6bitMap port map(pulsoGCM(0), '1', '1',  Temp1, ALU_B); 
	
	--Salida
	salida <= Temp1;
	
	
end architecture;
