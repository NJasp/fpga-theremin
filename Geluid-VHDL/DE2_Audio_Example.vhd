library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DE2_Audio_Example is
  generic(step      : integer := 1;
  CLKspeed    : integer := 50000000);  -- Hz
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
  SW : in std_logic_vector(17 downto 0);
  SIN_DATA    : out   std_logic_vector(13 DOWNTO 0)
);
end DE2_Audio_Example;

architecture behaviour of DE2_Audio_Example is

		COMPONENT Audio_Controller PORT (
			CLOCK_50 : in   std_logic;
			reset : in std_logic;
			clear_audio_in_memory : in std_logic;
			read_audio_in : in std_logic;
			clear_audio_out_memory : in std_logic;
			left_channel_audio_out : in signed(13 downto 0);
			right_channel_audio_out : in signed(13 downto 0);
			write_audio_out : in std_logic;
			AUD_ADCDAT : in std_logic;
			AUD_BCLK	: inout std_logic;
			AUD_ADCLRCK : inout std_logic;	
			AUD_DACLRCK	: inout std_logic;
			audio_in_available : out std_logic;
			left_channel_audio_in : out signed(13 downto 0);
			right_channel_audio_in : out signed(13 downto 0);
			audio_out_allowed : out std_logic;
			AUD_XCK : out std_logic;
			AUD_DACDAT : out std_logic);
		END COMPONENT;
		
signal	audio_in_available : std_logic;
signal	left_channel_audio_in : signed(13 downto 0);
signal	right_channel_audio_in : signed(13 downto 0);
signal	read_audio_in : std_logic;

signal	audio_out_allowed : std_logic;
signal	left_channel_audio_out : signed(13 downto 0);
signal 	right_channel_audio_out : signed(13 downto 0);
signal 	write_audio_out : std_logic;
signal 	sound : signed(13 downto 0);
signal delay_cnt, delay : signed(18 downto 0);
signal snd : std_logic := '0';

------------------------------------------------------------------------
  signal sin_out_tmp    : signed(13 DOWNTO 0);
  signal acc      : unsigned(8 DOWNTO 0);   -- 9 BIT accumulator
  signal clk_cnt, clk_step  : unsigned (25 downto 0) := (others => '0');
------------------------------------------------------------------------
		
begin
--		process(CLOCK_50) 
--			begin	
--				if rising_edge(CLOCK_50) then
--					if  (delay_cnt = delay) then
--						snd <= not snd;
--						delay_cnt <= (others => '0');
--					else 
--						delay_cnt <= delay_cnt + 1;
--					end if;
--				end if;
--		end process; 
--		
--		delay <= "0000000100000000000";
		
