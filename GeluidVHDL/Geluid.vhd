library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Geluid is
port (
  CLOCK_50, CLOCK_27 : in std_logic;
  KEY : in std_logic_vector(3 downto 0);
  AUD_ADCDAT : in std_logic;
  AUD_BCLK : inout std_logic;
  AUD_ADCLRCK : inout std_logic;
  AUD_DACLRCK : inout std_logic;
  I2C_SDAT : inout std_logic;
  AUD_XCK : out std_logic;
  AUD_DACDAT : out std_logic;
  I2C_SCLK : out std_logic;
  LEDR : out std_logic_vector(17 downto 0);
  SW : in std_logic_vector(17 downto 0)
);
end Geluid;

architecture behaviour of Geluid is

		COMPONENT Audio_Controller PORT (
			CLOCK_50 : in   std_logic;
			reset : in std_logic;
			clear_audio_in_memory : in std_logic;
			read_audio_in : in std_logic;
			clear_audio_out_memory : in std_logic;
			left_channel_audio_out : in signed(31 downto 0);
			right_channel_audio_out : in signed(31 downto 0);
			write_audio_out : in std_logic;
			AUD_ADCDAT : in std_logic;
			AUD_BCLK	: inout std_logic;
			AUD_ADCLRCK : inout std_logic;	
			AUD_DACLRCK	: inout std_logic;
			audio_in_available : out std_logic;
			left_channel_audio_in : out signed(31 downto 0);
			right_channel_audio_in : out signed(31 downto 0);
			audio_out_allowed : out std_logic;
			AUD_XCK : out std_logic;
			AUD_DACDAT : out std_logic);
		END COMPONENT;
		
        signal	audio_in_available : std_logic;
        signal	left_channel_audio_in : signed(31 downto 0);
        signal	right_channel_audio_in : signed(31 downto 0);
        signal	read_audio_in : std_logic;

        signal	audio_out_allowed : std_logic;
        signal	left_channel_audio_out : signed(31 downto 0);
        signal 	right_channel_audio_out : signed(31 downto 0);
        signal 	write_audio_out : std_logic;
        signal 	sound : signed(31 downto 0);
        signal delay_cnt, delay : signed(18 downto 0);
        signal snd : std_logic := '0';
        signal counter : signed(31 downto 0);
                
        begin
		process(CLOCK_50) 
			begin	
				if rising_edge(CLOCK_50) then
					if  (delay_cnt = delay) then
						delay_cnt <= (others => '0');
						snd <= not snd;
						counter <= counter + 1;
					else
						delay_cnt <= delay_cnt + 1;
						counter <= (others => '0');
					end if;
				end if;
		end process; 
		
		
		delay <= to_signed(262144, delay'length) when key(0) = '0' else
					to_signed(128, delay'length) when key(1) = '0' else
					to_signed(1, delay'length) when key(2) = '0';
		
		sound <= counter when snd = '1' else
					not counter when snd = '0';

		left_channel_audio_out	<= sound;
		right_channel_audio_out	<= sound;
		write_audio_out <= audio_in_available and audio_out_allowed;
		
		LEDR <= SW;
		
		AudioController1 : Audio_Controller port map ( CLOCK_50, SW(0), '0', read_audio_in, '0',
		left_channel_audio_out, right_channel_audio_out, write_audio_out, AUD_ADCDAT, AUD_BCLK, AUD_ADCLRCK, AUD_DACLRCK, 
		audio_in_available, left_channel_audio_in, right_channel_audio_in, audio_out_allowed, AUD_XCK, AUD_DACDAT);
end behaviour;

