
module Video_In_Subsystem (
	edge_detection_control_slave_address,
	edge_detection_control_slave_write_n,
	edge_detection_control_slave_writedata,
	edge_detection_control_slave_chipselect,
	edge_detection_control_slave_readdata,
	sys_clk_clk,
	sys_reset_reset_n,
	video_in_TD_CLK27,
	video_in_TD_DATA,
	video_in_TD_HS,
	video_in_TD_VS,
	video_in_clk27_reset,
	video_in_TD_RESET,
	video_in_overflow_flag,
	video_in_dma_control_slave_address,
	video_in_dma_control_slave_byteenable,
	video_in_dma_control_slave_read,
	video_in_dma_control_slave_write,
	video_in_dma_control_slave_writedata,
	video_in_dma_control_slave_readdata,
	video_in_dma_master_address,
	video_in_dma_master_waitrequest,
	video_in_dma_master_write,
	video_in_dma_master_writedata);	

	input	[1:0]	edge_detection_control_slave_address;
	input		edge_detection_control_slave_write_n;
	input	[31:0]	edge_detection_control_slave_writedata;
	input		edge_detection_control_slave_chipselect;
	output	[31:0]	edge_detection_control_slave_readdata;
	input		sys_clk_clk;
	input		sys_reset_reset_n;
	input		video_in_TD_CLK27;
	input	[7:0]	video_in_TD_DATA;
	input		video_in_TD_HS;
	input		video_in_TD_VS;
	input		video_in_clk27_reset;
	output		video_in_TD_RESET;
	output		video_in_overflow_flag;
	input	[1:0]	video_in_dma_control_slave_address;
	input	[3:0]	video_in_dma_control_slave_byteenable;
	input		video_in_dma_control_slave_read;
	input		video_in_dma_control_slave_write;
	input	[31:0]	video_in_dma_control_slave_writedata;
	output	[31:0]	video_in_dma_control_slave_readdata;
	output	[31:0]	video_in_dma_master_address;
	input		video_in_dma_master_waitrequest;
	output		video_in_dma_master_write;
	output	[15:0]	video_in_dma_master_writedata;
endmodule
