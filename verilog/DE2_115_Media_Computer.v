
module DE2_115_Media_Computer (
	// Inputs
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	TD_CLK27,
	KEY,
	SW,

	//  Communication
	UART_RXD,
	
	// Audio
	AUD_ADCDAT,
	
	// IrDA
	IRDA_RXD,

	// Video In
	TD_DATA,
	TD_HS,
	TD_VS,
	
	// USB
	OTG_INT,

/*****************************************************************************/
	// Bidirectionals
	GPIO,

	// Memory (SRAM)
	SRAM_DQ,
	
	// Memory (SDRAM)
	DRAM_DQ,

	// PS2 Port
	PS2_KBCLK,
	PS2_KBDAT,
	PS2_MSCLK,
	PS2_MSDAT,
	
	// Audio
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,
	
	// Char LCD 16x2
	LCD_DATA,

	// AV Config
	I2C_SDAT,
	
	// SD Card
	SD_CMD,
	SD_DAT,
	
	// Flash
	FL_DQ,
	
	//USB
	OTG_DATA,
	
/*****************************************************************************/
	// Outputs
	
	// 	Simple
	LEDG,
	LEDR,

	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,
	
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N,
	
	//  Communication
	UART_TXD,
	
	// Memory (SDRAM)
	DRAM_ADDR,
	
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_RAS_N,
	DRAM_CLK,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_WE_N,
	DRAM_DQM,
	
	// Audio
	AUD_XCK,
	AUD_DACDAT,
	
	// VGA
	VGA_CLK,
	VGA_HS,
	VGA_VS,
	VGA_BLANK_N,
	VGA_SYNC_N,
	VGA_R,
	VGA_G,
	VGA_B,

	// Char LCD 16x2
	LCD_ON,
	LCD_BLON,
	LCD_EN,
	LCD_RS,
	LCD_RW,
	
	// AV Config
	I2C_SCLK,
	
	// SD Card
	SD_CLK,
	
	// Flash
	FL_ADDR,
   FL_CE_N,
	FL_OE_N,
	FL_RESET_N,
	FL_WE_N,
		
	// Video In
	TD_RESET_N,
	
	// USB
	OTG_ADDR,
	OTG_CS_N,
	OTG_OE_N,
	OTG_RST_N,
	OTG_WE_N,
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				CLOCK_50;
input				CLOCK2_50;
input				CLOCK3_50;
input				TD_CLK27;
input		[ 3: 0]	KEY;
input		[17: 0]	SW;


//  Communication
input				UART_RXD;

//  Audio
input				AUD_ADCDAT;

//  IrDA
input				IRDA_RXD;

// Video In
input 	[7:0]	TD_DATA;
input   			TD_HS;
input  			TD_VS;

// USB
input       [ 1: 0] OTG_INT;

// Bidirectionals
inout		[35: 0]	GPIO;

// 	Memory (SRAM)
inout		[15: 0]	SRAM_DQ;

//  Memory (SDRAM)
inout		[31: 0]	DRAM_DQ;

//  PS2 Port
inout				PS2_KBCLK;
inout				PS2_KBDAT;
inout				PS2_MSCLK;
inout				PS2_MSDAT;

//  Audio
inout				AUD_BCLK;
inout				AUD_ADCLRCK;
inout				AUD_DACLRCK;

//  AV Config
inout				I2C_SDAT;

//  Char LCD 16x2
inout		[ 7: 0]	LCD_DATA;

// SD Card
inout 			SD_CMD;
inout 	[ 3: 0]  SD_DAT;

// Flash
inout 	[ 7: 0]  FL_DQ; 

// USB
inout    [15: 0]  OTG_DATA;

// Outputs
output				TD_RESET_N;

// 	Simple
output		[ 8: 0]	LEDG;
output		[17: 0]	LEDR;

output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;
output		[ 6: 0]	HEX6;
output		[ 6: 0]	HEX7;

// 	Memory (SRAM)
output		[19: 0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

//  Communication
output				UART_TXD;

//  Memory (SDRAM)
output		[12: 0]	DRAM_ADDR;

output		[ 1: 0]	DRAM_BA;
output				DRAM_CAS_N;
output				DRAM_RAS_N;
output				DRAM_CLK;
output				DRAM_CKE;
output				DRAM_CS_N;
output				DRAM_WE_N;
output		[ 3: 0]	DRAM_DQM;

//  Audio
output				AUD_XCK;
output				AUD_DACDAT;

//  VGA
output				VGA_CLK;
output				VGA_HS;
output				VGA_VS;
output				VGA_BLANK_N;
output				VGA_SYNC_N;
output		[ 7: 0]	VGA_R;
output		[ 7: 0]	VGA_G;
output		[ 7: 0]	VGA_B;

//  Char LCD 16x2
output				LCD_ON;
output				LCD_BLON;
output				LCD_EN;
output				LCD_RS;
output				LCD_RW;

//  AV Config
output				I2C_SCLK;

//  SD Card
output 				SD_CLK;

//  Flash
output 		[22: 0]	FL_ADDR;
output 				FL_CE_N;
output				FL_OE_N;
output				FL_RESET_N;
output				FL_WE_N;

//USB
output      [ 1: 0]  OTG_ADDR;
output				OTG_CS_N;
output				OTG_OE_N;
output				OTG_RST_N;
output				OTG_WE_N;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign GPIO[ 0]		= 1'bZ;
assign GPIO[ 2]		= 1'bZ;
assign GPIO[16]		= 1'bZ;
assign GPIO[18]		= 1'bZ;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
nios_system NiosII (
	// 1) global signals:
	.system_pll_ref_clk_clk			(CLOCK_50),
	.system_pll_ref_reset_reset	(~KEY[0]),
	.sdram_clk_clk						(DRAM_CLK),
	
	// SDRAM
	.sdram_addr							(DRAM_ADDR),
	.sdram_ba							(DRAM_BA),
	.sdram_cas_n						(DRAM_CAS_N),
	.sdram_cke							(DRAM_CKE),
	.sdram_cs_n							(DRAM_CS_N),
	.sdram_dq							(DRAM_DQ),
	.sdram_dqm							(DRAM_DQM),
	.sdram_ras_n						(DRAM_RAS_N),
	.sdram_we_n							(DRAM_WE_N),
	
	// SRAM
	.sram_DQ								(SRAM_DQ),
	.sram_ADDR							(SRAM_ADDR),
	.sram_LB_N							(SRAM_LB_N),
	.sram_UB_N							(SRAM_UB_N),
	.sram_CE_N							(SRAM_CE_N),
	.sram_OE_N							(SRAM_OE_N),
	.sram_WE_N							(SRAM_WE_N),

	// SD Card
	.sd_card_b_SD_cmd					(SD_CMD),
   .sd_card_b_SD_dat					(SD_DAT[0]),
   .sd_card_b_SD_dat3				(SD_DAT[3]),
   .sd_card_o_SD_clock				(SD_CLK),
	
	// Flash
	.flash_ADDR							(FL_ADDR),
   .flash_CE_N							(FL_CE_N),
   .flash_OE_N							(FL_OE_N),
   .flash_WE_N							(FL_WE_N),
   .flash_RST_N						(FL_RESET_N),
   .flash_DQ							(FL_DQ),   
	
	// Red LEDs
	.red_leds_export					(LEDR),
	
	// Green LEDs
	.green_leds_export				(LEDG),

	// HEX3 HEX0
	.hex3_hex0_HEX0					(HEX0),
	.hex3_hex0_HEX1					(HEX1),
	.hex3_hex0_HEX2					(HEX2),
	.hex3_hex0_HEX3					(HEX3),
	
	// HEX7 HEX4
	.hex7_hex4_HEX4					(HEX4),
	.hex7_hex4_HEX5					(HEX5),
	.hex7_hex4_HEX6					(HEX6),
	.hex7_hex4_HEX7					(HEX7),

	// Slider switches
	.slider_switches_export			(SW),

	// Pushbuttons
	.pushbuttons_export				({KEY[3:1], 1'b1}),

	// Expansion JP5
	.expansion_jp5_export			({GPIO[35:19], GPIO[17], GPIO[15:3], GPIO[1]}),

	// PS2 Port
	.ps2_port_CLK						(PS2_KBCLK),
	.ps2_port_DAT						(PS2_KBDAT),
	
	// PS2 Port Dual
	.ps2_port_dual_CLK				(PS2_MSCLK),
	.ps2_port_dual_DAT				(PS2_MSDAT),
	
	// USB             
	.usb_INT1							(OTG_INT[1]),
   .usb_DATA							(OTG_DATA),
   .usb_RST_N							(OTG_RST_N),
   .usb_ADDR							(OTG_ADDR),
   .usb_CS_N							(OTG_CS_N),
   .usb_RD_N							(OTG_OE_N),
   .usb_WR_N							(OTG_WE_N),
   .usb_INT0							(OTG_INT[0]),

	// Serial port
	.serial_port_RXD					(UART_RXD),
	.serial_port_TXD					(UART_TXD),
	
	// IRDA
	.irda_TXD							(),
	.irda_RXD							(IRDA_RXD),
	
	// AV Config
	.av_config_SDAT					(I2C_SDAT),
	.av_config_SCLK					(I2C_SCLK),
	
	// VGA Subsystem
	.vga_CLK								(VGA_CLK),
	.vga_HS								(VGA_HS),
	.vga_VS								(VGA_VS),
	.vga_BLANK							(VGA_BLANK_N),
	.vga_SYNC							(VGA_SYNC_N),
	.vga_R								(VGA_R),
	.vga_G								(VGA_G),
	.vga_B								(VGA_B),
	.vga_pll_ref_clk_clk				(CLOCK2_50),
	.vga_pll_ref_reset_reset		(~KEY[0]),
	
	// Audio Subsystem
	.audio_pll_ref_clk_clk			(CLOCK3_50),
	.audio_pll_ref_reset_reset		(~KEY[0]),
	.audio_clk_clk						(AUD_XCK),
	.audio_ADCDAT						(AUD_ADCDAT),
	.audio_BCLK							(AUD_BCLK),
	.audio_ADCLRCK						(AUD_ADCLRCK),
	.audio_DACLRCK						(AUD_DACLRCK),
	.audio_DACDAT						(AUD_DACDAT),

	// Character LCD 16x2
	.char_lcd_DATA						(LCD_DATA),
	.char_lcd_ON						(LCD_ON),
	.char_lcd_BLON						(LCD_BLON),
	.char_lcd_EN						(LCD_EN),
	.char_lcd_RS						(LCD_RS),
	.char_lcd_RW						(LCD_RW),

	// Video In Subsystem
	.video_in_TD_CLK27				(TD_CLK27),  
   .video_in_TD_DATA					(TD_DATA),   
   .video_in_TD_HS					(TD_HS),     
   .video_in_TD_VS					(TD_VS),     
   .video_in_TD_RESET				(TD_RESET_N),
	.video_in_clk27_reset			(~KEY[0]),
   .video_in_overflow_flag			()
	
);

endmodule

