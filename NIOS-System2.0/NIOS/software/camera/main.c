#include "io.h"
#include <stdio.h>

/**
 * Main, what else?
 * Gets LEDs pattern from switchers.
 * Sets LEDs register according to the pattern.
 **/
int main() {

    while (1) {                                   // infinite loop
        int * cam_data = (int *) 0x08200900;
        printf("%d\n", (*cam_data));
    }

    return 0;
}
