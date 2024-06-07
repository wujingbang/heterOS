
#ifndef HEADERS_H_
#define HEADERS_H_

/* ---------------------------------------------------------------------------- *
 * 								Header Files									*
 * ---------------------------------------------------------------------------- */
#include <stdio.h>
#include <xil_io.h>
//#include <sleep.h>
#include "xiicps.h"
//#include <xil_printf.h>
#include <xparameters.h>
//#include "xgpio.h"
//#include "xuartps.h"
#include "stdlib.h"
#include "xaxidma.h"
#include "xdebug.h"
#include <assert.h>
#include "xscutimer.h"
#include "xscugic.h"

/* ---------------------------------------------------------------------------- *
 * 							Custom IP Header Files								*
 * ---------------------------------------------------------------------------- */
#include "audio.h"


/* ---------------------------------------------------------------------------- *
 * 							Prototype Functions									*
 * ---------------------------------------------------------------------------- */
#if (!defined(DEBUG))
extern void xil_printf(const char *format, ...);
#endif




/*
 * Device hardware build related constants.
 */

//#define DMAFFT_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID
#define DMAI2S_DEV_ID		XPAR_AXIDMA_1_DEVICE_ID
//#define DMAMUL_DEV_ID		XPAR_AXIDMA_2_DEVICE_ID

#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		 DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define SAMPLE_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define FFT_BUFFER_BASE		(MEM_BASE_ADDR + 0x00200000)
#define NFFT_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
#define OUT_BUFFER_BASE		(MEM_BASE_ADDR + 0x00400000)


#define MAX_PKT_LEN		1024

#define TEST_START_VALUE	0xC

#define NUMBER_OF_TRANSFERS	10


#endif /* HEADERS_H_ */
