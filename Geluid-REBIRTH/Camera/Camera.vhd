library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Camera is
port (
  D5M_FVAL, D5M_LVAL, D5M_PIXLCLK, D5M_STROBE, CLOCK_50 : in STD_LOGIC;
  D5M_D : in STD_LOGIC_VECTOR(11 downto 0);
  D5M_RESET_N, D5M_SCLK, D5M_TRIGGER : in STD_LOGIC;
  D5M_XCLKIN : out STD_LOGIC;
  LEDR : out STD_LOGIC_VECTOR(11 downto 0);
  D5M_SDATA : inout STD_LOGIC
  
);
end Camera;

architecture behaviour of Camera is
begin
		PROCESS(D5M_PIXLCLK, D5M_RESET_N) 
			begin	
				IF  D5M_RESET_N = '0' then
					LEDR <= (others => '0');
				ELSIF rising_edge(D5M_PIXLCLK) then
					IF  D5M_LVAL = '1' and D5M_FVAL = '1' then
						LEDR <= D5M_D;
					END IF;
				END IF;
		END PROCESS; 
		
		D5M_XCLKIN <= CLOCK_50;
end behaviour;
