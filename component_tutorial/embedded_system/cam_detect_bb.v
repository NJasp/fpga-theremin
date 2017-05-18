
module cam_detect (
	clk_clk,
	reset_reset_n,
	video_ext_PIXEL_CLK,
	video_ext_LINE_VALID,
	video_ext_FRAME_VALID,
	video_ext_pixel_clk_reset,
	video_ext_PIXEL_DATA,
	cam_detect_0_xdata_writedata,
	cam_detect_0_ydata_writedata);	

	input		clk_clk;
	input		reset_reset_n;
	input		video_ext_PIXEL_CLK;
	input		video_ext_LINE_VALID;
	input		video_ext_FRAME_VALID;
	input		video_ext_pixel_clk_reset;
	input	[11:0]	video_ext_PIXEL_DATA;
	output	[15:0]	cam_detect_0_xdata_writedata;
	output	[15:0]	cam_detect_0_ydata_writedata;
endmodule
