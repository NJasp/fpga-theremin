	Video_In_Subsystem u0 (
		.sys_clk_clk              (<connected-to-sys_clk_clk>),              //      sys_clk.clk
		.sys_reset_reset_n        (<connected-to-sys_reset_reset_n>),        //    sys_reset.reset_n
		.video_in_PIXEL_CLK       (<connected-to-video_in_PIXEL_CLK>),       //     video_in.PIXEL_CLK
		.video_in_LINE_VALID      (<connected-to-video_in_LINE_VALID>),      //             .LINE_VALID
		.video_in_FRAME_VALID     (<connected-to-video_in_FRAME_VALID>),     //             .FRAME_VALID
		.video_in_pixel_clk_reset (<connected-to-video_in_pixel_clk_reset>), //             .pixel_clk_reset
		.video_in_PIXEL_DATA      (<connected-to-video_in_PIXEL_DATA>),      //             .PIXEL_DATA
		.camera_slave_readdata    (<connected-to-camera_slave_readdata>)     // camera_slave.readdata
	);

