#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> /* for sleep() */

#define PI 3.14159265358979323846264338327950288
#define SAMPLE_RATE 200000
#define BUF_SIZE 2000
#define VOLUME 90000000

#define BUF_THRESHOLD 96		// 75% of 128 word buffer

void check_KEYs( int *, int *, int * );

/********************************************************************************
 * This program demonstrates use of the media ports in the DE2 Media Computer
 *
 * It performs the following:
 *  	1. records audio for about 10 seconds when KEY[1] is pressed. LEDG[0] is
 *  	   lit while recording
 * 	2. plays the recorded audio when KEY[2] is pressed. LEDG[1] is lit while
 * 	   playing
 * 	3. Draws a blue box on the VGA display, and places a text string inside
 * 	   the box
 * 	4. Shows a text message on the LCD display
 * 	5. Displays the last three bytes of data received from the PS/2 port
 * 	   on the HEX displays on the DE2 board
********************************************************************************/
int main(void)
{
	/* Declare volatile pointers to I/O registers (volatile means that IO load
	   and store instructions will be used to access these pointer locations,
	   instead of regular memory loads and stores) */
  	volatile int * green_LED_ptr = (int *) 0x10000010;		// green LED address
	volatile int * audio_ptr = (int *) 0x10003040;			// audio port address

	/* used for audio record/playback */
	int fifospace, leftdata, rightdata;
	int record = 0, play = 0;
	int buffer_index = 0;
	int FREQUENCY = 2000;
	float left_buffer[BUF_SIZE];
	float right_buffer[BUF_SIZE];

	/* read and echo audio data */
	record = 0;
	play = 0;

	double t;

	while(1)
	{
		*(green_LED_ptr) = 0x1;					// turn on LEDG[0]
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
			if ( (fifospace & 0x000000FF) > BUF_THRESHOLD ) 	// check RARC
			{
				// store data until the the audio-in FIFO is empty or the buffer is full
				while ((fifospace & 0x000000FF) && (buffer_index < BUF_SIZE) || (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE))
				{
					//left_buffer[buffer_index] = *(audio_ptr + 2);
					//right_buffer[buffer_index] = *(audio_ptr + 3);
					//++buffer_index;

						//for (int i = 0; i < 2; i++) {

					    t = (double)buffer_index/(double)SAMPLE_RATE;
					    	for (int x = 0; x < 15; x++) {
					    		left_buffer[buffer_index] = (sin(2 * PI * FREQUENCY * t)) * VOLUME;
					    		right_buffer[buffer_index] = (sin(2 * PI * FREQUENCY * t)) * VOLUME;

					    		buffer_index++;
					    	}
						//}

					  //left_buffer[buffer_index] = 1000000000 * sin(2 * M_PI * frequency * );
					  //right_buffer[buffer_index] = sin((((2 * M_PI) * (frequency / sampling_frequency))) * buffer_index) * 10000000000;
					  //++buffer_index;

					  printf("%d\n",buffer_index);

					//fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
				}
				//buffer_index = 0; //hier kom ik nooit
				while(1) {
					for (int y = 0; y < buffer_index; y++) {
						*(audio_ptr + 2) = left_buffer[y];
						*(audio_ptr + 3) = right_buffer[y];
					}
				}
		}
	}
}

/****************************************************************************************
 * Subroutine to read KEYs
****************************************************************************************/
void check_KEYs(int * KEY1, int * KEY2, int * counter)
{
	volatile int * KEY_ptr = (int *) 0x10000050;		// pushbutton KEY address
	volatile int * audio_ptr = (int *) 0x10003040;	// audio port address
	int KEY_value;

	KEY_value = *(KEY_ptr); 				// read the pushbutton KEY values
	while (*KEY_ptr);							// wait for pushbutton KEY release

	if (KEY_value == 0x2)					// check KEY1
	{
		// reset counter to start recording
		*counter = 0;
		// clear audio-in FIFO
		*(audio_ptr) = 0x4;
		*(audio_ptr) = 0x0;

		*KEY1 = 1;
	}
	else if (KEY_value == 0x4)				// check KEY2
	{
		// reset counter to start playback
		*counter = 0;
		// clear audio-out FIFO
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;

		*KEY2 = 1;
	}
}
