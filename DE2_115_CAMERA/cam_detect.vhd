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
	-- Info: video_bayer_resampler_0: Change in Resolution: 640 x 480 -> 320 x 240
	process (clk, reset) 
	
	variable sred : integer;
	variable sgreen : integer;
	variable sblue : integer;	
	variable sxinput : integer;
	variable syinput : integer;
	variable xysend : std_logic_vector(31 downto 0);	
	--variable higherx : integer;
	--variable highery : integer;
	variable lowestavg : integer;
	variable avgcolor : integer;
			begin	
			if reset ='0' then
				sred := 0;
				sgreen := 0;
				sblue := 0;
				--higherx := 0;
				--highery := 0;
				--lowestavg := 5000;
				--avgcolor := 5000;
			elsif rising_edge(clk) then
				if xyvalid = '1' then
					sxinput := to_integer(unsigned(xinput));
					syinput := to_integer(unsigned(yinput));
				end if;
				if rgbvalid = '1' then
					sred := to_integer(unsigned(Red));
					sgreen := to_integer(unsigned(Green));
					sblue := to_integer(unsigned(Blue));
					avgcolor := (sred+sgreen+sblue)/3;
				end if;
--				if sxinput > higherx then
--					higherx := sxinput;
--					xysend(31 downto 16) := std_logic_vector(to_unsigned(sxinput,16));
--				end if;
--				if syinput > highery then
--					highery := syinput;
--					xysend(15 downto 0) := std_logic_vector(to_unsigned(syinput,16));
--				end if;
				if avgcolor < lowestavg then
					lowestavg := avgcolor;
					xysend(31 downto 0) := std_logic_vector(to_unsigned(avgcolor,32));
				end if;			
			end if;
			xyData <= xysend;
	end process;
end architecture Behaviour;