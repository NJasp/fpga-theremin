#include <stdio.h>
#include <math.h>
#include "includes.h"
#include "altera_up_avalon_audio.h"

/* Definition of Task Stacks */
#define   TASK_STACKSIZE       2048
OS_STK    taskSound_stk[TASK_STACKSIZE];
OS_STK    taskFreq_stk[TASK_STACKSIZE];
int freq = 1;

/* Definition of Task Priorities */
#define TASK1_PRIORITY      1
#define TASK2_PRIORITY      2
#define AMP_VAL             10000

alt_up_audio_dev *audio_dev;

void taskSound(void* pdata) {
    int buf;
    double i = 0;

    for(;;) {
    	int words = alt_up_audio_write_fifo_space(audio_dev, ALT_UP_AUDIO_RIGHT);
    	alt_up_audio_write_fifo_space(audio_dev, ALT_UP_AUDIO_LEFT);
		while(i<2*M_PI) {
			buf = (int) sin(i*freq)*AMP_VAL;
			i+=.1;
            alt_up_audio_write_fifo(audio_dev, &buf, --words, ALT_UP_AUDIO_RIGHT);
            alt_up_audio_write_fifo(audio_dev, &buf, words, ALT_UP_AUDIO_LEFT);
            alt_up_audio_play_r(audio_dev, &buf, words);
            alt_up_audio_play_l(audio_dev, &buf, words);
		}
        
		OSTimeDlyHMSM(0, 0, 0, 5);
    }
}

void taskFreq(void *pdata) {
	for(;;) {
		OSTimeDlyHMSM(0, 0, 0, 100);
		printf("incremented frequencymodifier: %d", ++freq);
	}
}

/* The main function creates two task and starts multi-tasking */
int main(void) {
	audio_dev = alt_up_audio_open_dev ("/dev/Audio_Subsystem_Audio");
	if ( audio_dev == NULL) {
		printf ("Error: could not open audio device\n");
		return -1;
	}
	else
		printf ("Opened audio device\n");

  OSTaskCreateExt(taskSound, NULL, (void *)&taskSound_stk[TASK_STACKSIZE-1],
                  TASK1_PRIORITY, TASK1_PRIORITY, taskSound_stk, TASK_STACKSIZE, NULL, 0);
  OSTaskCreateExt(taskFreq, NULL, (void *)&taskFreq_stk[TASK_STACKSIZE-1],
                    TASK2_PRIORITY, TASK2_PRIORITY, taskFreq_stk, TASK_STACKSIZE, NULL, 0);

  OSStart();
  return 0;
}
