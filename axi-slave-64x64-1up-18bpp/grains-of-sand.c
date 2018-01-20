#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "xiic.h"

#include "lis2ds12.h"

#define DISPLAY_WIDTH  64
#define DISPLAY_HEIGHT 64

#define FPGA_PANEL_ADDR_REG		(XPAR_MATRIX_64X64_1UP_18BPP_0_BASEADDR + 0x00)
#define FPGA_PANEL_DATA_REG		(XPAR_MATRIX_64X64_1UP_18BPP_0_BASEADDR + 0x04)
#define FPGA_PANEL_BUFFER_REG	(XPAR_MATRIX_64X64_1UP_18BPP_0_BASEADDR + 0x08)
#define FPGA_PANEL_DIMMER_REG	(XPAR_MATRIX_64X64_1UP_18BPP_0_BASEADDR + 0x0c)
#define FPGA_PANEL_TIMER_0_REG  (XPAR_MATRIX_64X64_1UP_18BPP_0_BASEADDR + 0x10)

#define MAKE_COLOR(r,g,b) (((r)&0x3f)<<12)+(((g)&0x3f)<<6)+((b)&0x3f)

void WriteLevels (void);
uint32_t TranslateHue (int32_t hue);
uint32_t TranslateHueValue (int32_t hue, float value);

void grains_Init (void);
void grains_Next (void);

int gBuffer = 0;
uint32_t gLevels[DISPLAY_WIDTH*DISPLAY_HEIGHT];

static const uint8_t gammaLut[] = {
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
	0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,
	1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
	1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
	2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,
	4,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5,  6,  6,  6,  6,  6,
	6,  6,  7,  7,  7,  7,  7,  7,  8,  8,  8,  8,  8,  9,  9,  9,
	9,  9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 12,
   13, 13, 13, 13, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17,
   17, 17, 18, 18, 18, 19, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22,
   22, 23, 23, 23, 24, 24, 25, 25, 25, 26, 26, 26, 27, 27, 28, 28,
   28, 29, 29, 30, 30, 31, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35,
   36, 36, 37, 37, 38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43,
   44, 44, 45, 45, 46, 47, 47, 48, 48, 49, 50, 50, 51, 51, 52, 53,
   53, 54, 54, 55, 56, 56, 57, 58, 58, 59, 60, 60, 61, 62, 62, 63
};


int main()
{
	int row, col;

    init_platform();

    xil_printf ("Hello, world!\n\r");
    xil_printf ("%08x %08x %08x %08x\n\r",
    		Xil_In32 (FPGA_PANEL_ADDR_REG),
			Xil_In32 (FPGA_PANEL_DATA_REG),
			Xil_In32 (FPGA_PANEL_BUFFER_REG),
			Xil_In32 (FPGA_PANEL_DIMMER_REG));

    // initialize levels to all off
	for (row = 0; row < DISPLAY_HEIGHT; row++) {
        for (col = 0; col < DISPLAY_WIDTH; col++) {
            gLevels[row*DISPLAY_WIDTH + col] = MAKE_COLOR(0,0,0);
        }
    }

    // send levels to board
    WriteLevels ();

    // set for full brightness
    Xil_Out32 (FPGA_PANEL_DIMMER_REG, 0x100);

	// initialize accelerometer
	lis2ds12_Init ();

	// initialize grains of sand
	grains_Init ();

    // no delay on first time around loop
	Xil_Out32 (FPGA_PANEL_TIMER_0_REG, 0);

	// loop forever
	while (1) {

		// wait for timer to expire
    	while (Xil_In32 (FPGA_PANEL_TIMER_0_REG) != 0) {
    	}

    	// reset timer
    	Xil_Out32 (FPGA_PANEL_TIMER_0_REG, 1000000);

    	// write levels to display
    	WriteLevels ();

    	// compute next frame
    	xil_printf (".");
    	grains_Next ();
    }

	cleanup_platform();

    return 0;
}


void WriteLevels (void)
{
    int base, row, col;

	// ping pong between buffers
	if (gBuffer == 0) {
		base = 0x0000;
	} else {
		base = 0x1000;
	}

    // write data to selected buffer
    for (row = 0; row < DISPLAY_HEIGHT; row++) {
		Xil_Out32 (FPGA_PANEL_ADDR_REG, base + DISPLAY_WIDTH * row);
        for (col = 0; col < DISPLAY_WIDTH; col++) {
        	Xil_Out32 (FPGA_PANEL_DATA_REG, gLevels[row*DISPLAY_WIDTH+col]);
        }
    }

    // make that buffer active
    if (gBuffer == 0) {
    	Xil_Out32 (FPGA_PANEL_BUFFER_REG, 0x0000);
        gBuffer = 1;
    } else {
    	Xil_Out32 (FPGA_PANEL_BUFFER_REG, 0x0001);
        gBuffer = 0;
    }
}


