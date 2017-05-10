#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> /* for sleep() */

#define PI 3.14159265358979323846264338327950288
#define FREQUENCY 440
#define SAMPLE_RATE 48000
#define BUF_SIZE SAMPLE_RATE
#define VOLUME 100000000

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
	float left_buffer[BUF_SIZE];
	float right_buffer[BUF_SIZE];

	/* read and echo audio data */
	record = 0;
	play = 0;

	double t;

	while(1)
	{
		check_KEYs ( &record, &play, &buffer_index );
		if (record)
		{
			*(green_LED_ptr) = 0x1;					// turn on LEDG[0]
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
			if ( (fifospace & 0x000000FF) > BUF_THRESHOLD ) 	// check RARC
			{
				// store data until the the audio-in FIFO is empty or the buffer is full
				while ( (fifospace & 0x000000FF) && (buffer_index < BUF_SIZE) )
				{
					//left_buffer[buffer_index] = *(audio_ptr + 2);
					//right_buffer[buffer_index] = *(audio_ptr + 3);
					//++buffer_index;

					    t = (double)buffer_index/(double)SAMPLE_RATE;
					    left_buffer[buffer_index] = (sin(2 * PI * FREQUENCY * t)) * VOLUME;
					    right_buffer[buffer_index] = (sin(2 * PI * FREQUENCY * t)) * VOLUME;

					  //left_buffer[buffer_index] = 1000000000 * sin(2 * M_PI * frequency * );
					  //right_buffer[buffer_index] = sin((((2 * M_PI) * (frequency / sampling_frequency))) * buffer_index) * 10000000000;
					  //++buffer_index;

					  printf("%d\n",buffer_index);

					  buffer_index++;

					if (buffer_index == BUF_SIZE)
					{
						// done recording
						record = 0;
						*(green_LED_ptr) = 0x0;				// turn off LEDG
					}
					fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
				}
			}
		}
		else if (play)
		{
			*(green_LED_ptr) = 0x2;					// turn on LEDG_1
			fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
			if ( (fifospace & 0x00FF0000) > BUF_THRESHOLD ) 	// check WSRC
			{
				// output data until the buffer is empty or the audio-out FIFO is full
				while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
				{
					*(audio_ptr + 2) = left_buffer[buffer_index];
					*(audio_ptr + 3) = right_buffer[buffer_index];
					++buffer_index;

					if (buffer_index == BUF_SIZE)
					{
						// done playback
						play = 0;
						*(green_LED_ptr) = 0x0;				// turn off LEDG
					}
					fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
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
