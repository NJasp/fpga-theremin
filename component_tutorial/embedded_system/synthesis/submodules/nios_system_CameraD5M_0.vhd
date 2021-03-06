-- nios_system_CameraD5M_0.vhd

-- Generated using ACDS version 16.1 196

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nios_system_CameraD5M_0 is
	port (
		camera_slave_readdata     : out std_logic_vector(31 downto 0);                    -- camera_slave.readdata
		clk_clk                   : in  std_logic                     := '0';             --          clk.clk
		reset_reset_n             : in  std_logic                     := '0';             --        reset.reset_n
		video_ext_PIXEL_CLK       : in  std_logic                     := '0';             --    video_ext.PIXEL_CLK
		video_ext_LINE_VALID      : in  std_logic                     := '0';             --             .LINE_VALID
		video_ext_FRAME_VALID     : in  std_logic                     := '0';             --             .FRAME_VALID
		video_ext_pixel_clk_reset : in  std_logic                     := '0';             --             .pixel_clk_reset
		video_ext_PIXEL_DATA      : in  std_logic_vector(11 downto 0) := (others => '0')  --             .PIXEL_DATA
	);
end entity nios_system_CameraD5M_0;

architecture rtl of nios_system_CameraD5M_0 is
	component cam_detect is
		port (
			reset         : in  std_logic                     := 'X';             -- reset
			valid         : in  std_logic                     := 'X';             -- valid
			startofpacket : in  std_logic                     := 'X';             -- startofpacket
			endofpacket   : in  std_logic                     := 'X';             -- endofpacket
			data          : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			clk           : in  std_logic                     := 'X';             -- clk
			xyData        : out std_logic_vector(31 downto 0)                     -- readdata
		);
	end component cam_detect;

	component nios_system_CameraD5M_0_video_bayer_resampler_0 is
		port (
			clk                      : in  std_logic                     := 'X';             -- clk
			reset                    : in  std_logic                     := 'X';             -- reset
			stream_in_data           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			stream_in_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			stream_in_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			stream_in_valid          : in  std_logic                     := 'X';             -- valid
			stream_in_ready          : out std_logic;                                        -- ready
			stream_out_ready         : in  std_logic                     := 'X';             -- ready
			stream_out_data          : out std_logic_vector(23 downto 0);                    -- data
			stream_out_startofpacket : out std_logic;                                        -- startofpacket
			stream_out_endofpacket   : out std_logic;                                        -- endofpacket
			stream_out_valid         : out std_logic                                         -- valid
		);
	end component nios_system_CameraD5M_0_video_bayer_resampler_0;

	component nios_system_CameraD5M_0_video_decoder_0 is
		port (
			clk                      : in  std_logic                     := 'X';             -- clk
			reset                    : in  std_logic                     := 'X';             -- reset
			stream_out_ready         : in  std_logic                     := 'X';             -- ready
			stream_out_startofpacket : out std_logic;                                        -- startofpacket
			stream_out_endofpacket   : out std_logic;                                        -- endofpacket
			stream_out_valid         : out std_logic;                                        -- valid
			stream_out_data          : out std_logic_vector(7 downto 0);                     -- data
			PIXEL_CLK                : in  std_logic                     := 'X';             -- export
			LINE_VALID               : in  std_logic                     := 'X';             -- export
			FRAME_VALID              : in  std_logic                     := 'X';             -- export
			pixel_clk_reset          : in  std_logic                     := 'X';             -- export
			PIXEL_DATA               : in  std_logic_vector(11 downto 0) := (others => 'X')  -- export
		);
	end component nios_system_CameraD5M_0_video_decoder_0;

	component nios_system_CameraD5M_0_avalon_st_adapter is
		generic (
			inBitsPerSymbol : integer := 8;
			inUsePackets    : integer := 0;
			inDataWidth     : integer := 8;
			inChannelWidth  : integer := 3;
			inErrorWidth    : integer := 2;
			inUseEmptyPort  : integer := 0;
			inUseValid      : integer := 1;
			inUseReady      : integer := 1;
			inReadyLatency  : integer := 0;
			outDataWidth    : integer := 32;
			outChannelWidth : integer := 3;
			outErrorWidth   : integer := 2;
			outUseEmptyPort : integer := 0;
			outUseValid     : integer := 1;
			outUseReady     : integer := 1;
			outReadyLatency : integer := 0
		);
		port (
			in_clk_0_clk        : in  std_logic                     := 'X';             -- clk
			in_rst_0_reset      : in  std_logic                     := 'X';             -- reset
			in_0_data           : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			in_0_valid          : in  std_logic                     := 'X';             -- valid
			in_0_ready          : out std_logic;                                        -- ready
			in_0_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			in_0_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			out_0_data          : out std_logic_vector(23 downto 0);                    -- data
			out_0_valid         : out std_logic;                                        -- valid
			out_0_startofpacket : out std_logic;                                        -- startofpacket
			out_0_endofpacket   : out std_logic                                         -- endofpacket
		);
	end component nios_system_CameraD5M_0_avalon_st_adapter;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal video_decoder_0_avalon_decoder_source_valid               : std_logic;                     -- video_decoder_0:stream_out_valid -> video_bayer_resampler_0:stream_in_valid
	signal video_decoder_0_avalon_decoder_source_data                : std_logic_vector(7 downto 0);  -- video_decoder_0:stream_out_data -> video_bayer_resampler_0:stream_in_data
	signal video_decoder_0_avalon_decoder_source_ready               : std_logic;                     -- video_bayer_resampler_0:stream_in_ready -> video_decoder_0:stream_out_ready
	signal video_decoder_0_avalon_decoder_source_startofpacket       : std_logic;                     -- video_decoder_0:stream_out_startofpacket -> video_bayer_resampler_0:stream_in_startofpacket
	signal video_decoder_0_avalon_decoder_source_endofpacket         : std_logic;                     -- video_decoder_0:stream_out_endofpacket -> video_bayer_resampler_0:stream_in_endofpacket
	signal video_bayer_resampler_0_avalon_bayer_source_valid         : std_logic;                     -- video_bayer_resampler_0:stream_out_valid -> avalon_st_adapter:in_0_valid
	signal video_bayer_resampler_0_avalon_bayer_source_data          : std_logic_vector(23 downto 0); -- video_bayer_resampler_0:stream_out_data -> avalon_st_adapter:in_0_data
	signal video_bayer_resampler_0_avalon_bayer_source_ready         : std_logic;                     -- avalon_st_adapter:in_0_ready -> video_bayer_resampler_0:stream_out_ready
	signal video_bayer_resampler_0_avalon_bayer_source_startofpacket : std_logic;                     -- video_bayer_resampler_0:stream_out_startofpacket -> avalon_st_adapter:in_0_startofpacket
	signal video_bayer_resampler_0_avalon_bayer_source_endofpacket   : std_logic;                     -- video_bayer_resampler_0:stream_out_endofpacket -> avalon_st_adapter:in_0_endofpacket
	signal avalon_st_adapter_out_0_valid                             : std_logic;                     -- avalon_st_adapter:out_0_valid -> cam_detect_0:valid
	signal avalon_st_adapter_out_0_data                              : std_logic_vector(23 downto 0); -- avalon_st_adapter:out_0_data -> cam_detect_0:data
	signal avalon_st_adapter_out_0_startofpacket                     : std_logic;                     -- avalon_st_adapter:out_0_startofpacket -> cam_detect_0:startofpacket
	signal avalon_st_adapter_out_0_endofpacket                       : std_logic;                     -- avalon_st_adapter:out_0_endofpacket -> cam_detect_0:endofpacket
	signal rst_controller_reset_out_reset                            : std_logic;                     -- rst_controller:reset_out -> [avalon_st_adapter:in_rst_0_reset, cam_detect_0:reset, video_bayer_resampler_0:reset, video_decoder_0:reset]
	signal reset_reset_n_ports_inv                                   : std_logic;                     -- reset_reset_n:inv -> rst_controller:reset_in0

