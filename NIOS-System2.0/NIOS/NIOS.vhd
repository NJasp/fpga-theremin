LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NIOS IS
	PORT (
		AUD_ADCDAT : IN STD_LOGIC := '0';
		AUD_ADCLRCK : IN STD_LOGIC := '0';
		AUD_BCLK : IN STD_LOGIC := '0';
		AUD_DACDAT : OUT STD_LOGIC := '0';
		AUD_DACLRCK : IN STD_LOGIC := '0';
		AUD_XCK : OUT STD_LOGIC := '0';
		CLOCK3_50 : IN STD_LOGIC;
		I2C_SCLK : OUT std_logic := '0';
		I2C_SDAT : INOUT std_logic := '0';
		GPIO : INOUT std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
		FL_ADDR : OUT std_logic_vector(22 DOWNTO 0);
		FL_CE_N : OUT std_logic;
		FL_OE_N : OUT std_logic;
		FL_WE_N : OUT std_logic;
		FL_RESET_N : OUT std_logic;
		FL_DQ : INOUT std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
		LEDG : OUT std_logic_vector(8 DOWNTO 0); -- green_leds.export
		KEY : IN std_logic_vector(3 DOWNTO 0) := (OTHERS => '0'); -- pushbuttons.export
		LEDR : OUT std_logic_vector(17 DOWNTO 0); -- red_leds.export
		DRAM_ADDR : OUT std_logic_vector(12 DOWNTO 0); -- DRAM.addr
		DRAM_ba : OUT std_logic_vector(1 DOWNTO 0); -- .ba
		DRAM_cas_n : OUT std_logic; -- .cas_n
		DRAM_cke : OUT std_logic; -- .cke
		DRAM_cs_n : OUT std_logic; -- .cs_n
		DRAM_dq : INOUT std_logic_vector(31 DOWNTO 0) := (OTHERS => '0'); -- .dq
		DRAM_dqm : OUT std_logic_vector(3 DOWNTO 0); -- .dqm
		DRAM_ras_n : OUT std_logic; -- .ras_n
		DRAM_we_n : OUT std_logic; -- .we_n
		DRAM_clk : OUT std_logic; -- sdram_clk.clk
		UART_RXD : IN std_logic := '0'; -- serial_port.RXD
		UART_TXD : OUT std_logic; -- .TXD
		SW : IN std_logic_vector(17 DOWNTO 0) := (OTHERS => '0'); -- slider_switches.export
		SRAM_DQ : INOUT std_logic_vector(15 DOWNTO 0) := (OTHERS => '0'); -- sram.DQ
		SRAM_ADDR : OUT std_logic_vector(19 DOWNTO 0); -- .ADDR
		SRAM_LB_N : OUT std_logic; -- .LB_N
		SRAM_UB_N : OUT std_logic; -- .UB_N
		SRAM_CE_N : OUT std_logic; -- .CE_N
		SRAM_OE_N : OUT std_logic; -- .OE_N
		SRAM_WE_N : OUT std_logic; -- .WE_N
		CLOCK_50 : IN std_logic
		);
	END ENTITY NIOS;

	ARCHITECTURE Structure OF NIOS IS
	
	SIGNAL CAMERA_DATA : STD_logic_vector(11 downto 0) := GPIO(13) & GPIO(12) & GPIO(11) & GPIO(10) & GPIO(9) & GPIO(8) & GPIO(7) & GPIO(6) & GPIO(5) & GPIO(4) & GPIO(3) & GPIO(1);

