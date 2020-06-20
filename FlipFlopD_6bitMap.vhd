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

entity FlipFlopD_6bitMap is	 
	
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
	
end entity;
	
architecture behaivoral of FlipFlopD_6bitMap is

	component FlipFlopD is
		port(
		
			clk : in std_logic; --Clock
			rst : in std_logic;	--Reset
			LD : in std_logic; --Load
			D : in std_logic; --Estados siguiente
			Q : out std_logic; --Estado presente
			Qn : out std_logic	--Estado presente negado
		
		);
	end component; 
	
begin	 
		 

	flipflop0: FlipFlopD port map(clk, rst, LD, D(0), MQ(0), MQn(0));
	flipflop1: FlipFlopD port map(clk, rst, LD, D(1), MQ(1), MQn(1));
	flipflop2: FlipFlopD port map(clk, rst, LD, D(2), MQ(2), MQn(2));
	flipflop3: FlipFlopD port map(clk, rst, LD, D(3), MQ(3), MQn(3));
	flipflop4: FlipFlopD port map(clk, rst, LD, D(4), MQ(4), MQn(4));
	flipflop5: FlipFlopD port map(clk, rst, LD, D(5), MQ(5), MQn(5));
	
end architecture;
