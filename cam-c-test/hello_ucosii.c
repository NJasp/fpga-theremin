#include "address_map_nios2.h"
#include "nios2_ctrl_reg_macros.h"

/* function prototypes */
void Test_expansion_ports (void);


/* global variables */

int	display_buffer[] = { 0, 0, 0 };	/* Buffer to hold values to display on the hex display.
 													 * The buffer contains 3 full-words: before, visible,
													 * after */
int	shift_direction = 0;					// display scrolling direction (right = 1, left = 0)
/* SEVEN_SEGMENT_DECODE_TABLE gives the on/off settings for all segments in
 * a single 7-seg display in the DE2-115 computer, for the characters
 * 'blank', 1, 2, 3, 4, S, 6, r, o, 9, A, P, C, d, E, F. These values obey
 * the digit indexes on the DE2-115 board 7-seg displays, and the assignment of
 * these signals to parallel port pins in the DE2-115 computer
 */
char	seven_seg_decode_table[] = {	0x00, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x50,
		  										0x5C, 0x67, 0x77, 0x73, 0x39, 0x5E, 0x79, 0x71 };
char	hex_segments[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
int	green_LED_pattern = 0;				// used for a flashing pattern on the green lights
int	eight_sec = 0;							/* used to keep track of a delay, which is 8 seconds
													 * for the default display scrolling speed */
int	display_toggle = 0;					// toggles display of the text dE2 115 and PASSED
int LED_toggle = 0;                     //toggles display of the red LEDs

/***************************************************************************************
 * Main program: exercises various features of the computer, as a test
 * and to provide an example.
 * It performs the following:
 * 1. tests the SRAM repeatedly
 * 2. scrolls some text on the hex displays, which alternates between "dE2 115" and
 *    "PASSEd" if there is no SRAM error detected, and "Error" if an error is detected
 * 3. flashes the green LEDs. The speed of flashing and scrolling for 2. is controlled
 *    by timer interrupts
 * 4. connects the SW switches to red LEDs
 * 5. handles pushbutton interrupts: pushing KEY1 speeds up the scrolling of text,
 *    pushing KEY2 slows it down, and pushing KEY3 stops the scrolling
 * 6. can test the GPIO JP5 expansion ports, if any odd-numbered data pins and
 *    the even-numbered data pins are connected together, it will toggle the reg LEDs.
 *    The pin assignments of the port is listed below.
 * 7. echos text received from the JTAG UART (such as text typed in the
 *    terminal window of the Monitor Program) to the serial port UART, and vice versa

 * The 32 data pins' (D0 to D31) distribution on the 40-pin expansion port:
      X     .   .   D0
      X     .   .   D1
     D2     .   .   D3
     D4     .   .   D5
     D6     .   .   D7
     5V     .   .   GND
     D8     .   .   D9
     D10    .   .   D11
     D12    .   .   D13
      X     .   .   D14
      X     .   .   D15
     D16    .   .   D17
     D18    .   .   D19
     D20    .   .   D21
     3.3V   .   .   GND
     D22    .   .   D23
     D24    .   .   D25
     D26    .   .   D27
     D28    .   .   D29
     D30    .   .   D31

****************************************************************************************/
int main(void)
{
	/* Declare volatile pointers to I/O registers (volatile means that IO load
	 * and store instructions will be used to access these pointer locations,
	 * instead of regular memory loads and stores)
	*/
	volatile int * interval_timer_ptr = (int *) TIMER_BASE;
	volatile int * pushbutton_ptr = (int *) KEY_BASE;

	/* initialize 7-segment displays buffer (dE2 115 just before being visible on left side) */
	display_buffer[0] = 0xdE20115;
	display_buffer[1] = 0x0;
	display_buffer[2] = 0x0;

	green_LED_pattern = 0x55555555;	// used for a flashing pattern on the green lights
	eight_sec = 0;							// initialize 8-second delay counter
	display_toggle = 0;					// display initialized to scroll the text dE2 115
	shift_direction = 1;					// initial shift direction is to the right

	*(interval_timer_ptr + 1) = 0x7;	// Set START = 1, CONT = 1, ITO = 1
	*(pushbutton_ptr + 2) = 0xE; 		// Set the 3 interrupt mask bits to 1 (bit 0 is Nios II reset)


	NIOS2_WRITE_IENABLE( 0x3 | 0x8000 );	// Set interrupt mask for the interval timer, pushbuttons and expansion port (JP5)
	NIOS2_WRITE_STATUS( 1 );			// Enable Nios II interrupts
	Test_expansion_ports();
	return 0;
}

void Test_expansion_ports( void )
{
  	volatile int * JP5_EXPANSION_ptr = (int *) EXPANSION_JP5_BASE;

    // set all pins to be outputs and restore 1 to all pins
    *(JP5_EXPANSION_ptr+1) = 0xffffffff;
    *(JP5_EXPANSION_ptr) = 0xffffffff;

    // set the even-numbered pins to be output pins and write 0 to all output pins
	*(JP5_EXPANSION_ptr+1) = 0x55555555;
    *(JP5_EXPANSION_ptr) = 0x0;

    //read the input pins value
    volatile int odd_in = *(JP5_EXPANSION_ptr);
    printf("input pins useless value: %d", odd_in);

     //if one input pin connected to one output pin, its value would be drawn to 0.
    int odd_correct = (odd_in != 0xaaaaaaaa) ? 1 : 0;


    // set all pins to be outputs and restore 1 to all pins
    *(JP5_EXPANSION_ptr+1) = 0xffffffff;
    *(JP5_EXPANSION_ptr) = 0xffffffff;

    //set the odd-numbered pins to be the output pins and write 0 to all output pins
	*(JP5_EXPANSION_ptr+1) = 0xaaaaaaaa;
    *(JP5_EXPANSION_ptr) = 0x0;

    //read the input pins value
    volatile int even_in = *(JP5_EXPANSION_ptr);

    //if one input pin connected to one output pin, its value would be drawn to 0.
    int even_correct = (even_in != 0x55555555) ? 1 : 0;

    //if both of input and output function correctly for the two pins, toggle the red LEDs
    LED_toggle = odd_correct && even_correct;

}

