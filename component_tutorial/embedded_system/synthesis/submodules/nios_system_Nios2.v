// nios_system_Nios2.v

// This file was auto-generated from altera_nios2_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module nios_system_Nios2 (
		input  wire        clk,                                 //                       clk.clk
		input  wire        reset_n,                             //                     reset.reset_n
		output wire [28:0] d_address,                           //               data_master.address
		output wire [3:0]  d_byteenable,                        //                          .byteenable
		output wire        d_read,                              //                          .read
		input  wire [31:0] d_readdata,                          //                          .readdata
		input  wire        d_waitrequest,                       //                          .waitrequest
		output wire        d_write,                             //                          .write
		output wire [31:0] d_writedata,                         //                          .writedata
		output wire        debug_mem_slave_debugaccess_to_roms, //                          .debugaccess
		output wire [27:0] i_address,                           //        instruction_master.address
		output wire        i_read,                              //                          .read
		input  wire [31:0] i_readdata,                          //                          .readdata
		input  wire        i_waitrequest,                       //                          .waitrequest
		input  wire [31:0] irq,                                 //                       irq.irq
		output wire        debug_reset_request,                 //       debug_reset_request.reset
		input  wire [8:0]  debug_mem_slave_address,             //           debug_mem_slave.address
		input  wire [3:0]  debug_mem_slave_byteenable,          //                          .byteenable
		input  wire        debug_mem_slave_debugaccess,         //                          .debugaccess
		input  wire        debug_mem_slave_read,                //                          .read
		output wire [31:0] debug_mem_slave_readdata,            //                          .readdata
		output wire        debug_mem_slave_waitrequest,         //                          .waitrequest
		input  wire        debug_mem_slave_write,               //                          .write
		input  wire [31:0] debug_mem_slave_writedata,           //                          .writedata
		input  wire        E_ci_multi_done,                     // custom_instruction_master.done
		output wire        E_ci_multi_clk_en,                   //                          .clk_en
		output wire        E_ci_multi_start,                    //                          .start
		input  wire [31:0] E_ci_result,                         //                          .result
		output wire [4:0]  D_ci_a,                              //                          .a
		output wire [4:0]  D_ci_b,                              //                          .b
		output wire [4:0]  D_ci_c,                              //                          .c
		output wire [7:0]  D_ci_n,                              //                          .n
		output wire        D_ci_readra,                         //                          .readra
		output wire        D_ci_readrb,                         //                          .readrb
		output wire        D_ci_writerc,                        //                          .writerc
		output wire [31:0] E_ci_dataa,                          //                          .dataa
		output wire [31:0] E_ci_datab,                          //                          .datab
		output wire        E_ci_multi_clock,                    //                          .clk
		output wire        E_ci_multi_reset,                    //                          .reset
		output wire        E_ci_multi_reset_req,                //                          .reset_req
		output wire        W_ci_estatus,                        //                          .estatus
		output wire [31:0] W_ci_ipending                        //                          .ipending
	);

	nios_system_Nios2_cpu cpu (
		.clk                                 (clk),                                 //                       clk.clk
		.reset_n                             (reset_n),                             //                     reset.reset_n
		.d_address                           (d_address),                           //               data_master.address
		.d_byteenable                        (d_byteenable),                        //                          .byteenable
		.d_read                              (d_read),                              //                          .read
		.d_readdata                          (d_readdata),                          //                          .readdata
		.d_waitrequest                       (d_waitrequest),                       //                          .waitrequest
		.d_write                             (d_write),                             //                          .write
		.d_writedata                         (d_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (debug_mem_slave_debugaccess_to_roms), //                          .debugaccess
		.i_address                           (i_address),                           //        instruction_master.address
		.i_read                              (i_read),                              //                          .read
		.i_readdata                          (i_readdata),                          //                          .readdata
		.i_waitrequest                       (i_waitrequest),                       //                          .waitrequest
		.irq                                 (irq),                                 //                       irq.irq
		.debug_reset_request                 (debug_reset_request),                 //       debug_reset_request.reset
		.debug_mem_slave_address             (debug_mem_slave_address),             //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (debug_mem_slave_byteenable),          //                          .byteenable
		.debug_mem_slave_debugaccess         (debug_mem_slave_debugaccess),         //                          .debugaccess
		.debug_mem_slave_read                (debug_mem_slave_read),                //                          .read
		.debug_mem_slave_readdata            (debug_mem_slave_readdata),            //                          .readdata
		.debug_mem_slave_waitrequest         (debug_mem_slave_waitrequest),         //                          .waitrequest
		.debug_mem_slave_write               (debug_mem_slave_write),               //                          .write
		.debug_mem_slave_writedata           (debug_mem_slave_writedata),           //                          .writedata
		.E_ci_multi_done                     (E_ci_multi_done),                     // custom_instruction_master.done
		.E_ci_multi_clk_en                   (E_ci_multi_clk_en),                   //                          .clk_en
		.E_ci_multi_start                    (E_ci_multi_start),                    //                          .start
		.E_ci_result                         (E_ci_result),                         //                          .result
		.D_ci_a                              (D_ci_a),                              //                          .a
		.D_ci_b                              (D_ci_b),                              //                          .b
		.D_ci_c                              (D_ci_c),                              //                          .c
		.D_ci_n                              (D_ci_n),                              //                          .n
		.D_ci_readra                         (D_ci_readra),                         //                          .readra
		.D_ci_readrb                         (D_ci_readrb),                         //                          .readrb
		.D_ci_writerc                        (D_ci_writerc),                        //                          .writerc
		.E_ci_dataa                          (E_ci_dataa),                          //                          .dataa
		.E_ci_datab                          (E_ci_datab),                          //                          .datab
		.E_ci_multi_clock                    (E_ci_multi_clock),                    //                          .clk
		.E_ci_multi_reset                    (E_ci_multi_reset),                    //                          .reset
		.E_ci_multi_reset_req                (E_ci_multi_reset_req),                //                          .reset_req
		.W_ci_estatus                        (W_ci_estatus),                        //                          .estatus
		.W_ci_ipending                       (W_ci_ipending),                       //                          .ipending
		.reset_req                           (1'b0)                                 //               (terminated)
	);

endmodule
