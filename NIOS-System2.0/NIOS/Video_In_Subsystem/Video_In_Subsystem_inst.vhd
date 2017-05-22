	component Video_In_Subsystem is
		port (
			sys_clk_clk              : in  std_logic                     := 'X';             -- clk
			sys_reset_reset_n        : in  std_logic                     := 'X';             -- reset_n
			video_in_PIXEL_CLK       : in  std_logic                     := 'X';             -- PIXEL_CLK
			video_in_LINE_VALID      : in  std_logic                     := 'X';             -- LINE_VALID
			video_in_FRAME_VALID     : in  std_logic                     := 'X';             -- FRAME_VALID
			video_in_pixel_clk_reset : in  std_logic                     := 'X';             -- pixel_clk_reset
			video_in_PIXEL_DATA      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- PIXEL_DATA
			camera_slave_readdata    : out std_logic_vector(31 downto 0)                     -- readdata
		);
	end component Video_In_Subsystem;

	u0 : component Video_In_Subsystem
		port map (
			sys_clk_clk              => CONNECTED_TO_sys_clk_clk,              --      sys_clk.clk
			sys_reset_reset_n        => CONNECTED_TO_sys_reset_reset_n,        --    sys_reset.reset_n
			video_in_PIXEL_CLK       => CONNECTED_TO_video_in_PIXEL_CLK,       --     video_in.PIXEL_CLK
			video_in_LINE_VALID      => CONNECTED_TO_video_in_LINE_VALID,      --             .LINE_VALID
			video_in_FRAME_VALID     => CONNECTED_TO_video_in_FRAME_VALID,     --             .FRAME_VALID
			video_in_pixel_clk_reset => CONNECTED_TO_video_in_pixel_clk_reset, --             .pixel_clk_reset
			video_in_PIXEL_DATA      => CONNECTED_TO_video_in_PIXEL_DATA,      --             .PIXEL_DATA
			camera_slave_readdata    => CONNECTED_TO_camera_slave_readdata     -- camera_slave.readdata
		);