-------------------------------------------------------------------------		
  step_counter : process(KEY(1),KEY(2),KEY(0))
  begin
    if  KEY(0) = '0' then
      clk_step <= to_unsigned(step-1, 26);  
    elsif  KEY(1) = '0' then -- if set button is pushed
      if  clk_step >= to_unsigned(CLKspeed-1, 26) then
        clk_step <= to_unsigned(step-1, 26);
      else
        clk_step <= clk_step + step;
      end if;
    elsif  KEY(2) = '0' then -- if set button is pushed
      if  clk_step <= to_unsigned(step-1, 26) then
        clk_step <= to_unsigned(step-1, 26);
      else
        clk_step <= clk_step - step;
      end if;  
    end if;
  end process step_counter;
  
    accumulator: process(CLOCK_50,clk_step,KEY(0)) begin
    -- reset
    if  KEY(0) = '0' then -- if Reset button is pushed
      clk_cnt <= to_unsigned(0, 26);
      acc <= to_unsigned(0, 9);    
    -- count clock cycle
    elsif falling_edge(CLOCK_50) then
      if  clk_cnt >= clk_step then    -- stepped clock cycle
        clk_cnt <= to_unsigned(0,26);
        -- count accumulator cycle
        if  acc >= to_unsigned(499, 9) then  -- stepped accumulator cycle
          acc <= to_unsigned(0, 9);
        else
          acc <= acc + 1;
        end if;
      else
        clk_cnt <= clk_cnt + 1;
      end if;
    end if;
  end process accumulator;

		  process(acc) begin
    case acc is
      when "000000000" => sin_out_tmp <= "10000000000000";
      when "000000001" => sin_out_tmp <= "10000001100110";
      when "000000010" => sin_out_tmp <= "10000011001101";
      when "000000011" => sin_out_tmp <= "10000100110100";
      when "000000100" => sin_out_tmp <= "10000110011011";
      when "000000101" => sin_out_tmp <= "10001000000010";
      when "000000110" => sin_out_tmp <= "10001001101001";
      when "000000111" => sin_out_tmp <= "10001011001111";
      when "000001000" => sin_out_tmp <= "10001100110110";
      when "000001001" => sin_out_tmp <= "10001110011100";
      when "000001010" => sin_out_tmp <= "10010000000010";
      when "000001011" => sin_out_tmp <= "10010001101000";
      when "000001100" => sin_out_tmp <= "10010011001110";
      when "000001101" => sin_out_tmp <= "10010100110100";
      when "000001110" => sin_out_tmp <= "10010110011001";
      when "000001111" => sin_out_tmp <= "10010111111110";
      when "000010000" => sin_out_tmp <= "10011001100011";
      when "000010001" => sin_out_tmp <= "10011011001000";
      when "000010010" => sin_out_tmp <= "10011100101101";
      when "000010011" => sin_out_tmp <= "10011110010001";
      when "000010100" => sin_out_tmp <= "10011111110101";
      when "000010101" => sin_out_tmp <= "10100001011000";
      when "000010110" => sin_out_tmp <= "10100010111011";
      when "000010111" => sin_out_tmp <= "10100100011110";
      when "000011000" => sin_out_tmp <= "10100110000001";
      when "000011001" => sin_out_tmp <= "10100111100011";
      when "000011010" => sin_out_tmp <= "10101001000101";
      when "000011011" => sin_out_tmp <= "10101010100110";
      when "000011100" => sin_out_tmp <= "10101100000111";
      when "000011101" => sin_out_tmp <= "10101101100111";
      when "000011110" => sin_out_tmp <= "10101111000111";
      when "000011111" => sin_out_tmp <= "10110000100110";
      when "000100000" => sin_out_tmp <= "10110010000101";
      when "000100001" => sin_out_tmp <= "10110011100100";
      when "000100010" => sin_out_tmp <= "10110101000010";
      when "000100011" => sin_out_tmp <= "10110110011111";
      when "000100100" => sin_out_tmp <= "10110111111100";
      when "000100101" => sin_out_tmp <= "10111001011000";
      when "000100110" => sin_out_tmp <= "10111010110100";
      when "000100111" => sin_out_tmp <= "10111100001111";
      when "000101000" => sin_out_tmp <= "10111101101010";
      when "000101001" => sin_out_tmp <= "10111111000100";
      when "000101010" => sin_out_tmp <= "11000000011101";
      when "000101011" => sin_out_tmp <= "11000001110110";
      when "000101100" => sin_out_tmp <= "11000011001101";
      when "000101101" => sin_out_tmp <= "11000100100101";
      when "000101110" => sin_out_tmp <= "11000101111011";
      when "000101111" => sin_out_tmp <= "11000111010001";
      when "000110000" => sin_out_tmp <= "11001000100110";
      when "000110001" => sin_out_tmp <= "11001001111011";
      when "000110010" => sin_out_tmp <= "11001011001110";
      when "000110011" => sin_out_tmp <= "11001100100001";
      when "000110100" => sin_out_tmp <= "11001101110011";
      when "000110101" => sin_out_tmp <= "11001111000101";
      when "000110110" => sin_out_tmp <= "11010000010101";
      when "000110111" => sin_out_tmp <= "11010001100101";
      when "000111000" => sin_out_tmp <= "11010010110100";
      when "000111001" => sin_out_tmp <= "11010100000010";
      when "000111010" => sin_out_tmp <= "11010101001111";
      when "000111011" => sin_out_tmp <= "11010110011011";
      when "000111100" => sin_out_tmp <= "11010111100111";
      when "000111101" => sin_out_tmp <= "11011000110010";
      when "000111110" => sin_out_tmp <= "11011001111011";
      when "000111111" => sin_out_tmp <= "11011011000100";
      when "001000000" => sin_out_tmp <= "11011100001100";
      when "001000001" => sin_out_tmp <= "11011101010011";
      when "001000010" => sin_out_tmp <= "11011110011001";
      when "001000011" => sin_out_tmp <= "11011111011110";
      when "001000100" => sin_out_tmp <= "11100000100010";
      when "001000101" => sin_out_tmp <= "11100001100101";
      when "001000110" => sin_out_tmp <= "11100010100111";
      when "001000111" => sin_out_tmp <= "11100011101000";
      when "001001000" => sin_out_tmp <= "11100100101000";
      when "001001001" => sin_out_tmp <= "11100101100111";
      when "001001010" => sin_out_tmp <= "11100110100110";
      when "001001011" => sin_out_tmp <= "11100111100011";
      when "001001100" => sin_out_tmp <= "11101000011111";
      when "001001101" => sin_out_tmp <= "11101001011001";
      when "001001110" => sin_out_tmp <= "11101010010011";
      when "001001111" => sin_out_tmp <= "11101011001100";
      when "001010000" => sin_out_tmp <= "11101100000100";
      when "001010001" => sin_out_tmp <= "11101100111010";
      when "001010010" => sin_out_tmp <= "11101101110000";
      when "001010011" => sin_out_tmp <= "11101110100100";
      when "001010100" => sin_out_tmp <= "11101111011000";
      when "001010101" => sin_out_tmp <= "11110000001010";
      when "001010110" => sin_out_tmp <= "11110000111011";
      when "001010111" => sin_out_tmp <= "11110001101011";
      when "001011000" => sin_out_tmp <= "11110010011001";
      when "001011001" => sin_out_tmp <= "11110011000111";
      when "001011010" => sin_out_tmp <= "11110011110011";
      when "001011011" => sin_out_tmp <= "11110100011111";
      when "001011100" => sin_out_tmp <= "11110101001001";
      when "001011101" => sin_out_tmp <= "11110101110010";
      when "001011110" => sin_out_tmp <= "11110110011001";
      when "001011111" => sin_out_tmp <= "11110111000000";
      when "001100000" => sin_out_tmp <= "11110111100101";
      when "001100001" => sin_out_tmp <= "11111000001001";
      when "001100010" => sin_out_tmp <= "11111000101100";
      when "001100011" => sin_out_tmp <= "11111001001110";
      when "001100100" => sin_out_tmp <= "11111001101110";
      when "001100101" => sin_out_tmp <= "11111010001101";
      when "001100110" => sin_out_tmp <= "11111010101011";
      when "001100111" => sin_out_tmp <= "11111011001000";
      when "001101000" => sin_out_tmp <= "11111011100011";
      when "001101001" => sin_out_tmp <= "11111011111110";
      when "001101010" => sin_out_tmp <= "11111100010111";
      when "001101011" => sin_out_tmp <= "11111100101110";
      when "001101100" => sin_out_tmp <= "11111101000101";
      when "001101101" => sin_out_tmp <= "11111101011010";
      when "001101110" => sin_out_tmp <= "11111101101110";
      when "001101111" => sin_out_tmp <= "11111110000001";
      when "001110000" => sin_out_tmp <= "11111110010010";
      when "001110001" => sin_out_tmp <= "11111110100010";
      when "001110010" => sin_out_tmp <= "11111110110001";
      when "001110011" => sin_out_tmp <= "11111110111110";
      when "001110100" => sin_out_tmp <= "11111111001011";
      when "001110101" => sin_out_tmp <= "11111111010110";
      when "001110110" => sin_out_tmp <= "11111111011111";
      when "001110111" => sin_out_tmp <= "11111111101000";
      when "001111000" => sin_out_tmp <= "11111111101111";
      when "001111001" => sin_out_tmp <= "11111111110101";
      when "001111010" => sin_out_tmp <= "11111111111001";
      when "001111011" => sin_out_tmp <= "11111111111100";
      when "001111100" => sin_out_tmp <= "11111111111110";
      when "001111101" => sin_out_tmp <= "11111111111111";
      when "001111110" => sin_out_tmp <= "11111111111110";
      when "001111111" => sin_out_tmp <= "11111111111100";
      when "010000000" => sin_out_tmp <= "11111111111001";
      when "010000001" => sin_out_tmp <= "11111111110101";
      when "010000010" => sin_out_tmp <= "11111111101111";
      when "010000011" => sin_out_tmp <= "11111111101000";
      when "010000100" => sin_out_tmp <= "11111111011111";
      when "010000101" => sin_out_tmp <= "11111111010110";
      when "010000110" => sin_out_tmp <= "11111111001011";
      when "010000111" => sin_out_tmp <= "11111110111110";
      when "010001000" => sin_out_tmp <= "11111110110001";
      when "010001001" => sin_out_tmp <= "11111110100010";
      when "010001010" => sin_out_tmp <= "11111110010010";
      when "010001011" => sin_out_tmp <= "11111110000001";
      when "010001100" => sin_out_tmp <= "11111101101110";
      when "010001101" => sin_out_tmp <= "11111101011010";
      when "010001110" => sin_out_tmp <= "11111101000101";
      when "010001111" => sin_out_tmp <= "11111100101110";
      when "010010000" => sin_out_tmp <= "11111100010111";
      when "010010001" => sin_out_tmp <= "11111011111110";
      when "010010010" => sin_out_tmp <= "11111011100011";
      when "010010011" => sin_out_tmp <= "11111011001000";
      when "010010100" => sin_out_tmp <= "11111010101011";
      when "010010101" => sin_out_tmp <= "11111010001101";
      when "010010110" => sin_out_tmp <= "11111001101110";
      when "010010111" => sin_out_tmp <= "11111001001110";
      when "010011000" => sin_out_tmp <= "11111000101100";
      when "010011001" => sin_out_tmp <= "11111000001001";
      when "010011010" => sin_out_tmp <= "11110111100101";
      when "010011011" => sin_out_tmp <= "11110111000000";
      when "010011100" => sin_out_tmp <= "11110110011001";
      when "010011101" => sin_out_tmp <= "11110101110010";
      when "010011110" => sin_out_tmp <= "11110101001001";
      when "010011111" => sin_out_tmp <= "11110100011111";
      when "010100000" => sin_out_tmp <= "11110011110011";
      when "010100001" => sin_out_tmp <= "11110011000111";
      when "010100010" => sin_out_tmp <= "11110010011001";
      when "010100011" => sin_out_tmp <= "11110001101011";
      when "010100100" => sin_out_tmp <= "11110000111011";
      when "010100101" => sin_out_tmp <= "11110000001010";
      when "010100110" => sin_out_tmp <= "11101111011000";
      when "010100111" => sin_out_tmp <= "11101110100100";
      when "010101000" => sin_out_tmp <= "11101101110000";
      when "010101001" => sin_out_tmp <= "11101100111010";
      when "010101010" => sin_out_tmp <= "11101100000100";
      when "010101011" => sin_out_tmp <= "11101011001100";
      when "010101100" => sin_out_tmp <= "11101010010011";
      when "010101101" => sin_out_tmp <= "11101001011001";
      when "010101110" => sin_out_tmp <= "11101000011111";
      when "010101111" => sin_out_tmp <= "11100111100011";
      when "010110000" => sin_out_tmp <= "11100110100110";
      when "010110001" => sin_out_tmp <= "11100101100111";
      when "010110010" => sin_out_tmp <= "11100100101000";
      when "010110011" => sin_out_tmp <= "11100011101000";
      when "010110100" => sin_out_tmp <= "11100010100111";
      when "010110101" => sin_out_tmp <= "11100001100101";
      when "010110110" => sin_out_tmp <= "11100000100010";
      when "010110111" => sin_out_tmp <= "11011111011110";
      when "010111000" => sin_out_tmp <= "11011110011001";
      when "010111001" => sin_out_tmp <= "11011101010011";
      when "010111010" => sin_out_tmp <= "11011100001100";
      when "010111011" => sin_out_tmp <= "11011011000100";
      when "010111100" => sin_out_tmp <= "11011001111011";
      when "010111101" => sin_out_tmp <= "11011000110010";
      when "010111110" => sin_out_tmp <= "11010111100111";
      when "010111111" => sin_out_tmp <= "11010110011011";
      when "011000000" => sin_out_tmp <= "11010101001111";
      when "011000001" => sin_out_tmp <= "11010100000010";
      when "011000010" => sin_out_tmp <= "11010010110100";
      when "011000011" => sin_out_tmp <= "11010001100101";
      when "011000100" => sin_out_tmp <= "11010000010101";
      when "011000101" => sin_out_tmp <= "11001111000101";
      when "011000110" => sin_out_tmp <= "11001101110011";
      when "011000111" => sin_out_tmp <= "11001100100001";
      when "011001000" => sin_out_tmp <= "11001011001110";
      when "011001001" => sin_out_tmp <= "11001001111011";
      when "011001010" => sin_out_tmp <= "11001000100110";
      when "011001011" => sin_out_tmp <= "11000111010001";
      when "011001100" => sin_out_tmp <= "11000101111011";
      when "011001101" => sin_out_tmp <= "11000100100101";
      when "011001110" => sin_out_tmp <= "11000011001101";
      when "011001111" => sin_out_tmp <= "11000001110110";
      when "011010000" => sin_out_tmp <= "11000000011101";
      when "011010001" => sin_out_tmp <= "10111111000100";
      when "011010010" => sin_out_tmp <= "10111101101010";
      when "011010011" => sin_out_tmp <= "10111100001111";
      when "011010100" => sin_out_tmp <= "10111010110100";
      when "011010101" => sin_out_tmp <= "10111001011000";
      when "011010110" => sin_out_tmp <= "10110111111100";
      when "011010111" => sin_out_tmp <= "10110110011111";
      when "011011000" => sin_out_tmp <= "10110101000010";
      when "011011001" => sin_out_tmp <= "10110011100100";
      when "011011010" => sin_out_tmp <= "10110010000101";
      when "011011011" => sin_out_tmp <= "10110000100110";
      when "011011100" => sin_out_tmp <= "10101111000111";
      when "011011101" => sin_out_tmp <= "10101101100111";
      when "011011110" => sin_out_tmp <= "10101100000111";
      when "011011111" => sin_out_tmp <= "10101010100110";
      when "011100000" => sin_out_tmp <= "10101001000101";
      when "011100001" => sin_out_tmp <= "10100111100011";
      when "011100010" => sin_out_tmp <= "10100110000001";
      when "011100011" => sin_out_tmp <= "10100100011110";
      when "011100100" => sin_out_tmp <= "10100010111011";
      when "011100101" => sin_out_tmp <= "10100001011000";
      when "011100110" => sin_out_tmp <= "10011111110101";
      when "011100111" => sin_out_tmp <= "10011110010001";
      when "011101000" => sin_out_tmp <= "10011100101101";
      when "011101001" => sin_out_tmp <= "10011011001000";
      when "011101010" => sin_out_tmp <= "10011001100011";
      when "011101011" => sin_out_tmp <= "10010111111110";
      when "011101100" => sin_out_tmp <= "10010110011001";
      when "011101101" => sin_out_tmp <= "10010100110100";
      when "011101110" => sin_out_tmp <= "10010011001110";
      when "011101111" => sin_out_tmp <= "10010001101000";
      when "011110000" => sin_out_tmp <= "10010000000010";
      when "011110001" => sin_out_tmp <= "10001110011100";
      when "011110010" => sin_out_tmp <= "10001100110110";
      when "011110011" => sin_out_tmp <= "10001011001111";
      when "011110100" => sin_out_tmp <= "10001001101001";
      when "011110101" => sin_out_tmp <= "10001000000010";
      when "011110110" => sin_out_tmp <= "10000110011011";
      when "011110111" => sin_out_tmp <= "10000100110100";
      when "011111000" => sin_out_tmp <= "10000011001101";
      when "011111001" => sin_out_tmp <= "10000001100110";
      when "011111010" => sin_out_tmp <= "10000000000000";
      when "011111011" => sin_out_tmp <= "01111110011001";
      when "011111100" => sin_out_tmp <= "01111100110010";
      when "011111101" => sin_out_tmp <= "01111011001011";
      when "011111110" => sin_out_tmp <= "01111001100100";
      when "011111111" => sin_out_tmp <= "01110111111101";
      when "100000000" => sin_out_tmp <= "01110110010110";
      when "100000001" => sin_out_tmp <= "01110100110000";
      when "100000010" => sin_out_tmp <= "01110011001001";
      when "100000011" => sin_out_tmp <= "01110001100011";
      when "100000100" => sin_out_tmp <= "01101111111101";
      when "100000101" => sin_out_tmp <= "01101110010111";
      when "100000110" => sin_out_tmp <= "01101100110001";
      when "100000111" => sin_out_tmp <= "01101011001011";
      when "100001000" => sin_out_tmp <= "01101001100110";
      when "100001001" => sin_out_tmp <= "01101000000001";
      when "100001010" => sin_out_tmp <= "01100110011100";
      when "100001011" => sin_out_tmp <= "01100100110111";
      when "100001100" => sin_out_tmp <= "01100011010010";
      when "100001101" => sin_out_tmp <= "01100001101110";
      when "100001110" => sin_out_tmp <= "01100000001010";
      when "100001111" => sin_out_tmp <= "01011110100111";
      when "100010000" => sin_out_tmp <= "01011101000100";
      when "100010001" => sin_out_tmp <= "01011011100001";
      when "100010010" => sin_out_tmp <= "01011001111110";
      when "100010011" => sin_out_tmp <= "01011000011100";
      when "100010100" => sin_out_tmp <= "01010110111010";
      when "100010101" => sin_out_tmp <= "01010101011001";
      when "100010110" => sin_out_tmp <= "01010011111000";
      when "100010111" => sin_out_tmp <= "01010010011000";
      when "100011000" => sin_out_tmp <= "01010000111000";
      when "100011001" => sin_out_tmp <= "01001111011001";
      when "100011010" => sin_out_tmp <= "01001101111010";
      when "100011011" => sin_out_tmp <= "01001100011011";
      when "100011100" => sin_out_tmp <= "01001010111101";
      when "100011101" => sin_out_tmp <= "01001001100000";
      when "100011110" => sin_out_tmp <= "01001000000011";
      when "100011111" => sin_out_tmp <= "01000110100111";
      when "100100000" => sin_out_tmp <= "01000101001011";
      when "100100001" => sin_out_tmp <= "01000011110000";
      when "100100010" => sin_out_tmp <= "01000010010101";
      when "100100011" => sin_out_tmp <= "01000000111011";
      when "100100100" => sin_out_tmp <= "00111111100010";
      when "100100101" => sin_out_tmp <= "00111110001001";
      when "100100110" => sin_out_tmp <= "00111100110010";
      when "100100111" => sin_out_tmp <= "00111011011010";
      when "100101000" => sin_out_tmp <= "00111010000100";
      when "100101001" => sin_out_tmp <= "00111000101110";
      when "100101010" => sin_out_tmp <= "00110111011001";
      when "100101011" => sin_out_tmp <= "00110110000100";
      when "100101100" => sin_out_tmp <= "00110100110001";
      when "100101101" => sin_out_tmp <= "00110011011110";
      when "100101110" => sin_out_tmp <= "00110010001100";
      when "100101111" => sin_out_tmp <= "00110000111010";
      when "100110000" => sin_out_tmp <= "00101111101010";
      when "100110001" => sin_out_tmp <= "00101110011010";
      when "100110010" => sin_out_tmp <= "00101101001011";
      when "100110011" => sin_out_tmp <= "00101011111101";
      when "100110100" => sin_out_tmp <= "00101010110000";
      when "100110101" => sin_out_tmp <= "00101001100100";
      when "100110110" => sin_out_tmp <= "00101000011000";
      when "100110111" => sin_out_tmp <= "00100111001101";
      when "100111000" => sin_out_tmp <= "00100110000100";
      when "100111001" => sin_out_tmp <= "00100100111011";
      when "100111010" => sin_out_tmp <= "00100011110011";
      when "100111011" => sin_out_tmp <= "00100010101100";
      when "100111100" => sin_out_tmp <= "00100001100110";
      when "100111101" => sin_out_tmp <= "00100000100001";
      when "100111110" => sin_out_tmp <= "00011111011101";
      when "100111111" => sin_out_tmp <= "00011110011010";
      when "101000000" => sin_out_tmp <= "00011101011000";
      when "101000001" => sin_out_tmp <= "00011100010111";
      when "101000010" => sin_out_tmp <= "00011011010111";
      when "101000011" => sin_out_tmp <= "00011010011000";
      when "101000100" => sin_out_tmp <= "00011001011001";
      when "101000101" => sin_out_tmp <= "00011000011100";
      when "101000110" => sin_out_tmp <= "00010111100000";
      when "101000111" => sin_out_tmp <= "00010110100110";
      when "101001000" => sin_out_tmp <= "00010101101100";
      when "101001001" => sin_out_tmp <= "00010100110011";
      when "101001010" => sin_out_tmp <= "00010011111011";
      when "101001011" => sin_out_tmp <= "00010011000101";
      when "101001100" => sin_out_tmp <= "00010010001111";
      when "101001101" => sin_out_tmp <= "00010001011011";
      when "101001110" => sin_out_tmp <= "00010000100111";
      when "101001111" => sin_out_tmp <= "00001111110101";
      when "101010000" => sin_out_tmp <= "00001111000100";
      when "101010001" => sin_out_tmp <= "00001110010100";
      when "101010010" => sin_out_tmp <= "00001101100110";
      when "101010011" => sin_out_tmp <= "00001100111000";
      when "101010100" => sin_out_tmp <= "00001100001100";
      when "101010101" => sin_out_tmp <= "00001011100000";
      when "101010110" => sin_out_tmp <= "00001010110110";
      when "101010111" => sin_out_tmp <= "00001010001101";
      when "101011000" => sin_out_tmp <= "00001001100110";
      when "101011001" => sin_out_tmp <= "00001000111111";
      when "101011010" => sin_out_tmp <= "00001000011010";
      when "101011011" => sin_out_tmp <= "00000111110110";
      when "101011100" => sin_out_tmp <= "00000111010011";
      when "101011101" => sin_out_tmp <= "00000110110001";
      when "101011110" => sin_out_tmp <= "00000110010001";
      when "101011111" => sin_out_tmp <= "00000101110010";
      when "101100000" => sin_out_tmp <= "00000101010100";
      when "101100001" => sin_out_tmp <= "00000100110111";
      when "101100010" => sin_out_tmp <= "00000100011100";
      when "101100011" => sin_out_tmp <= "00000100000001";
      when "101100100" => sin_out_tmp <= "00000011101000";
      when "101100101" => sin_out_tmp <= "00000011010001";
      when "101100110" => sin_out_tmp <= "00000010111010";
      when "101100111" => sin_out_tmp <= "00000010100101";
      when "101101000" => sin_out_tmp <= "00000010010001";
      when "101101001" => sin_out_tmp <= "00000001111110";
      when "101101010" => sin_out_tmp <= "00000001101101";
      when "101101011" => sin_out_tmp <= "00000001011101";
      when "101101100" => sin_out_tmp <= "00000001001110";
      when "101101101" => sin_out_tmp <= "00000001000001";
      when "101101110" => sin_out_tmp <= "00000000110100";
      when "101101111" => sin_out_tmp <= "00000000101001";
      when "101110000" => sin_out_tmp <= "00000000100000";
      when "101110001" => sin_out_tmp <= "00000000010111";
      when "101110010" => sin_out_tmp <= "00000000010000";
      when "101110011" => sin_out_tmp <= "00000000001010";
      when "101110100" => sin_out_tmp <= "00000000000110";
      when "101110101" => sin_out_tmp <= "00000000000011";
      when "101110110" => sin_out_tmp <= "00000000000001";
      when "101110111" => sin_out_tmp <= "00000000000000";
      when "101111000" => sin_out_tmp <= "00000000000001";
      when "101111001" => sin_out_tmp <= "00000000000011";
      when "101111010" => sin_out_tmp <= "00000000000110";
      when "101111011" => sin_out_tmp <= "00000000001010";
      when "101111100" => sin_out_tmp <= "00000000010000";
      when "101111101" => sin_out_tmp <= "00000000010111";
      when "101111110" => sin_out_tmp <= "00000000100000";
      when "101111111" => sin_out_tmp <= "00000000101001";
      when "110000000" => sin_out_tmp <= "00000000110100";
      when "110000001" => sin_out_tmp <= "00000001000001";
      when "110000010" => sin_out_tmp <= "00000001001110";
      when "110000011" => sin_out_tmp <= "00000001011101";
      when "110000100" => sin_out_tmp <= "00000001101101";
      when "110000101" => sin_out_tmp <= "00000001111110";
      when "110000110" => sin_out_tmp <= "00000010010001";
      when "110000111" => sin_out_tmp <= "00000010100101";
      when "110001000" => sin_out_tmp <= "00000010111010";
      when "110001001" => sin_out_tmp <= "00000011010001";
      when "110001010" => sin_out_tmp <= "00000011101000";
      when "110001011" => sin_out_tmp <= "00000100000001";
      when "110001100" => sin_out_tmp <= "00000100011100";
      when "110001101" => sin_out_tmp <= "00000100110111";
      when "110001110" => sin_out_tmp <= "00000101010100";
      when "110001111" => sin_out_tmp <= "00000101110010";
      when "110010000" => sin_out_tmp <= "00000110010001";
      when "110010001" => sin_out_tmp <= "00000110110001";
      when "110010010" => sin_out_tmp <= "00000111010011";
      when "110010011" => sin_out_tmp <= "00000111110110";
      when "110010100" => sin_out_tmp <= "00001000011010";
      when "110010101" => sin_out_tmp <= "00001000111111";
      when "110010110" => sin_out_tmp <= "00001001100110";
      when "110010111" => sin_out_tmp <= "00001010001101";
      when "110011000" => sin_out_tmp <= "00001010110110";
      when "110011001" => sin_out_tmp <= "00001011100000";
      when "110011010" => sin_out_tmp <= "00001100001100";
      when "110011011" => sin_out_tmp <= "00001100111000";
      when "110011100" => sin_out_tmp <= "00001101100110";
      when "110011101" => sin_out_tmp <= "00001110010100";
      when "110011110" => sin_out_tmp <= "00001111000100";
      when "110011111" => sin_out_tmp <= "00001111110101";
      when "110100000" => sin_out_tmp <= "00010000100111";
      when "110100001" => sin_out_tmp <= "00010001011011";
      when "110100010" => sin_out_tmp <= "00010010001111";
      when "110100011" => sin_out_tmp <= "00010011000101";
      when "110100100" => sin_out_tmp <= "00010011111011";
      when "110100101" => sin_out_tmp <= "00010100110011";
      when "110100110" => sin_out_tmp <= "00010101101100";
      when "110100111" => sin_out_tmp <= "00010110100110";
      when "110101000" => sin_out_tmp <= "00010111100000";
      when "110101001" => sin_out_tmp <= "00011000011100";
      when "110101010" => sin_out_tmp <= "00011001011001";
      when "110101011" => sin_out_tmp <= "00011010011000";
      when "110101100" => sin_out_tmp <= "00011011010111";
      when "110101101" => sin_out_tmp <= "00011100010111";
      when "110101110" => sin_out_tmp <= "00011101011000";
      when "110101111" => sin_out_tmp <= "00011110011010";
      when "110110000" => sin_out_tmp <= "00011111011101";
      when "110110001" => sin_out_tmp <= "00100000100001";
      when "110110010" => sin_out_tmp <= "00100001100110";
      when "110110011" => sin_out_tmp <= "00100010101100";
      when "110110100" => sin_out_tmp <= "00100011110011";
      when "110110101" => sin_out_tmp <= "00100100111011";
      when "110110110" => sin_out_tmp <= "00100110000100";
      when "110110111" => sin_out_tmp <= "00100111001101";
      when "110111000" => sin_out_tmp <= "00101000011000";
      when "110111001" => sin_out_tmp <= "00101001100100";
      when "110111010" => sin_out_tmp <= "00101010110000";
      when "110111011" => sin_out_tmp <= "00101011111101";
      when "110111100" => sin_out_tmp <= "00101101001011";
      when "110111101" => sin_out_tmp <= "00101110011010";
      when "110111110" => sin_out_tmp <= "00101111101010";
      when "110111111" => sin_out_tmp <= "00110000111010";
      when "111000000" => sin_out_tmp <= "00110010001100";
      when "111000001" => sin_out_tmp <= "00110011011110";
      when "111000010" => sin_out_tmp <= "00110100110001";
      when "111000011" => sin_out_tmp <= "00110110000100";
      when "111000100" => sin_out_tmp <= "00110111011001";
      when "111000101" => sin_out_tmp <= "00111000101110";
      when "111000110" => sin_out_tmp <= "00111010000100";
      when "111000111" => sin_out_tmp <= "00111011011010";
      when "111001000" => sin_out_tmp <= "00111100110010";
      when "111001001" => sin_out_tmp <= "00111110001001";
      when "111001010" => sin_out_tmp <= "00111111100010";
      when "111001011" => sin_out_tmp <= "01000000111011";
      when "111001100" => sin_out_tmp <= "01000010010101";
      when "111001101" => sin_out_tmp <= "01000011110000";
      when "111001110" => sin_out_tmp <= "01000101001011";
      when "111001111" => sin_out_tmp <= "01000110100111";
      when "111010000" => sin_out_tmp <= "01001000000011";
      when "111010001" => sin_out_tmp <= "01001001100000";
      when "111010010" => sin_out_tmp <= "01001010111101";
      when "111010011" => sin_out_tmp <= "01001100011011";
      when "111010100" => sin_out_tmp <= "01001101111010";
      when "111010101" => sin_out_tmp <= "01001111011001";
      when "111010110" => sin_out_tmp <= "01010000111000";
      when "111010111" => sin_out_tmp <= "01010010011000";
      when "111011000" => sin_out_tmp <= "01010011111000";
      when "111011001" => sin_out_tmp <= "01010101011001";
      when "111011010" => sin_out_tmp <= "01010110111010";
      when "111011011" => sin_out_tmp <= "01011000011100";
      when "111011100" => sin_out_tmp <= "01011001111110";
      when "111011101" => sin_out_tmp <= "01011011100001";
      when "111011110" => sin_out_tmp <= "01011101000100";
      when "111011111" => sin_out_tmp <= "01011110100111";
      when "111100000" => sin_out_tmp <= "01100000001010";
      when "111100001" => sin_out_tmp <= "01100001101110";
      when "111100010" => sin_out_tmp <= "01100011010010";
      when "111100011" => sin_out_tmp <= "01100100110111";
      when "111100100" => sin_out_tmp <= "01100110011100";
      when "111100101" => sin_out_tmp <= "01101000000001";
      when "111100110" => sin_out_tmp <= "01101001100110";
      when "111100111" => sin_out_tmp <= "01101011001011";
      when "111101000" => sin_out_tmp <= "01101100110001";
      when "111101001" => sin_out_tmp <= "01101110010111";
      when "111101010" => sin_out_tmp <= "01101111111101";
      when "111101011" => sin_out_tmp <= "01110001100011";
      when "111101100" => sin_out_tmp <= "01110011001001";
      when "111101101" => sin_out_tmp <= "01110100110000";
      when "111101110" => sin_out_tmp <= "01110110010110";
      when "111101111" => sin_out_tmp <= "01110111111101";
      when "111110000" => sin_out_tmp <= "01111001100100";
      when "111110001" => sin_out_tmp <= "01111011001011";
      when "111110010" => sin_out_tmp <= "01111100110010";
      when "111110011" => sin_out_tmp <= "01111110011001";
      when others => sin_out_tmp <= "00000000000000";
    end case;
  end process;

  sound <= sin_out_tmp;
  
  --------------------------------------------------------------------
		
		read_audio_in <= audio_in_available and audio_out_allowed;
		--left_channel_audio_out	<= left_channel_audio_in + sound;
		--right_channel_audio_out	<= right_channel_audio_in + sound;
		left_channel_audio_out	<= sound;
		right_channel_audio_out	<= sound;
		write_audio_out <= audio_in_available and audio_out_allowed;
		
		LEDR <= SW;
		
		AudioController1 : Audio_Controller port map (
		CLOCK_50,
		SW(0),
		'0',
		read_audio_in,
		'0',
		left_channel_audio_out,
		right_channel_audio_out,
		write_audio_out,
		AUD_ADCDAT,
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,
		audio_in_available,
		left_channel_audio_in,
		right_channel_audio_in,
		audio_out_allowed,
		AUD_XCK,
		AUD_DACDAT
		);
		
		end behaviour;

