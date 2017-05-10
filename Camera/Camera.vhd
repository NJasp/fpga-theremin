library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;			--	needed for 'unsigned'

entity Camera is
port (
  D5M_FVAL, D5M_LVAL, D5M_PIXLCLK, D5M_STROBE, CLOCK_50 : in STD_LOGIC;
  D5M_D : in STD_LOGIC_VECTOR(11 downto 0);
  D5M_RESET_N, D5M_SCLK, D5M_TRIGGER : in STD_LOGIC;
  D5M_XCLKIN : out STD_LOGIC;
  LEDR : out STD_LOGIC_VECTOR(11 downto 0);
  D5M_SDATA : inout STD_LOGIC;
  HEX0, HEX1, HEX2, HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
  SW : in std_logic_vector(1 downto 0)
  
);
end Camera;

architecture behaviour of Camera is
component decoder is
	PORT (
				hex		: in unsigned(3 DOWNTO 0);		
				display	: OUT	STD_LOGIC_VECTOR(0 TO 6));
end component decoder;

signal num0, num1, num2, num3 : unsigned(3 downto 0);

begin
		PROCESS(D5M_PIXLCLK, D5M_RESET_N)
			variable number, numtemp : unsigned(11 downto 0);
		
			begin	
				IF  D5M_RESET_N = '0' then
					LEDR <= (others => '0');
				ELSIF rising_edge(D5M_PIXLCLK) then
					IF  D5M_LVAL = '1' and D5M_FVAL = '1' then
						if SW(0) = '1' then
							LEDR <= D5M_D;
							number := unsigned(D5M_D);
							numtemp := number/1000;
							num3 <= numtemp(3 downto 0);
							numtemp := (number mod 1000) / 100;
							num2 <= numtemp(3 downto 0);
							numtemp := (number mod 100) / 10;
							num1 <= numtemp(3 downto 0);
							numtemp := number mod 10;
							num0 <= numtemp(3 downto 0);
						end if;
					END IF;
				END IF;
		END PROCESS;
		D5M_XCLKIN <= CLOCK_50;
		decoder0: decoder port map(num0, HEX0);
		decoder1: decoder port map(num1, HEX1);
		decoder2: decoder port map(num2, HEX2);
		decoder3: decoder port map(num3, HEX3);
end behaviour;
