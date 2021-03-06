// for zybo board, does not include lis2ds12 accelerometer sensor code

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"

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

void InitPerlin (void);
void NextPerlin (void);
int32_t noise (uint16_t x, uint16_t y, uint16_t z);

int gBuffer = 0;
uint32_t gLevels[DISPLAY_HEIGHT][DISPLAY_WIDTH];

// extern const uint8_t image[];

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

    InitPerlin ();

    xil_printf (".\n\r");

    // initialize levels to all off
/*
	const uint8_t *imagePtr = image;
*/
	for (row = 0; row < DISPLAY_HEIGHT; row++) {
        for (col = 0; col < DISPLAY_WIDTH; col++) {
            gLevels[row][col] = MAKE_COLOR(0,0,0);
/*
        	uint8_t r = *imagePtr++;
        	uint8_t g = *imagePtr++;
        	uint8_t b = *imagePtr++;
            gLevels[row][col] = MAKE_COLOR(gammaLut[r],gammaLut[g],gammaLut[b]);
*/
        }
    }

    xil_printf (".\n\r");

    // send levels to board
    WriteLevels ();

    xil_printf (".\n\r");

    // set for full brightness
    Xil_Out32 (FPGA_PANEL_DIMMER_REG, 0x100);

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

    	// compute next set of levels
    	NextPerlin ();

    	// hey, we're alive!
        xil_printf (".");
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
		Xil_Out32 (FPGA_PANEL_ADDR_REG, base + 0x40 * row);
        for (col = 0; col < DISPLAY_WIDTH; col++) {
        	Xil_Out32 (FPGA_PANEL_DATA_REG, gLevels[row][col]);
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


int32_t m_width;
int32_t m_height;
int32_t m_mode;
int32_t m_xy_scale;
float m_z_step;
float m_z_depth;
float m_hue_options;
float m_z_state;
float m_hue_state;
float m_min, m_max;


void InitPerlin (void)
{
    // new Perlin (DISPLAY_WIDTH, DISPLAY_HEIGHT, 2, 8.0/64.0, 1.0/64.0, 256.0, 0.005);
	m_width = DISPLAY_WIDTH;
	m_height = DISPLAY_HEIGHT;
	m_mode = 2;
	m_xy_scale = 8.0/64.0*256.0;
	m_z_step = 1.0/64.0;
	m_z_depth = 256.0;
	m_hue_options = 0.005;
	m_z_state = 0;
	m_hue_state = 0;
	m_min = 1;
	m_max = 1;
}


void NextPerlin (void)
{
    int32_t x, y;
    uint16_t sx, sy;
	int32_t n1, n2;
	float n;
    int32_t hue;

	int16_t sz1 = (float)m_z_state * 256.0;
	int16_t sz2 = (float)(m_z_state - m_z_depth) * 256.0;

    // row
    for (y = 0; y < m_height; y++) {

        // scale y
        sy = y * m_xy_scale;

        // column
        for (x = 0; x < m_width; x++) {

            // scale x
            sx = x * m_xy_scale;

            // generate noise at plane z_state
            n1 = noise (sx, sy, sz1);

            // generate noise at plane z_state - z_depth
            n2 = noise (sx, sy, sz2);

            // combine noises to make a seamless transition from plane
            // at z = z_depth back to plane at z = 0
            n = ((m_z_depth - m_z_state) * (float)n1 + (m_z_state) * (float)n2) / m_z_depth;

            // normalize combined noises to a number between 0 and 1
            if (n > m_max) m_max = n;
            if (n < m_min) m_min = n;
            n = n + fabs (m_min);               // make noise a positive value
            n = n / (m_max + fabs (m_min));     // scale noise to between 0 and 1

            // set hue and/or brightness based on mode
            switch (m_mode) {

                // base hue fixed, varies based on noise
                case 1:
                    hue = (m_hue_options + n)*1536.0 + 0.5;
                    hue = hue % 1536;
                    gLevels[y][x] = TranslateHue (hue);
                    break;

                // hue rotates at constant velocity, varies based on noise
                case 2:
                    hue = (m_hue_state + n)*1536.0 + 0.5;
                    hue = hue % 1536;
                    gLevels[y][x] = TranslateHue (hue);
                    break;

                // hue rotates at constant velocity, brightness varies based on noise
                case 3:
                    hue = (m_hue_state)*1536.0 + 0.5;
                    hue = hue % 1536;
                    gLevels[y][x] = TranslateHueValue (hue, n);
                    break;

                // undefined mode, blank display
                default:
                    gLevels[y][x] = 0;
                    break;

            }
        }
    }

    // update state variables
    m_z_state = fmodf (m_z_state + m_z_step, m_z_depth);
    m_hue_state = fmodf (m_hue_state + m_hue_options, 1.0);
}


//---------------------------------------------------------------------------------------------
// noise
//

#define lerp1(t, a, b) (((a)<<12) + (t) * ((b) - (a)))

static const int8_t GRAD3[16][3] = {
    {1,1,0},{-1,1,0},{1,-1,0},{-1,-1,0},
    {1,0,1},{-1,0,1},{1,0,-1},{-1,0,-1},
    {0,1,1},{0,-1,1},{0,1,-1},{0,-1,-1},
    {1,0,-1},{-1,0,-1},{0,-1,1},{0,1,1}};

static const uint8_t PERM[512] = {
  151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140,
  36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120,
  234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33,
  88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71,
  134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133,
  230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161,
  1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130,
  116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250,
  124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227,
  47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44,
  154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98,
  108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34,
  242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14,
  239, 107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121,
  50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243,
  141, 128, 195, 78, 66, 215, 61, 156, 180, 151, 160, 137, 91, 90, 15, 131,
  13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37,
  240, 21, 10, 23, 190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252,
  219, 203, 117, 35, 11, 32, 57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125,
  136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158,
  231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245,
  40, 244, 102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187,
  208, 89, 18, 169, 200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198,
  173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126,
  255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223,
  183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167,
  43, 172, 9, 129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185,
  112, 104, 218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179,
  162, 241, 81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199,
  106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236,
  205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156,
  180};

static const uint16_t easing_function_lut[256] = {
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 3, 4, 6, 7,
    9, 10, 12, 14, 17, 19, 22, 25, 29, 32, 36, 40, 45, 49, 54, 60,
    65, 71, 77, 84, 91, 98, 105, 113, 121, 130, 139, 148, 158, 167, 178, 188,
    199, 211, 222, 234, 247, 259, 273, 286, 300, 314, 329, 344, 359, 374, 390, 407,
    424, 441, 458, 476, 494, 512, 531, 550, 570, 589, 609, 630, 651, 672, 693, 715,
    737, 759, 782, 805, 828, 851, 875, 899, 923, 948, 973, 998, 1023, 1049, 1074, 1100,
    1127, 1153, 1180, 1207, 1234, 1261, 1289, 1316, 1344, 1372, 1400, 1429, 1457, 1486, 1515,
    1543, 1572, 1602, 1631, 1660, 1690, 1719, 1749, 1778, 1808, 1838, 1868, 1898, 1928, 1958,
    1988, 2018, 2048, 2077, 2107, 2137, 2167, 2197, 2227, 2257, 2287, 2317, 2346, 2376, 2405,
    2435, 2464, 2493, 2523, 2552, 2580, 2609, 2638, 2666, 2695, 2723, 2751, 2779, 2806, 2834,
    2861, 2888, 2915, 2942, 2968, 2995, 3021, 3046, 3072, 3097, 3122, 3147, 3172, 3196, 3220,
    3244, 3267, 3290, 3313, 3336, 3358, 3380, 3402, 3423, 3444, 3465, 3486, 3506, 3525, 3545,
    3564, 3583, 3601, 3619, 3637, 3654, 3672, 3688, 3705, 3721, 3736, 3751, 3766, 3781, 3795,
    3809, 3822, 3836, 3848, 3861, 3873, 3884, 3896, 3907, 3917, 3928, 3937, 3947, 3956, 3965,
    3974, 3982, 3990, 3997, 4004, 4011, 4018, 4024, 4030, 4035, 4041, 4046, 4050, 4055, 4059,
    4063, 4066, 4070, 4073, 4076, 4078, 4081, 4083, 4085, 4086, 4088, 4089, 4091, 4092, 4092,
    4093, 4094, 4094, 4095, 4095, 4095, 4095, 4095, 4095, 4095
};

static inline int16_t grad3(const uint8_t h, const int16_t x, const int16_t y, const int16_t z)
{
    return x * GRAD3[h][0] + y * GRAD3[h][1] + z * GRAD3[h][2];
}

int32_t noise (uint16_t x, uint16_t y, uint16_t z)
{
    uint8_t i0, j0, k0;     // integer part of (x, y, z)
    uint8_t i1, j1, k1;     // integer part plus one of (x, y, z)
    uint8_t xx, yy, zz;     // fractional part of (x, y, z)
    uint16_t fx, fy, fz;    // easing function result, add 4 LS bits

    // drop fractional part of each input
    i0 = x >> 8;
    j0 = y >> 8;
    k0 = z >> 8;

    // integer part plus one, wrapped between 0x00 and 0xff
    i1 = i0 + 1;
    j1 = j0 + 1;
    k1 = k0 + 1;

    // fractional part of each input
    xx = x & 0xff;
    yy = y & 0xff;
    zz = z & 0xff;

    // apply easing function
    fx = easing_function_lut[xx];
    fy = easing_function_lut[yy];
    fz = easing_function_lut[zz];

    uint8_t A, AA, AB, B, BA, BB;
    uint8_t CA, CB, CC, CD, CE, CF, CG, CH;

    // apply permutation functions
    A = PERM[i0];
    AA = PERM[A + j0];
    AB = PERM[A + j1];
    B = PERM[i1];
    BA = PERM[B + j0];
    BB = PERM[B + j1];
    CA = PERM[AA + k0] & 0xf;
    CB = PERM[BA + k0] & 0xf;
    CC = PERM[AB + k0] & 0xf;
    CD = PERM[BB + k0] & 0xf;
    CE = PERM[AA + k1] & 0xf;
    CF = PERM[BA + k1] & 0xf;
    CG = PERM[AB + k1] & 0xf;
    CH = PERM[BB + k1] & 0xf;

    // subtract 1.0 from xx, yy, zz
    int16_t xxm1 = xx - 256;
    int16_t yym1 = yy - 256;
    int16_t zzm1 = zz - 256;

    // result is -2 to exactly +2
    int16_t g1 = grad3 (CA, xx,   yy,   zz  );
    int16_t g2 = grad3 (CB, xxm1, yy,   zz  );
    int16_t g3 = grad3 (CC, xx,   yym1, zz  );
    int16_t g4 = grad3 (CD, xxm1, yym1, zz  );
    int16_t g5 = grad3 (CE, xx,   yy,   zzm1);
    int16_t g6 = grad3 (CF, xxm1, yy,   zzm1);
    int16_t g7 = grad3 (CG, xx,   yym1, zzm1);
    int16_t g8 = grad3 (CH, xxm1, yym1, zzm1);

    // linear interpolations
    int32_t l1 = lerp1(fx, g1, g2) >> 6;
    int32_t l2 = lerp1(fx, g3, g4) >> 6;
    int32_t l3 = lerp1(fx, g5, g6) >> 6;
    int32_t l4 = lerp1(fx, g7, g8) >> 6;

    int32_t l5 = lerp1(fy, l1, l2) >> 12;
    int32_t l6 = lerp1(fy, l3, l4) >> 12;

    int32_t l7 = lerp1(fz, l5, l6) >> 12;

	return l7;
}


