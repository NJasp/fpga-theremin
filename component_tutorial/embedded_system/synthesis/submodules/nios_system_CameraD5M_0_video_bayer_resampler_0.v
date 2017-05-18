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
 * This module convert Bayer Pattern video in regular RGB by joining four     *
 *  adjacent pixels in one. This effectively halfs both the width and height  *
 *  of the incoming video frame.                                              *
 *                                                                            *
 ******************************************************************************/

module nios_system_CameraD5M_0_video_bayer_resampler_0 (
	// Inputs
	clk,
	reset,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	stream_out_ready,
	
	// Bidirectional

	// Outputs
	stream_in_ready,


	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter WW		= 11;

parameter IMAGE_WIDTH	= 2592;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[ 7: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input						stream_in_empty;
input						stream_in_valid;

input						stream_out_ready;

// Bidirectional

// Outputs
output					stream_in_ready;

output reg	[23: 0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg	[ 1: 0]	stream_out_empty;
output reg				stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 7: 0]	shift_reg_data;
wire						transfer_data;

wire			[ 7: 0]	red;
wire			[ 8: 0]	green;
wire			[ 7: 0]	blue;


// Internal Registers
reg						saved_stream_in_startofpacket;

reg			[ 7: 0]	last_stream_in_data;
reg			[ 7: 0]	last_shift_reg_data;

reg			[WW: 0]	width;
reg						pixel_toggle;
reg						line_toggle;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	if (reset)
	begin
		stream_out_data				<=  'b0;
		stream_out_startofpacket	<= 1'b0;
		stream_out_endofpacket		<= 1'b0;
		stream_out_empty				<=  'b0;
		stream_out_valid				<= 1'b0;
	end
	else if (stream_out_ready | ~stream_out_valid)
	begin
		stream_out_data				<= {red, green[8:1], blue};
		stream_out_startofpacket	<= saved_stream_in_startofpacket;
		stream_out_endofpacket		<= stream_in_endofpacket;
		stream_out_empty				<= {1'b0, stream_in_empty};
		stream_out_valid				<= stream_in_valid & 
												pixel_toggle & line_toggle;
	end
end

// Internal Registers
always @ (posedge clk)
begin
	if (reset)
		saved_stream_in_startofpacket <= 1'b0;
	else if (stream_in_startofpacket & stream_in_valid)
		saved_stream_in_startofpacket <= 1'b1;
	else if (stream_out_valid)
		saved_stream_in_startofpacket <= 1'b0;
end

always @ (posedge clk)
begin
	if (reset)
	begin
		last_stream_in_data	<= 'h0;
		last_shift_reg_data	<= 'h0;
	end
	else if (transfer_data)
	begin
		last_stream_in_data	<= stream_in_data;
		last_shift_reg_data	<= shift_reg_data;
	end
end

always @ (posedge clk)
begin
	if (reset)
		width <= 'h0;
	else if (transfer_data & stream_in_startofpacket)
		width <= 'h1;
	else if (transfer_data & (width == (IMAGE_WIDTH - 1)))
		width <= 'h0;
	else if (transfer_data)
		width <= width + 1;
end

always @ (posedge clk)
begin
	if (reset)
		pixel_toggle <= 1'b0;
	else if (transfer_data & stream_in_startofpacket)
		pixel_toggle <= 1'b1;
	else if (transfer_data & (width == (IMAGE_WIDTH - 1)))
		pixel_toggle <= 1'b0;
	else if (transfer_data)
		pixel_toggle <= pixel_toggle ^ 1'b1;
end

always @ (posedge clk)
begin
	if (reset)
		line_toggle <= 1'b0;
	else if (transfer_data & (stream_in_startofpacket | stream_in_endofpacket))
		line_toggle <= 1'b0;
	else if (transfer_data & (width == (IMAGE_WIDTH - 1)))
		line_toggle <= line_toggle ^ 1'b1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_in_ready	= stream_out_ready | ~stream_out_valid;

// Internal Assignments
assign transfer_data	= stream_in_valid & stream_in_ready;

assign red				= last_stream_in_data;
assign green			= {1'b0, last_shift_reg_data} + {1'b0, stream_in_data};
assign blue				= shift_reg_data;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altshift_taps bayern_pattern_shift_reg (
	// Inputs
	.clock		(clk),

	.clken		(transfer_data),
	.shiftin		(stream_in_data),
	
	.aclr 		(),
	
	// Bidirectionals
	
	// Outputs
	.shiftout	(shift_reg_data)

	// synopsys translate_off
	,
	.taps			()
	
	// synopsys translate_on
);
defparam
	bayern_pattern_shift_reg.lpm_hint			= "RAM_BLOCK_TYPE=M4K",
	bayern_pattern_shift_reg.lpm_type			= "altshift_taps",
	bayern_pattern_shift_reg.number_of_taps	= 1,
	bayern_pattern_shift_reg.tap_distance		= IMAGE_WIDTH,
	bayern_pattern_shift_reg.width				= 8;

endmodule