uint32_t TranslateHue (int32_t hue)
{
    uint8_t hi, lo;
    uint8_t r, g, b;

    hi = hue >> 8;
    lo = hue & 0xff;

    switch (hi) {
        case 0: r = 0xff;    g = 0;       b = lo;      break;
        case 1: r = 0xff-lo; g = 0;       b = 0xff;    break;
        case 2: r = 0;       g = lo;      b = 0xff;    break;
        case 3: r = 0;       g = 0xff;    b = 0xff-lo; break;
        case 4: r = lo;      g = 0xff;    b = 0;       break;
        case 5: r = 0xff;    g = 0xff-lo; b = 0;       break;
        default: r = 0; g = 0; b = 0; break;
    }

    r = gammaLut[r];
    g = gammaLut[g];
    b = gammaLut[b];

    return MAKE_COLOR (r,g,b);
}


uint32_t TranslateHueValue (int32_t hue, float value)
{
    uint8_t hi, lo;
    uint8_t r, g, b;

    hi = hue >> 8;
    lo = hue & 0xff;

    switch (hi) {
        case 0: r = 0xff;    g = 0;       b = lo;      break;
        case 1: r = 0xff-lo, g = 0;       b = 0xff;    break;
        case 2: r = 0;       g = lo;      b = 0xff;    break;
        case 3: r = 0;       g = 0xff;    b = 0xff-lo; break;
        case 4: r = lo;      g = 0xff;    b = 0;       break;
        case 5: r = 0xff;    g = 0xff-lo; b = 0;       break;
        default: r = 0; g = 0; b = 0; break;
    }

    r = ((float)r + 0.5) * value;
    g = ((float)g + 0.5) * value;
    b = ((float)b + 0.5) * value;

    r = gammaLut[r];
    g = gammaLut[g];
    b = gammaLut[b];

    return MAKE_COLOR (r,g,b);
}


#define N_GRAINS     100 // Number of grains of sand
#define MAX_X (DISPLAY_WIDTH  * 256 - 1) // Maximum X coordinate in grain space
#define MAX_Y (DISPLAY_HEIGHT * 256 - 1) // Maximum Y coordinate

struct Grain {
  int16_t  x,  y; // Position
  int16_t vx, vy; // Velocity
} grain[N_GRAINS];


void grains_Init (void)
{
	int i, j, idx;
	int hue;

	for (i=0; i<N_GRAINS; i++) {  // For each sand grain...
		do {
			grain[i].x = (float)random() / RAND_MAX * DISPLAY_WIDTH  * 256; // Assign random position within
			grain[i].y = (float)random() / RAND_MAX * DISPLAY_HEIGHT * 256; // the 'grain' coordinate space
			// Check if corresponding pixel position is already occupied...
			for (j=0; (j<i) && (((grain[i].x / 256) != (grain[j].x / 256)) || ((grain[i].y / 256) != (grain[j].y / 256))); j++);
		} while(j < i); // Keep retrying until a clear spot is found
		idx = (grain[i].y / 256) * DISPLAY_WIDTH + (grain[i].x / 256);
		hue = (float)random() / RAND_MAX * 1536.0;
		xil_printf("idx=%d, hue=%d\n\r",idx, hue);
		gLevels[idx] = TranslateHue (hue); // Mark it
		grain[i].vx = grain[i].vy = 0; // Initial velocity is zero
	}
}


