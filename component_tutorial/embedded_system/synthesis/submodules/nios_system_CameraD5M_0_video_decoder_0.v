// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module decodes video input streams on the DE boards.                  *
 *                                                                            *
 ******************************************************************************/

module nios_system_CameraD5M_0_video_decoder_0 (
	// Inputs
	clk,
	reset,

	PIXEL_CLK,
	LINE_VALID,
	FRAME_VALID,
	PIXEL_DATA,
	pixel_clk_reset,

	stream_out_ready,

	// Bidirectional

	// Outputs
	overflow_flag,

	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter IW		= 11;

parameter OW		= 7;
parameter FW		= 9;

parameter PIXELS	= 1280;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input						PIXEL_CLK;
input						LINE_VALID;
input						FRAME_VALID;
input			[IW: 0]	PIXEL_DATA;
input						pixel_clk_reset;

input						stream_out_ready;

// Bidirectional

// Outputs
output reg				overflow_flag;

output		[OW: 0]	stream_out_data;
output					stream_out_startofpacket;
output					stream_out_endofpacket;
output					stream_out_empty;
output					stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						video_clk;
wire						video_clk_reset;

wire			[OW: 0]	decoded_pixel;
wire						decoded_startofpacket;
wire						decoded_endofpacket;
wire						decoded_valid;

wire			[FW: 0]	data_from_fifo;
wire			[ 6: 0]	fifo_used_words;
wire			[ 6: 0]	wrusedw;
wire						wrfull;

wire						rdempty;
						

// Internal Registers
reg						reached_start_of_frame;

// State Machine Registers

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge video_clk)
begin
	if (video_clk_reset)
		overflow_flag <= 1'b0;
	else if (decoded_valid & reached_start_of_frame & wrfull)
		overflow_flag <= 1'b1;
end

// Internal Registers
always @(posedge video_clk)
begin
	if (video_clk_reset)
		reached_start_of_frame <= 1'b0;
	else if (decoded_valid & decoded_startofpacket)
		reached_start_of_frame <= 1'b1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments

assign stream_out_data				= data_from_fifo[OW: 0];
assign stream_out_startofpacket	= data_from_fifo[(FW - 1)];
assign stream_out_endofpacket		= data_from_fifo[FW];
assign stream_out_empty				= 1'b0;
assign stream_out_valid				= ~rdempty;

// Internal Assignments
assign video_clk						= PIXEL_CLK;
assign video_clk_reset					= pixel_clk_reset;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

// Camera Daughter Card Decoding
//`ifdef USE_BAYER_PATTERN
//altera_up_video_camera_decoder_bayer Camera_Decoder (
//`else
//altera_up_video_camera_decoder_RGB Camera_Decoder (
//`endif
altera_up_video_camera_decoder Camera_Decoder (
	// Inputs
	.clk				(video_clk),
	.reset			(video_clk_reset),

	.PIXEL_DATA		(PIXEL_DATA[11: 4]),
	.LINE_VALID		(LINE_VALID),
	.FRAME_VALID	(FRAME_VALID),

	.ready			(decoded_valid & ~wrfull),

	// Bidirectionals

	// Outputs
//	.data_out		(decoded_pixel),
//	.startofpacket	(decoded_startofpacket),
//	.valid			(decoded_valid)

	.data				(decoded_pixel),
	.startofpacket	(decoded_startofpacket),
	.endofpacket	(decoded_endofpacket),
//	.empty			(),
	.valid			(decoded_valid)
);
defparam
//`ifdef USE_BAYER_PATTERN
	Camera_Decoder.DW		= 7;
//`else
//	Camera_Decoder.IDW		= 7,
//	Camera_Decoder.ODW		= OW,
//	Camera_Decoder.WIDTH	= PIXELS;
//`endif

altera_up_video_dual_clock_fifo Video_In_Dual_Clock_FIFO (
	// Inputs
	.wrclk			(video_clk),
	.wrreq			(decoded_valid & ~wrfull),
//	.data			({decoded_endofpacket, decoded_startofpacket, decoded_pixel}),
	.data				({decoded_endofpacket, decoded_startofpacket, decoded_pixel}),
	
	.rdclk			(clk),
	.rdreq			(stream_out_valid & stream_out_ready),

	// Bidirectionals

	// Outputs
	.wrusedw			(wrusedw),
	.wrfull			(wrfull),
		
	.q					(data_from_fifo),
	.rdusedw			(fifo_used_words),
	.rdempty			(rdempty)
);
defparam 
	Video_In_Dual_Clock_FIFO.DW = (FW + 1);

endmodule

