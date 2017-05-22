
module Video_In_Subsystem (
	sys_clk_clk,
	sys_reset_reset_n,
	video_in_PIXEL_CLK,
	video_in_LINE_VALID,
	video_in_FRAME_VALID,
	video_in_pixel_clk_reset,
	video_in_PIXEL_DATA,
	camera_slave_readdata);	

	input		sys_clk_clk;
	input		sys_reset_reset_n;
	input		video_in_PIXEL_CLK;
	input		video_in_LINE_VALID;
	input		video_in_FRAME_VALID;
	input		video_in_pixel_clk_reset;
	input	[11:0]	video_in_PIXEL_DATA;
	output	[31:0]	camera_slave_readdata;
endmodule
