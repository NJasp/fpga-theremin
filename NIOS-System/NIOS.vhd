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
		I2C_SDATA : INOUT std_logic := '0';
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
		CLOCK_50 : IN std_logic;
		D5M_FVAL, D5M_LVAL, D5M_RESET_N, D5M_PIXLCLK : in STD_LOGIC;
		D5M_D : in STD_LOGIC_VECTOR(11 downto 0)
		);
	END ENTITY NIOS;

	ARCHITECTURE Structure OF NIOS IS

		COMPONENT nios_system
			PORT (
				audio_ADCDAT : IN std_logic := '0'; -- audio.ADCDAT
				audio_ADCLRCK : IN std_logic := '0'; -- .ADCLRCK
				audio_BCLK : IN std_logic := '0'; -- .BCLK
				audio_DACDAT : OUT std_logic; -- .DACDAT
				audio_DACLRCK : IN std_logic := '0'; -- .DACLRCK
				audio_clk_clk : OUT std_logic; -- audio_clk.clk
				audio_pll_ref_clk_clk : IN std_logic := '0'; -- audio_pll_ref_clk.clk
				audio_pll_ref_reset_reset : IN std_logic := '0'; -- audio_pll_ref_reset.reset
				av_config_SDAT : INOUT std_logic := '0'; -- av_config.SDAT
				av_config_SCLK : OUT std_logic; -- .SCLK
				expansion_jp5_export : INOUT std_logic_vector(31 DOWNTO 0) := (OTHERS => '0'); -- expansion_jp5.export
				flash_ADDR : OUT std_logic_vector(22 DOWNTO 0); -- flash.ADDR
				flash_CE_N : OUT std_logic; -- .CE_N
				flash_OE_N : OUT std_logic; -- .OE_N
				flash_WE_N : OUT std_logic; -- .WE_N
				flash_RST_N : OUT std_logic; -- .RST_N
				flash_DQ : INOUT std_logic_vector(7 DOWNTO 0) := (OTHERS => '0'); -- .DQ
				green_leds_export : OUT std_logic_vector(8 DOWNTO 0); -- green_leds.export
				pushbuttons_export : IN std_logic_vector(3 DOWNTO 0) := (OTHERS => '0'); -- pushbuttons.export
				red_leds_export : OUT std_logic_vector(17 DOWNTO 0); -- red_leds.export
				sdram_addr : OUT std_logic_vector(12 DOWNTO 0); -- sdram.addr
				sdram_ba : OUT std_logic_vector(1 DOWNTO 0); -- .ba
				sdram_cas_n : OUT std_logic; -- .cas_n
				sdram_cke : OUT std_logic; -- .cke
				sdram_cs_n : OUT std_logic; -- .cs_n
				sdram_dq : INOUT std_logic_vector(31 DOWNTO 0) := (OTHERS => '0'); -- .dq
				sdram_dqm : OUT std_logic_vector(3 DOWNTO 0); -- .dqm
				sdram_ras_n : OUT std_logic; -- .ras_n
				sdram_we_n : OUT std_logic; -- .we_n
				sdram_clk_clk : OUT std_logic; -- sdram_clk.clk
				serial_port_RXD : IN std_logic := '0'; -- serial_port.RXD
				serial_port_TXD : OUT std_logic; -- .TXD
				slider_switches_export : IN std_logic_vector(17 DOWNTO 0) := (OTHERS => '0'); -- slider_switches.export
				sram_DQ : INOUT std_logic_vector(15 DOWNTO 0) := (OTHERS => '0'); -- sram.DQ
				sram_ADDR : OUT std_logic_vector(19 DOWNTO 0); -- .ADDR
				sram_LB_N : OUT std_logic; -- .LB_N
				sram_UB_N : OUT std_logic; -- .UB_N
				sram_CE_N : OUT std_logic; -- .CE_N
				sram_OE_N : OUT std_logic; -- .OE_N
				sram_WE_N : OUT std_logic; -- .WE_N
				system_pll_ref_clk_clk : IN std_logic := '0'; -- system_pll_ref_clk.clk
				system_pll_ref_reset_reset : IN std_logic := '0'; -- system_pll_ref_reset.reset
				video_ext_1_PIXEL_CLK : in    std_logic                     := '0';
				video_ext_1_LINE_VALID         : in    std_logic                     := '0';             --                     .LINE_VALID
				video_ext_1_FRAME_VALID        : in    std_logic                     := '0';             --                     .FRAME_VALID
				video_ext_1_pixel_clk_reset    : in    std_logic                     := '0';             --                     .pixel_clk_reset
				video_ext_1_PIXEL_DATA         : in    std_logic_vector(11 downto 0) := (others => '0')  --                     .PIXEL_DATA
				);
			END COMPONENT nios_system;

		BEGIN
			U0 : nios_system
			PORT MAP(AUD_ADCDAT, AUD_ADCLRCK, AUD_BCLK, AUD_DACDAT, AUD_DACLRCK, AUD_XCK, CLOCK3_50, KEY(0), I2C_SDATA, I2C_SCLK, GPIO, FL_ADDR, FL_CE_N, FL_OE_N, FL_WE_N, FL_RESET_N, FL_DQ, LEDG, KEY, LEDR, DRAM_ADDR, DRAM_ba, DRAM_cas_n, DRAM_cke, DRAM_cs_n, DRAM_dq, DRAM_dqm, DRAM_ras_n, DRAM_we_n, DRAM_clk, UART_RXD, UART_TXD, SW, SRAM_DQ, SRAM_ADDR, SRAM_LB_N, SRAM_UB_N, SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, CLOCK_50, KEY(0), D5M_PIXLCLK, D5M_LVAL, D5M_FVAL, D5M_RESET_N, D5M_D
			);
END Structure;