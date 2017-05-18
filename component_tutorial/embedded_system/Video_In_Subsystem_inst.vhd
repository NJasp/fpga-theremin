	component Video_In_Subsystem is
		port (
			edge_detection_control_slave_address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			edge_detection_control_slave_write_n    : in  std_logic                     := 'X';             -- write_n
			edge_detection_control_slave_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			edge_detection_control_slave_chipselect : in  std_logic                     := 'X';             -- chipselect
			edge_detection_control_slave_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			sys_clk_clk                             : in  std_logic                     := 'X';             -- clk
			sys_reset_reset_n                       : in  std_logic                     := 'X';             -- reset_n
			video_in_TD_CLK27                       : in  std_logic                     := 'X';             -- TD_CLK27
			video_in_TD_DATA                        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- TD_DATA
			video_in_TD_HS                          : in  std_logic                     := 'X';             -- TD_HS
			video_in_TD_VS                          : in  std_logic                     := 'X';             -- TD_VS
			video_in_clk27_reset                    : in  std_logic                     := 'X';             -- clk27_reset
			video_in_TD_RESET                       : out std_logic;                                        -- TD_RESET
			video_in_overflow_flag                  : out std_logic;                                        -- overflow_flag
			video_in_dma_control_slave_address      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			video_in_dma_control_slave_byteenable   : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			video_in_dma_control_slave_read         : in  std_logic                     := 'X';             -- read
			video_in_dma_control_slave_write        : in  std_logic                     := 'X';             -- write
			video_in_dma_control_slave_writedata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			video_in_dma_control_slave_readdata     : out std_logic_vector(31 downto 0);                    -- readdata
			video_in_dma_master_address             : out std_logic_vector(31 downto 0);                    -- address
			video_in_dma_master_waitrequest         : in  std_logic                     := 'X';             -- waitrequest
			video_in_dma_master_write               : out std_logic;                                        -- write
			video_in_dma_master_writedata           : out std_logic_vector(15 downto 0)                     -- writedata
		);
	end component Video_In_Subsystem;

	u0 : component Video_In_Subsystem
		port map (
			edge_detection_control_slave_address    => CONNECTED_TO_edge_detection_control_slave_address,    -- edge_detection_control_slave.address
			edge_detection_control_slave_write_n    => CONNECTED_TO_edge_detection_control_slave_write_n,    --                             .write_n
			edge_detection_control_slave_writedata  => CONNECTED_TO_edge_detection_control_slave_writedata,  --                             .writedata
			edge_detection_control_slave_chipselect => CONNECTED_TO_edge_detection_control_slave_chipselect, --                             .chipselect
			edge_detection_control_slave_readdata   => CONNECTED_TO_edge_detection_control_slave_readdata,   --                             .readdata
			sys_clk_clk                             => CONNECTED_TO_sys_clk_clk,                             --                      sys_clk.clk
			sys_reset_reset_n                       => CONNECTED_TO_sys_reset_reset_n,                       --                    sys_reset.reset_n
			video_in_TD_CLK27                       => CONNECTED_TO_video_in_TD_CLK27,                       --                     video_in.TD_CLK27
			video_in_TD_DATA                        => CONNECTED_TO_video_in_TD_DATA,                        --                             .TD_DATA
			video_in_TD_HS                          => CONNECTED_TO_video_in_TD_HS,                          --                             .TD_HS
			video_in_TD_VS                          => CONNECTED_TO_video_in_TD_VS,                          --                             .TD_VS
			video_in_clk27_reset                    => CONNECTED_TO_video_in_clk27_reset,                    --                             .clk27_reset
			video_in_TD_RESET                       => CONNECTED_TO_video_in_TD_RESET,                       --                             .TD_RESET
			video_in_overflow_flag                  => CONNECTED_TO_video_in_overflow_flag,                  --                             .overflow_flag
			video_in_dma_control_slave_address      => CONNECTED_TO_video_in_dma_control_slave_address,      --   video_in_dma_control_slave.address
			video_in_dma_control_slave_byteenable   => CONNECTED_TO_video_in_dma_control_slave_byteenable,   --                             .byteenable
			video_in_dma_control_slave_read         => CONNECTED_TO_video_in_dma_control_slave_read,         --                             .read
			video_in_dma_control_slave_write        => CONNECTED_TO_video_in_dma_control_slave_write,        --                             .write
			video_in_dma_control_slave_writedata    => CONNECTED_TO_video_in_dma_control_slave_writedata,    --                             .writedata
			video_in_dma_control_slave_readdata     => CONNECTED_TO_video_in_dma_control_slave_readdata,     --                             .readdata
			video_in_dma_master_address             => CONNECTED_TO_video_in_dma_master_address,             --          video_in_dma_master.address
			video_in_dma_master_waitrequest         => CONNECTED_TO_video_in_dma_master_waitrequest,         --                             .waitrequest
			video_in_dma_master_write               => CONNECTED_TO_video_in_dma_master_write,               --                             .write
			video_in_dma_master_writedata           => CONNECTED_TO_video_in_dma_master_writedata            --                             .writedata
		);