component nios_system is
	port (
		audio_ADCDAT               : in    std_logic                     := '0';             --                audio.ADCDAT
		audio_ADCLRCK              : in    std_logic                     := '0';             --                     .ADCLRCK
		audio_BCLK                 : in    std_logic                     := '0';             --                     .BCLK
		audio_DACDAT               : out   std_logic;                                        --                     .DACDAT
		audio_DACLRCK              : in    std_logic                     := '0';             --                     .DACLRCK
		audio_clk_clk              : out   std_logic;                                        --            audio_clk.clk
		audio_pll_ref_clk_clk      : in    std_logic                     := '0';             --    audio_pll_ref_clk.clk
		audio_pll_ref_reset_reset  : in    std_logic                     := '0';             --  audio_pll_ref_reset.reset
		av_config_SDAT             : inout std_logic                     := '0';             --            av_config.SDAT
		av_config_SCLK             : out   std_logic;                                        --                     .SCLK
		expansion_jp5_export       : inout std_logic_vector(31 downto 0) := (others => '0'); --        expansion_jp5.export
		flash_ADDR                 : out   std_logic_vector(22 downto 0);                    --                flash.ADDR
		flash_CE_N                 : out   std_logic;                                        --                     .CE_N
		flash_OE_N                 : out   std_logic;                                        --                     .OE_N
		flash_WE_N                 : out   std_logic;                                        --                     .WE_N
		flash_RST_N                : out   std_logic;                                        --                     .RST_N
		flash_DQ                   : inout std_logic_vector(7 downto 0)  := (others => '0'); --                     .DQ
		green_leds_export          : out   std_logic_vector(8 downto 0);                     --           green_leds.export
		pushbuttons_export         : in    std_logic_vector(3 downto 0)  := (others => '0'); --          pushbuttons.export
		red_leds_export            : out   std_logic_vector(17 downto 0);                    --             red_leds.export
		sdram_addr                 : out   std_logic_vector(12 downto 0);                    --                sdram.addr
		sdram_ba                   : out   std_logic_vector(1 downto 0);                     --                     .ba
		sdram_cas_n                : out   std_logic;                                        --                     .cas_n
		sdram_cke                  : out   std_logic;                                        --                     .cke
		sdram_cs_n                 : out   std_logic;                                        --                     .cs_n
		sdram_dq                   : inout std_logic_vector(31 downto 0) := (others => '0'); --                     .dq
		sdram_dqm                  : out   std_logic_vector(3 downto 0);                     --                     .dqm
		sdram_ras_n                : out   std_logic;                                        --                     .ras_n
		sdram_we_n                 : out   std_logic;                                        --                     .we_n
		sdram_clk_clk              : out   std_logic;                                        --            sdram_clk.clk
		serial_port_RXD            : in    std_logic                     := '0';             --          serial_port.RXD
		serial_port_TXD            : out   std_logic;                                        --                     .TXD
		slider_switches_export     : in    std_logic_vector(17 downto 0) := (others => '0'); --      slider_switches.export
		sram_DQ                    : inout std_logic_vector(15 downto 0) := (others => '0'); --                 sram.DQ
		sram_ADDR                  : out   std_logic_vector(19 downto 0);                    --                     .ADDR
		sram_LB_N                  : out   std_logic;                                        --                     .LB_N
		sram_UB_N                  : out   std_logic;                                        --                     .UB_N
		sram_CE_N                  : out   std_logic;                                        --                     .CE_N
		sram_OE_N                  : out   std_logic;                                        --                     .OE_N
		sram_WE_N                  : out   std_logic;                                        --                     .WE_N
		system_pll_ref_clk_clk     : in    std_logic                     := '0';             --   system_pll_ref_clk.clk
		system_pll_ref_reset_reset : in    std_logic                     := '0';             -- system_pll_ref_reset.reset
		video_in_PIXEL_CLK         : in    std_logic                     := '0';             --             video_in.PIXEL_CLK
		video_in_LINE_VALID        : in    std_logic                     := '0';             --                     .LINE_VALID
		video_in_FRAME_VALID       : in    std_logic                     := '0';             --                     .FRAME_VALID
		video_in_pixel_clk_reset   : in    std_logic                     := '0';             --                     .pixel_clk_reset
		video_in_PIXEL_DATA        : in    std_logic_vector(11 downto 0) := (others => '0')  --                     .PIXEL_DATA
	);
end component nios_system;

		BEGIN
			U0 : nios_system
			PORT MAP(AUD_ADCDAT, AUD_ADCLRCK, AUD_BCLK, AUD_DACDAT, AUD_DACLRCK, AUD_XCK, CLOCK3_50, KEY(0), I2C_SDAT, I2C_SCLK, GPIO, FL_ADDR, FL_CE_N, FL_OE_N, FL_WE_N, FL_RESET_N, FL_DQ, LEDG, KEY, LEDR, DRAM_ADDR, DRAM_ba, DRAM_cas_n, DRAM_cke, DRAM_cs_n, DRAM_dq, DRAM_dqm, DRAM_ras_n, DRAM_we_n, DRAM_clk, UART_RXD, UART_TXD, SW, SRAM_DQ, SRAM_ADDR, SRAM_LB_N, SRAM_UB_N, SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, CLOCK_50, KEY(0), GPIO(0), GPIO(21), GPIO(22), GPIO(17), CAMERA_DATA
			);
END Structure;