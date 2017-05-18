	cam_detect u0 (
		.clk_clk                      (<connected-to-clk_clk>),                      //                clk.clk
		.reset_reset_n                (<connected-to-reset_reset_n>),                //              reset.reset_n
		.video_ext_PIXEL_CLK          (<connected-to-video_ext_PIXEL_CLK>),          //          video_ext.PIXEL_CLK
		.video_ext_LINE_VALID         (<connected-to-video_ext_LINE_VALID>),         //                   .LINE_VALID
		.video_ext_FRAME_VALID        (<connected-to-video_ext_FRAME_VALID>),        //                   .FRAME_VALID
		.video_ext_pixel_clk_reset    (<connected-to-video_ext_pixel_clk_reset>),    //                   .pixel_clk_reset
		.video_ext_PIXEL_DATA         (<connected-to-video_ext_PIXEL_DATA>),         //                   .PIXEL_DATA
		.cam_detect_0_xdata_writedata (<connected-to-cam_detect_0_xdata_writedata>), // cam_detect_0_xdata.writedata
		.cam_detect_0_ydata_writedata (<connected-to-cam_detect_0_ydata_writedata>)  // cam_detect_0_ydata.writedata
	);

