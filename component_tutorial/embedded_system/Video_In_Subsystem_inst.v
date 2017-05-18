	Video_In_Subsystem u0 (
		.edge_detection_control_slave_address    (<connected-to-edge_detection_control_slave_address>),    // edge_detection_control_slave.address
		.edge_detection_control_slave_write_n    (<connected-to-edge_detection_control_slave_write_n>),    //                             .write_n
		.edge_detection_control_slave_writedata  (<connected-to-edge_detection_control_slave_writedata>),  //                             .writedata
		.edge_detection_control_slave_chipselect (<connected-to-edge_detection_control_slave_chipselect>), //                             .chipselect
		.edge_detection_control_slave_readdata   (<connected-to-edge_detection_control_slave_readdata>),   //                             .readdata
		.sys_clk_clk                             (<connected-to-sys_clk_clk>),                             //                      sys_clk.clk
		.sys_reset_reset_n                       (<connected-to-sys_reset_reset_n>),                       //                    sys_reset.reset_n
		.video_in_TD_CLK27                       (<connected-to-video_in_TD_CLK27>),                       //                     video_in.TD_CLK27
		.video_in_TD_DATA                        (<connected-to-video_in_TD_DATA>),                        //                             .TD_DATA
		.video_in_TD_HS                          (<connected-to-video_in_TD_HS>),                          //                             .TD_HS
		.video_in_TD_VS                          (<connected-to-video_in_TD_VS>),                          //                             .TD_VS
		.video_in_clk27_reset                    (<connected-to-video_in_clk27_reset>),                    //                             .clk27_reset
		.video_in_TD_RESET                       (<connected-to-video_in_TD_RESET>),                       //                             .TD_RESET
		.video_in_overflow_flag                  (<connected-to-video_in_overflow_flag>),                  //                             .overflow_flag
		.video_in_dma_control_slave_address      (<connected-to-video_in_dma_control_slave_address>),      //   video_in_dma_control_slave.address
		.video_in_dma_control_slave_byteenable   (<connected-to-video_in_dma_control_slave_byteenable>),   //                             .byteenable
		.video_in_dma_control_slave_read         (<connected-to-video_in_dma_control_slave_read>),         //                             .read
		.video_in_dma_control_slave_write        (<connected-to-video_in_dma_control_slave_write>),        //                             .write
		.video_in_dma_control_slave_writedata    (<connected-to-video_in_dma_control_slave_writedata>),    //                             .writedata
		.video_in_dma_control_slave_readdata     (<connected-to-video_in_dma_control_slave_readdata>),     //                             .readdata
		.video_in_dma_master_address             (<connected-to-video_in_dma_master_address>),             //          video_in_dma_master.address
		.video_in_dma_master_waitrequest         (<connected-to-video_in_dma_master_waitrequest>),         //                             .waitrequest
		.video_in_dma_master_write               (<connected-to-video_in_dma_master_write>),               //                             .write
		.video_in_dma_master_writedata           (<connected-to-video_in_dma_master_writedata>)            //                             .writedata
	);