begin

	cam_detect_0 : component cam_detect
		port map (
			reset         => rst_controller_reset_out_reset,        --                 reset.reset
			valid         => avalon_st_adapter_out_0_valid,         -- avalon_streaming_sink.valid
			startofpacket => avalon_st_adapter_out_0_startofpacket, --                      .startofpacket
			endofpacket   => avalon_st_adapter_out_0_endofpacket,   --                      .endofpacket
			data          => avalon_st_adapter_out_0_data,          --                      .data
			clk           => clk_clk,                               --                   clk.clk
			xyData        => camera_slave_readdata                  --          camera_slave.readdata
		);

	video_bayer_resampler_0 : component nios_system_CameraD5M_0_video_bayer_resampler_0
		port map (
			clk                      => clk_clk,                                                   --                 clk.clk
			reset                    => rst_controller_reset_out_reset,                            --               reset.reset
			stream_in_data           => video_decoder_0_avalon_decoder_source_data,                --   avalon_bayer_sink.data
			stream_in_startofpacket  => video_decoder_0_avalon_decoder_source_startofpacket,       --                    .startofpacket
			stream_in_endofpacket    => video_decoder_0_avalon_decoder_source_endofpacket,         --                    .endofpacket
			stream_in_valid          => video_decoder_0_avalon_decoder_source_valid,               --                    .valid
			stream_in_ready          => video_decoder_0_avalon_decoder_source_ready,               --                    .ready
			stream_out_ready         => video_bayer_resampler_0_avalon_bayer_source_ready,         -- avalon_bayer_source.ready
			stream_out_data          => video_bayer_resampler_0_avalon_bayer_source_data,          --                    .data
			stream_out_startofpacket => video_bayer_resampler_0_avalon_bayer_source_startofpacket, --                    .startofpacket
			stream_out_endofpacket   => video_bayer_resampler_0_avalon_bayer_source_endofpacket,   --                    .endofpacket
			stream_out_valid         => video_bayer_resampler_0_avalon_bayer_source_valid          --                    .valid
		);

	video_decoder_0 : component nios_system_CameraD5M_0_video_decoder_0
		port map (
			clk                      => clk_clk,                                             --                   clk.clk
			reset                    => rst_controller_reset_out_reset,                      --                 reset.reset
			stream_out_ready         => video_decoder_0_avalon_decoder_source_ready,         -- avalon_decoder_source.ready
			stream_out_startofpacket => video_decoder_0_avalon_decoder_source_startofpacket, --                      .startofpacket
			stream_out_endofpacket   => video_decoder_0_avalon_decoder_source_endofpacket,   --                      .endofpacket
			stream_out_valid         => video_decoder_0_avalon_decoder_source_valid,         --                      .valid
			stream_out_data          => video_decoder_0_avalon_decoder_source_data,          --                      .data
			PIXEL_CLK                => video_ext_PIXEL_CLK,                                 --    external_interface.export
			LINE_VALID               => video_ext_LINE_VALID,                                --                      .export
			FRAME_VALID              => video_ext_FRAME_VALID,                               --                      .export
			pixel_clk_reset          => video_ext_pixel_clk_reset,                           --                      .export
			PIXEL_DATA               => video_ext_PIXEL_DATA                                 --                      .export
		);

	avalon_st_adapter : component nios_system_CameraD5M_0_avalon_st_adapter
		generic map (
			inBitsPerSymbol => 8,
			inUsePackets    => 1,
			inDataWidth     => 24,
			inChannelWidth  => 0,
			inErrorWidth    => 0,
			inUseEmptyPort  => 0,
			inUseValid      => 1,
			inUseReady      => 1,
			inReadyLatency  => 0,
			outDataWidth    => 24,
			outChannelWidth => 0,
			outErrorWidth   => 0,
			outUseEmptyPort => 0,
			outUseValid     => 1,
			outUseReady     => 0,
			outReadyLatency => 0
		)
		port map (
			in_clk_0_clk        => clk_clk,                                                   -- in_clk_0.clk
			in_rst_0_reset      => rst_controller_reset_out_reset,                            -- in_rst_0.reset
			in_0_data           => video_bayer_resampler_0_avalon_bayer_source_data,          --     in_0.data
			in_0_valid          => video_bayer_resampler_0_avalon_bayer_source_valid,         --         .valid
			in_0_ready          => video_bayer_resampler_0_avalon_bayer_source_ready,         --         .ready
			in_0_startofpacket  => video_bayer_resampler_0_avalon_bayer_source_startofpacket, --         .startofpacket
			in_0_endofpacket    => video_bayer_resampler_0_avalon_bayer_source_endofpacket,   --         .endofpacket
			out_0_data          => avalon_st_adapter_out_0_data,                              --    out_0.data
			out_0_valid         => avalon_st_adapter_out_0_valid,                             --         .valid
			out_0_startofpacket => avalon_st_adapter_out_0_startofpacket,                     --         .startofpacket
			out_0_endofpacket   => avalon_st_adapter_out_0_endofpacket                        --         .endofpacket
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_in1      => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

end architecture rtl; -- of nios_system_CameraD5M_0
