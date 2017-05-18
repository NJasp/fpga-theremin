library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cam_detect is
	port(
		clk, reset : in std_logic;
		valid, startofpacket, endofpacket : in std_logic;
		data : in std_logic_vector(23 downto 0);
		xyData : out std_logic_vector(31 downto 0));
end entity cam_detect;

architecture Behaviour of cam_detect is
begin
	-- Info: video_bayer_resampler_0: Change in Resolution: 640 x 480 -> 320 x 240
	process (clk, reset) 
		variable rData, gData, bData : unsigned(7 downto 0);
		variable blackCounter : integer;
		variable xCount, yCount : integer;
		variable packet : std_logic;
			begin
			if reset ='0' then
				xCount := 0; 
				yCount := 0;
				blackCounter := 0;
				packet := '0';
			elsif falling_edge(clk) then
				if valid = '1' and (startofpacket='1' or endofpacket='1') then
					-- make sure its a different pixel
					if (startofpacket='1' and packet='0') or (endofpacket='0' and packet='1') then
						packet := startofpacket;
						rData := unsigned(data (23 downto 16));
						gData := unsigned(data (15 downto 8));
						bData := unsigned(data (7 downto 0));
						
						xCount := xCount+1;
						if xCount >= 320 then
							xCount := 0;
							yCount := yCount+1;
							blackCounter := 0;
							if yCount >= 240 then
								yCount := 0;
							end if;
						end if;
						
						-- check for correct color pixels here
						if rData<=10 and gData<=10 and bData<=10 then
							blackCounter := blackCounter+1;
						else
							blackCounter := 0;
						end if;
						
						-- if 10 or more have been found send through positions of this row
						if blackCounter >= 10 then
							xyData <= std_logic_vector(to_unsigned(xCount, 16))&std_logic_vector(to_unsigned(yCount, 16));
							blackCounter := 0;
						end if;
					end if;
				end if;
			end if;
	end process;
end architecture Behaviour;
