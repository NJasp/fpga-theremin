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
 * This module can read and/or write data to a parallel I/O port based        *
 *  on various user selected parameters. It has some predefined               *
 *  configurations for some devices on the Altera DE boards.                  *
 *                                                                            *
 ******************************************************************************/

module nios_system_Pushbuttons (
   // Inputs
	clk,
	reset,
	
	address,
	byteenable,
	chipselect,
	read,
	write,
	writedata,

	KEY,

	// Bidirectionals


	// Outputs

	irq,
	readdata
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// DW represents the Data Width minus 1
parameter DW = 3;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	address;
input			[ 3: 0]	byteenable;
input						chipselect;
input						read;
input						write;
input			[31: 0]	writedata;

input			[DW: 0]	KEY;

// Bidirectionals

// Outputs

output reg				irq;
output reg	[31: 0]	readdata;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[DW: 0]	new_capture;

// Internal Registers
reg			[31: 0]	data;
reg			[31: 0]	interrupt;
reg			[DW: 0]	capture;

reg			[DW: 0]	data_in;

reg			[DW: 0]	last_data_in;

// State Machine Registers

// Internal Variables
genvar					i;


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Input Registers
always @(posedge clk)
begin
	data_in <= ~KEY;
end

// Output Registers
always @(posedge clk)
begin
	if (reset == 1'b1)
		irq <= 1'b0;
	else
		irq <= (|(interrupt[DW:0] & capture));
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 2'h0)
			readdata <= {{(31-DW){1'b0}}, data_in};
		else if (address == 2'h2)
			readdata <= {{(31-DW){1'b0}}, interrupt[DW:0]};
		else if (address == 2'h3)
			readdata <= {{(31-DW){1'b0}}, capture};
		else
			readdata <= 32'h00000000;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset == 1'b1)
		data <= {(DW + 1){1'b0}};
	else if ((chipselect == 1'b1) &&
			(write == 1'b1) &&
			(address == 2'h0))
	begin
		if (byteenable[0])
			data[ 7: 0] <= writedata[ 7: 0];
			
		if (byteenable[1])
			data[15: 8] <= writedata[15: 8];

		if (byteenable[2])
			data[23:16] <= writedata[23:16];
			
		if (byteenable[3])
			data[31:24] <= writedata[31:24];
	end
end


always @(posedge clk)
begin
	if (reset == 1'b1)
		interrupt <= {(DW + 1){1'b0}};
	else if ((chipselect == 1'b1) &&
			(write == 1'b1) &&
			(address == 2'h2))
	begin
		if (byteenable[0])
			interrupt[ 7: 0] <= writedata[ 7: 0];
			
		if (byteenable[1])
			interrupt[15: 8] <= writedata[15: 8];

		if (byteenable[2])
			interrupt[23:16] <= writedata[23:16];
			
		if (byteenable[3])
			interrupt[31:24] <= writedata[31:24];
	end
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		capture <= {(DW + 1){1'b0}};
	else if ((chipselect == 1'b1) &&
			(write == 1'b1) &&
			(address == 2'h3))
		capture <= {(DW + 1){1'b0}};
	else
		capture <= capture | new_capture;
end


always @(posedge clk)
begin
	if (reset == 1'b1)
		last_data_in <= {DW{1'b0}};
	else
		last_data_in <= data_in;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments


// Internal Assignments
assign new_capture = ~data_in & last_data_in;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

