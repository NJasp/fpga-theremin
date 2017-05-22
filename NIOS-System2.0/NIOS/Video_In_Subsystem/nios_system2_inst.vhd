	component nios_system2 is
		port (
			audio_ADCDAT              : in    std_logic                     := 'X';             -- ADCDAT
			audio_ADCLRCK             : in    std_logic                     := 'X';             -- ADCLRCK
			audio_BCLK                : in    std_logic                     := 'X';             -- BCLK
			audio_DACDAT              : out   std_logic;                                        -- DACDAT
			audio_DACLRCK             : in    std_logic                     := 'X';             -- DACLRCK
			audio_clk_clk             : out   std_logic;                                        -- clk
			audio_irq_irq             : out   std_logic;                                        -- irq
			audio_pll_ref_clk_clk     : in    std_logic                     := 'X';             -- clk
			audio_pll_ref_reset_reset : in    std_logic                     := 'X';             -- reset
			audio_reset_reset         : out   std_logic;                                        -- reset
			audio_slave_address       : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			audio_slave_chipselect    : in    std_logic                     := 'X';             -- chipselect
			audio_slave_read          : in    std_logic                     := 'X';             -- read
			audio_slave_write         : in    std_logic                     := 'X';             -- write
			audio_slave_writedata     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			audio_slave_readdata      : out   std_logic_vector(31 downto 0);                    -- readdata
			av_config_SDAT            : inout std_logic                     := 'X';             -- SDAT
			av_config_SCLK            : out   std_logic;                                        -- SCLK
			clk_clk                   : in    std_logic                     := 'X';             -- clk
			expansion_jp5_export      : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			flash_ADDR                : out   std_logic_vector(22 downto 0);                    -- ADDR
			flash_CE_N                : out   std_logic;                                        -- CE_N
			flash_OE_N                : out   std_logic;                                        -- OE_N
			flash_WE_N                : out   std_logic;                                        -- WE_N
			flash_RST_N               : out   std_logic;                                        -- RST_N
			flash_DQ                  : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- DQ
			green_leds_export         : out   std_logic_vector(8 downto 0);                     -- export
			pushbuttons_export        : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			red_leds_export           : out   std_logic_vector(17 downto 0);                    -- export
			reset_reset_n             : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                  : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n               : out   std_logic;                                        -- cas_n
			sdram_cke                 : out   std_logic;                                        -- cke
			sdram_cs_n                : out   std_logic;                                        -- cs_n
			sdram_dq                  : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_dqm                 : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_ras_n               : out   std_logic;                                        -- ras_n
			sdram_we_n                : out   std_logic;                                        -- we_n
			serial_port_RXD           : in    std_logic                     := 'X';             -- RXD
			serial_port_TXD           : out   std_logic;                                        -- TXD
			slider_switches_export    : in    std_logic_vector(17 downto 0) := (others => 'X'); -- export
			sram_DQ                   : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			sram_ADDR                 : out   std_logic_vector(19 downto 0);                    -- ADDR
			sram_LB_N                 : out   std_logic;                                        -- LB_N
			sram_UB_N                 : out   std_logic;                                        -- UB_N
			sram_CE_N                 : out   std_logic;                                        -- CE_N
			sram_OE_N                 : out   std_logic;                                        -- OE_N
			sram_WE_N                 : out   std_logic;                                        -- WE_N
			video_ext_PIXEL_CLK       : in    std_logic                     := 'X';             -- PIXEL_CLK
			video_ext_LINE_VALID      : in    std_logic                     := 'X';             -- LINE_VALID
			video_ext_FRAME_VALID     : in    std_logic                     := 'X';             -- FRAME_VALID
			video_ext_pixel_clk_reset : in    std_logic                     := 'X';             -- pixel_clk_reset
			video_ext_PIXEL_DATA      : in    std_logic_vector(11 downto 0) := (others => 'X')  -- PIXEL_DATA
		);
	end component nios_system2;

	u0 : component nios_system2
		port map (
			audio_ADCDAT              => CONNECTED_TO_audio_ADCDAT,              --               audio.ADCDAT
			audio_ADCLRCK             => CONNECTED_TO_audio_ADCLRCK,             --                    .ADCLRCK
			audio_BCLK                => CONNECTED_TO_audio_BCLK,                --                    .BCLK
			audio_DACDAT              => CONNECTED_TO_audio_DACDAT,              --                    .DACDAT
			audio_DACLRCK             => CONNECTED_TO_audio_DACLRCK,             --                    .DACLRCK
			audio_clk_clk             => CONNECTED_TO_audio_clk_clk,             --           audio_clk.clk
			audio_irq_irq             => CONNECTED_TO_audio_irq_irq,             --           audio_irq.irq
			audio_pll_ref_clk_clk     => CONNECTED_TO_audio_pll_ref_clk_clk,     --   audio_pll_ref_clk.clk
			audio_pll_ref_reset_reset => CONNECTED_TO_audio_pll_ref_reset_reset, -- audio_pll_ref_reset.reset
			audio_reset_reset         => CONNECTED_TO_audio_reset_reset,         --         audio_reset.reset
			audio_slave_address       => CONNECTED_TO_audio_slave_address,       --         audio_slave.address
			audio_slave_chipselect    => CONNECTED_TO_audio_slave_chipselect,    --                    .chipselect
			audio_slave_read          => CONNECTED_TO_audio_slave_read,          --                    .read
			audio_slave_write         => CONNECTED_TO_audio_slave_write,         --                    .write
			audio_slave_writedata     => CONNECTED_TO_audio_slave_writedata,     --                    .writedata
			audio_slave_readdata      => CONNECTED_TO_audio_slave_readdata,      --                    .readdata
			av_config_SDAT            => CONNECTED_TO_av_config_SDAT,            --           av_config.SDAT
			av_config_SCLK            => CONNECTED_TO_av_config_SCLK,            --                    .SCLK
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                 clk.clk
			expansion_jp5_export      => CONNECTED_TO_expansion_jp5_export,      --       expansion_jp5.export
			flash_ADDR                => CONNECTED_TO_flash_ADDR,                --               flash.ADDR
			flash_CE_N                => CONNECTED_TO_flash_CE_N,                --                    .CE_N
			flash_OE_N                => CONNECTED_TO_flash_OE_N,                --                    .OE_N
			flash_WE_N                => CONNECTED_TO_flash_WE_N,                --                    .WE_N
			flash_RST_N               => CONNECTED_TO_flash_RST_N,               --                    .RST_N
			flash_DQ                  => CONNECTED_TO_flash_DQ,                  --                    .DQ
			green_leds_export         => CONNECTED_TO_green_leds_export,         --          green_leds.export
			pushbuttons_export        => CONNECTED_TO_pushbuttons_export,        --         pushbuttons.export
			red_leds_export           => CONNECTED_TO_red_leds_export,           --            red_leds.export
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --               reset.reset_n
			sdram_addr                => CONNECTED_TO_sdram_addr,                --               sdram.addr
			sdram_ba                  => CONNECTED_TO_sdram_ba,                  --                    .ba
			sdram_cas_n               => CONNECTED_TO_sdram_cas_n,               --                    .cas_n
			sdram_cke                 => CONNECTED_TO_sdram_cke,                 --                    .cke
			sdram_cs_n                => CONNECTED_TO_sdram_cs_n,                --                    .cs_n
			sdram_dq                  => CONNECTED_TO_sdram_dq,                  --                    .dq
			sdram_dqm                 => CONNECTED_TO_sdram_dqm,                 --                    .dqm
			sdram_ras_n               => CONNECTED_TO_sdram_ras_n,               --                    .ras_n
			sdram_we_n                => CONNECTED_TO_sdram_we_n,                --                    .we_n
			serial_port_RXD           => CONNECTED_TO_serial_port_RXD,           --         serial_port.RXD
			serial_port_TXD           => CONNECTED_TO_serial_port_TXD,           --                    .TXD
			slider_switches_export    => CONNECTED_TO_slider_switches_export,    --     slider_switches.export
			sram_DQ                   => CONNECTED_TO_sram_DQ,                   --                sram.DQ
			sram_ADDR                 => CONNECTED_TO_sram_ADDR,                 --                    .ADDR
			sram_LB_N                 => CONNECTED_TO_sram_LB_N,                 --                    .LB_N
			sram_UB_N                 => CONNECTED_TO_sram_UB_N,                 --                    .UB_N
			sram_CE_N                 => CONNECTED_TO_sram_CE_N,                 --                    .CE_N
			sram_OE_N                 => CONNECTED_TO_sram_OE_N,                 --                    .OE_N
			sram_WE_N                 => CONNECTED_TO_sram_WE_N,                 --                    .WE_N
			video_ext_PIXEL_CLK       => CONNECTED_TO_video_ext_PIXEL_CLK,       --           video_ext.PIXEL_CLK
			video_ext_LINE_VALID      => CONNECTED_TO_video_ext_LINE_VALID,      --                    .LINE_VALID
			video_ext_FRAME_VALID     => CONNECTED_TO_video_ext_FRAME_VALID,     --                    .FRAME_VALID
			video_ext_pixel_clk_reset => CONNECTED_TO_video_ext_pixel_clk_reset, --                    .pixel_clk_reset
			video_ext_PIXEL_DATA      => CONNECTED_TO_video_ext_PIXEL_DATA       --                    .PIXEL_DATA
		);

