library IEEE;
use ieee.std_logic_1164.all;

entity medioComparador_1bit is
	port(
		A : in std_logic; --Palabra a compararse
		B : in std_logic; --Palabra a compararse	
		G : out std_logic; --Grater than
		E : out std_logic; --Equal
		L : out std_logic  --Less than
	);
end entity;							  

architecture simple of medioComparador_1bit is
begin												   
	
	--Operación para verificar igualdad en las palabras
	E <= ((not(A))and(not(B))) or (A and B);
	--Operación para verificar si A>B
	L <= (not(A)) and (B);
	--Operación para verificar si A<B
	G <= A and (not(B));		
	
end architecture;