void grains_Next (void)
{
	int16_t axi, ayi, azi;

	// Read accelerometer...
	lis2ds12_GetXYZ (&axi, &ayi, &azi);

	int16_t ax = -ayi / 256,      // Transform accelerometer axes
	ay =  axi / 256,      // to grain coordinate space
	az = abs(azi) / 2048; // Random motion factor
	az = (az >= 3) ? 1 : 4 - az;      // Clip & invert
	ax -= az;                         // Subtract motion factor from X, Y
	ay -= az;
	int16_t az2 = az * 2 + 1;         // Range of random motion to add back in

	// ...and apply 2D accel vector to grain velocities...
	int32_t v2; // Velocity squared
	float   v;  // Absolute velocity
	for(int i=0; i<N_GRAINS; i++) {
		grain[i].vx += ax + (float)random()/RAND_MAX*az2; // A little randomness makes
		grain[i].vy += ay + (float)random()/RAND_MAX*az2; // tall stacks topple better!
		// Terminal velocity (in any direction) is 256 units -- equal to
		// 1 pixel -- which keeps moving grains from passing through each other
		// and other such mayhem.  Though it takes some extra math, velocity is
		// clipped as a 2D vector (not separately-limited X & Y) so that
		// diagonal movement isn't faster
		v2 = (int32_t)grain[i].vx*grain[i].vx+(int32_t)grain[i].vy*grain[i].vy;
		if(v2 > 65536) { // If v^2 > 65536, then v > 256
			v = sqrt((float)v2); // Velocity vector magnitude
			grain[i].vx = (int)(256.0*(float)grain[i].vx/v); // Maintain heading
			grain[i].vy = (int)(256.0*(float)grain[i].vy/v); // Limit magnitude
		}
	}

	// ...then update position of each grain, one at a time, checking for
	// collisions and having them react.  This really seems like it shouldn't
	// work, as only one grain is considered at a time while the rest are
	// regarded as stationary.  Yet this naive algorithm, taking many not-
	// technically-quite-correct steps, and repeated quickly enough,
	// visually integrates into something that somewhat resembles physics.
	// (I'd initially tried implementing this as a bunch of concurrent and
	// "realistic" elastic collisions among circular grains, but the
	// calculations and volument of code quickly got out of hand for both
	// the tiny 8-bit AVR microcontroller and my tiny dinosaur brain.)

	uint16_t        i, oldidx, newidx, delta;
	int16_t        newx, newy;

	for(i=0; i<N_GRAINS; i++) {
		newx = grain[i].x + grain[i].vx; // New position in grain space
		newy = grain[i].y + grain[i].vy;
		if(newx > MAX_X) {               // If grain would go out of bounds
			  newx         = MAX_X;          // keep it inside, and
			  grain[i].vx /= -2;             // give a slight bounce off the wall
		} else if(newx < 0) {
			  newx         = 0;
			  grain[i].vx /= -2;
		}
		if(newy > MAX_Y) {
			  newy         = MAX_Y;
			  grain[i].vy /= -2;
		} else if(newy < 0) {
			  newy         = 0;
			  grain[i].vy /= -2;
		}

		oldidx = (grain[i].y/256) * DISPLAY_WIDTH + (grain[i].x/256); // Prior pixel #
		newidx = (newy      /256) * DISPLAY_WIDTH + (newx      /256); // New pixel #

		if((oldidx != newidx) && // If grain is moving to a new pixel...
				gLevels[newidx]) {       // but if that pixel is already occupied...
			delta = abs(newidx - oldidx); // What direction when blocked?
			if(delta == 1) {            // 1 pixel left or right)
				newx         = grain[i].x;  // Cancel X motion
				grain[i].vx /= -2;          // and bounce X velocity (Y is OK)
				newidx       = oldidx;      // No pixel change
			} else if(delta == DISPLAY_WIDTH) { // 1 pixel up or down
				newy         = grain[i].y;  // Cancel Y motion
				grain[i].vy /= -2;          // and bounce Y velocity (X is OK)
				newidx       = oldidx;      // No pixel change
			} else { // Diagonal intersection is more tricky...
				// Try skidding along just one axis of motion if possible (start w/
				// faster axis).  Because we've already established that diagonal
				// (both-axis) motion is occurring, moving on either axis alone WILL
				// change the pixel index, no need to check that again.
				if((abs(grain[i].vx) - abs(grain[i].vy)) >= 0) { // X axis is faster
					newidx = (grain[i].y / 256) * DISPLAY_WIDTH + (newx / 256);
					if(!gLevels[newidx]) { // That pixel's free!  Take it!  But...
						newy         = grain[i].y; // Cancel Y motion
						grain[i].vy /= -2;         // and bounce Y velocity
					} else { // X pixel is taken, so try Y...
						newidx = (newy / 256) * DISPLAY_WIDTH + (grain[i].x / 256);
						if(!gLevels[newidx]) { // Pixel is free, take it, but first...
							newx         = grain[i].x; // Cancel X motion
							grain[i].vx /= -2;         // and bounce X velocity
						} else { // Both spots are occupied
							newx         = grain[i].x; // Cancel X & Y motion
							newy         = grain[i].y;
							grain[i].vx /= -2;         // Bounce X & Y velocity
							grain[i].vy /= -2;
							newidx       = oldidx;     // Not moving
						}
					}
				} else { // Y axis is faster, start there
					newidx = (newy / 256) * DISPLAY_WIDTH + (grain[i].x / 256);
					if(!gLevels[newidx]) { // Pixel's free!  Take it!  But...
						newx         = grain[i].x; // Cancel X motion
						grain[i].vy /= -2;         // and bounce X velocity
					} else { // Y pixel is taken, so try X...
						newidx = (grain[i].y / 256) * DISPLAY_WIDTH + (newx / 256);
						if(!gLevels[newidx]) { // Pixel is free, take it, but first...
							newy         = grain[i].y; // Cancel Y motion
							grain[i].vy /= -2;         // and bounce Y velocity
						} else { // Both spots are occupied
							newx         = grain[i].x; // Cancel X & Y motion
							newy         = grain[i].y;
							grain[i].vx /= -2;         // Bounce X & Y velocity
							grain[i].vy /= -2;
							newidx       = oldidx;     // Not moving
						}
					}
				}
			}
		}

		grain[i].x  = newx; // Update grain position
		grain[i].y  = newy;
		if (oldidx != newidx) {
			gLevels[newidx] = gLevels[oldidx];  // Set new spot
			gLevels[oldidx] = 0;    // Clear old spot (might be same as new, that's OK)
		}
	}
}
