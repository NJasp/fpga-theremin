library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cam_detect is
	port(
		clk, reset, rgbvalid, xyvalid : in std_logic;
		Red, Green, Blue : in std_logic_vector(11 downto 0);
		xinput, yinput : in std_logic_vector(15 downto 0);
		xyData : out std_logic_vector(31 downto 0)
		);
end entity cam_detect;

architecture Behaviour of cam_detect is
begin
	process (clk, reset) 
	
	variable sred, sgreen, sblue, avgcolor : integer;
	variable found : std_logic;
	variable sxinput : std_logic_vector(15 downto 0);
	variable syinput : std_logic_vector(15 downto 0);
	variable xysend : std_logic_vector(31 downto 0);	

			begin	
			if reset ='0' then
				sxinput := "0000000110010000";
				syinput := "0000000100101100";
				avgcolor := 0;
				found := '0';
			elsif rising_edge(clk) then
				if xyvalid = '1' then
					if(yinput = "0000000000000000") then
						found := '0';
					end if;
					sxinput := xinput;
					syinput := yinput;
				end if;
				if rgbvalid = '1' then
					sred := to_integer(unsigned(Red));
					sgreen := to_integer(unsigned(Green));
					sblue := to_integer(unsigned(Blue));
					avgcolor := ((sred+sgreen+sblue)/3);
				end if;
				if(avgcolor > 255 and found = '0') then
					xysend := sxinput & syinput;
					found := '1';
				end if;
			end if;
			xyData <= xysend;
	end process;
end architecture Behaviour;