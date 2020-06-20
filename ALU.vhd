-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : CLASE2020
-- Author      : jairock
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Miercoles 15 de Abril 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : ALU
-------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is 
	
	port(
											  --sel(5)|sel(4)|     . . . |sel(0)|    
		sel : 	in std_logic_vector(5 downto 0); --| Cn | M | S3 | S2 | S1 | S0 |
		A,B : 	in std_logic_vector(5 downto 0) := (others => '0');							--Menos significativo
		O : 	out std_logic_vector(5 downto 0)
	
	);
end entity;

architecture simple of ALU is 

	--Señal temporal
	signal temp0 : std_logic_vector(11 downto 0);
	signal temp1 : std_logic_vector(11 downto 0);
	signal temp2 : std_logic_vector(5 downto 0);
	signal temp3 : std_logic_vector(5 downto 0);
	signal temp4 : std_logic_vector(11 downto 0); 
	signal temp5 : std_logic_vector(11 downto 0);
	signal shiftA : std_logic_vector(6 downto 0);

begin
	--Arquitectura simple -> concurrencia | Conditional assignaments | Selection assignaments
	
	temp0 <= A*B;
	temp1 <= A*(not(B));
	temp2 <= A+B;
	temp3 <= A+(not(B));
	temp4 <= temp1(5 downto 0) * temp2;
	temp5 <= temp0 + A;
	shiftA <= A+(A&'0');   
	
--	O <= temp0(5 downto 0);
	
	with sel select	   
	
			--Logicas A  | Cn | M | S3 | S2 | S1 | S0 |	 LISTO
	   O <= not(A) 					when ("110000"), -- 
			not(A or B) 			when ("110001"), --
			((not(A)) and B) 		when ("110010"), --
			(others => '0' )		when ("110011"), --
			not(A and B) 			when ("110100"), --
			not(B) 					when ("110101"), --
			(A xor B) 				when ("110110"), --
			(A and (not(B)))		when ("110111"), -- 
			not(A) or B				when ("111000"), -- 
			not(A xor B)			when ("111001"), --
			B						when ("111010"), --
			A and B					when ("111011"), --
			(others => '1')			when ("111100"), --
			A or (not(B))			when ("111101"), --
			A or B 					when ("111110"), --
			A  						when ("111111"), --
			
			--Aritmeticas A	
			A 						when ("100000"), --
			temp2					when ("100001"), --
			temp3 					when ("100010"), --Se pierden
			"111111"				when ("100011"), --ojo -1?
			A+temp1(5 downto 0)		when ("100100"), --
			temp2+temp1(5 downto 0)	when ("100101"), --
			A-B-1 					when ("100110"), --
			temp0(5 downto 0)-1		when ("100111"), --   
			A+temp0(5 downto 0)		when ("101000"), --
			temp2					when ("101001"), --
			temp3+temp0(5 downto 0)	when ("101010"), --
			temp0(5 downto 0)-1		when ("101011"), --
			shiftA(5 downto 0)		when ("101100"), --
			temp2 + A				when ("101101"), --
			temp3 + A				when ("101110"), --Se pierden (1001110)
			A-1  					when ("101111"), --
			
			--Logicas B  | Cn | M | S3 | S2 | S1 | S0 |
			not(A) 				when ("010000"), -- 
			not(A and B) 		when ("010001"), --
			((not(A)) or B) 	when ("010010"), --
			(others => '1' )	when ("010011"), --
			not(A or B) 		when ("010100"), --
			not(B) 				when ("010101"), --
			not(A xor B) 		when ("010110"), --
			A or (not(B))		when ("010111"), --
			not(A) and B		when ("011000"), --
			not(A xor B)		when ("011001"), --
			B					when ("011010"), --
			A or B				when ("011011"), --
			(others => '0')		when ("011100"), --
			A and (not(B))		when ("011101"), --
			A and B 			when ("011110"), --
			B - A  				when ("011111"), -- 
			
			--Aritmeticas B
			A-1 						when ("000000"), --
			temp0(5 downto 0)-1			when ("000001"), --
			temp3-1 					when ("000010"), --
			(others => '1')				when ("000011"), --
			A+temp3						when ("000100"), --	Perdio(1001110)
			temp0(5 downto 0) + temp3	when ("000101"), -- Perdio(1001110)
			(A-B)-1 					when ("000110"), --
			temp3						when ("000111"), -- Perdio(1000110)
			A+(A+B) 					when ("001000"), --
			A+B							when ("001001"), --
			temp4(5 downto 0)			when ("001010"), -- Perdio(1000101110000)
			A+B							when ("001011"), --
			shiftA(5 downto 0)			when ("001100"), --
			temp5(5 downto 0)			when ("001101"), --
			temp1(5 downto 0) + A 		when ("001110"), --
			A  							when others; --	A
			
end architecture;
