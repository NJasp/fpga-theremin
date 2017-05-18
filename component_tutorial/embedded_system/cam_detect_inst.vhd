	component cam_detect is
		port (
			clk_clk                      : in  std_logic                     := 'X';             -- clk
			reset_reset_n                : in  std_logic                     := 'X';             -- reset_n
			video_ext_PIXEL_CLK          : in  std_logic                     := 'X';             -- PIXEL_CLK
			video_ext_LINE_VALID         : in  std_logic                     := 'X';             -- LINE_VALID
			video_ext_FRAME_VALID        : in  std_logic                     := 'X';             -- FRAME_VALID
			video_ext_pixel_clk_reset    : in  std_logic                     := 'X';             -- pixel_clk_reset
			video_ext_PIXEL_DATA         : in  std_logic_vector(11 downto 0) := (others => 'X'); -- PIXEL_DATA
			cam_detect_0_xdata_writedata : out std_logic_vector(15 downto 0);                    -- writedata
			cam_detect_0_ydata_writedata : out std_logic_vector(15 downto 0)                     -- writedata
		);
	end component cam_detect;

	u0 : component cam_detect
		port map (
			clk_clk                      => CONNECTED_TO_clk_clk,                      --                clk.clk
			reset_reset_n                => CONNECTED_TO_reset_reset_n,                --              reset.reset_n
			video_ext_PIXEL_CLK          => CONNECTED_TO_video_ext_PIXEL_CLK,          --          video_ext.PIXEL_CLK
			video_ext_LINE_VALID         => CONNECTED_TO_video_ext_LINE_VALID,         --                   .LINE_VALID
			video_ext_FRAME_VALID        => CONNECTED_TO_video_ext_FRAME_VALID,        --                   .FRAME_VALID
			video_ext_pixel_clk_reset    => CONNECTED_TO_video_ext_pixel_clk_reset,    --                   .pixel_clk_reset
			video_ext_PIXEL_DATA         => CONNECTED_TO_video_ext_PIXEL_DATA,         --                   .PIXEL_DATA
			cam_detect_0_xdata_writedata => CONNECTED_TO_cam_detect_0_xdata_writedata, -- cam_detect_0_xdata.writedata
			cam_detect_0_ydata_writedata => CONNECTED_TO_cam_detect_0_ydata_writedata  -- cam_detect_0_ydata.writedata
		);

