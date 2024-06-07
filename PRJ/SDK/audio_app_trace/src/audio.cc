#include "headers.h"
#include "audio.h"


extern XIicPs Iic;
/* ---------------------------------------------------------------------------- *
 * 									IicConfig()									*
 * ---------------------------------------------------------------------------- *
 * Initialises the IIC driver by looking up the configuration in the config
 * table and then initialising it. Also sets the IIC serial clock rate.
 * ---------------------------------------------------------------------------- */
unsigned char IicConfig(unsigned int DeviceIdPS)
{
	XIicPs_Config *Config;
	int Status;

	/* Initialise the IIC driver so that it's ready to use */

	// Look up the configuration in the config table
	Config = XIicPs_LookupConfig(DeviceIdPS);
	if(NULL == Config) {
		return XST_FAILURE;
	}

	// Initialise the IIC driver configuration
	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Set the IIC serial clock rate.
	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

	return XST_SUCCESS;
}

/* ---------------------------------------------------------------------------- *
 * 								AudioPllConfig()								*
 * ---------------------------------------------------------------------------- *
 * Configures audio codes's internal PLL. With MCLK = 10 MHz it configures the
 * PLL for a VCO frequency = 49.152 MHz, and an audio sample rate of 48 KHz.
 * ---------------------------------------------------------------------------- */
void AudioPllConfig() {

	unsigned char u8TxData[8], u8RxData[6];
	int Status;

	Status = IicConfig(XPAR_XIICPS_0_DEVICE_ID);
	if(Status != XST_SUCCESS) {
		xil_printf("\nError initializing IIC");

	}

	// Disable Core Clock
	//AudioWriteToReg(R0_CLOCK_CONTROL, 0x0E);

	//bypass PLL, all the next sections is not in use.
	//0x07 -> Get MCLK directly from MCLK pin, without PLL
	//AudioWriteToReg(R0_CLOCK_CONTROL, 0x07);

	//0x0f -> Get MCLK from PLL
	//AudioWriteToReg(R0_CLOCK_CONTROL, 0x0f);
	//R1_PLL_CONTROL.27MHz from MCLK
	//0000010001100101 0000001011010001 0  0011  01   1 000000 01
//	47-32	         31-16            15 14-11 10-9 8 7-2    1-0
//	4002£º00000100 0x04
//	4003£º01100101 0x65
//	4004£º00000010 0x02
//	4005£º11010001 0xd1
//	4006£º00011011 0x1b
//	4007£º00000001 0x01
//	AudioWriteToReg(R1_PLL_CONTROL, 0x04);
//	AudioWriteToReg(R1_PLL_CONTROL + 1, 0x65);
//	AudioWriteToReg(R1_PLL_CONTROL + 2, 0x02);
//	AudioWriteToReg(R1_PLL_CONTROL + 3, 0xd1);
//	AudioWriteToReg(R1_PLL_CONTROL + 4, 0x1b);
//	AudioWriteToReg(R1_PLL_CONTROL + 5, 0x01);

	/* 	MCLK = 10 MHz
		R = 0100 = 4, N = 0x02 0x3C = 572, M = 0x02 0x71 = 625

		PLL required output = 1024x48 KHz
		(PLLout)			= 49.152 MHz

		PLLout/MCLK			= 49.152 MHz/10 MHz
							= 4.9152 MHz
							= R + (N/M)
							= 4 + (572/625) */



	// irrelevant PLL section

	// Write 6 bytes to R1 @ register address 0x4002
	u8TxData[0] = 0x40; // Register write address [15:8]
	u8TxData[1] = 0x02; // Register write address [7:0]
	u8TxData[2] = 0x04; // byte 6 - M[15:8] ; VL- was 0x02 ; then changed to 0x00
	u8TxData[3] = 0x65; // byte 5 - M[7:0] ; VL- was 0x71 ; then changed to 0x7D
	u8TxData[4] = 0x02; // byte 4 - N[15:8] ; VL- was 0x02 ; then changed to 0x00
	u8TxData[5] = 0xd1; // byte 3 - N[7:0] ; VL- was 0x3C ; then changed to 0x0C
	u8TxData[6] = 0x1b; // byte 2 - 7 = reserved, bits 6:3 = R[3:0], 2:1 = X[1:0], 0 = PLL operation mode ; VL- was 0x21 ; then changed to 0x23
	u8TxData[7] = 0x01; // byte 1 - 7:2 = reserved, 1 = PLL Lock, 0 = Core clock enable ; VL- was 0x01 ; then changed to 0x01

	// Write bytes to PLL Control register R1 @ 0x4002
	XIicPs_MasterSendPolled(&Iic, u8TxData, 8, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));

	// Register address set: 0x4002
	u8TxData[0] = 0x40;
	u8TxData[1] = 0x02;

	 //Poll PLL Lock bit
	do {
		XIicPs_MasterSendPolled(&Iic, u8TxData, 2, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
		XIicPs_MasterRecvPolled(&Iic, u8RxData, 6, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
	}
	while((u8RxData[5] & 0x02) == 0); // while not locked

	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0F);	// 1111
												// bit 3:		CLKSRC = PLL Clock input
												// bits 2:1:	INFREQ = 1024 x fs
												// bit 0:		COREN = Core Clock enabled



}


/* ---------------------------------------------------------------------------- *
 * 								AudioWriteToReg									*
 * ---------------------------------------------------------------------------- *
 * Function to write one byte (8-bits) to one of the registers from the audio
 * controller.
 * ---------------------------------------------------------------------------- */

void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data) {

	unsigned char u8TxData[3];

	u8TxData[0] = 0x40; // VL- according to the ADAU user manual, all addresses start with 0x40XX
/*VL - e.g R31 is 0x4025, and it's defined as 0x25 in audio.h */
	u8TxData[1] = u8RegAddr; //e.g 0x25
	u8TxData[2] = u8Data; //e.g 0xFE
/* VL- the above creates a concatenated string which, for R31 and a value of 0xFE
*  looks like 01000000 00100101 11111110 = 3 bytes
*  first byte is always 0x40 = 01000000*/

/* VL- next we write the above data to the register.
 * we are sending 3 bytes, >> is binary right-shift: shift iic_addr one bit to the right (what for?)
 * the function writes the last byte (data) to the register's address
 * which is composed of the first 2 bytes.
 */

	int status = XIicPs_MasterSendPolled(&Iic, u8TxData, 3, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));
}

/* ---------------------------------------------------------------------------- *
 * 								LineinLineoutConfig()							*
 * ---------------------------------------------------------------------------- *
 * Configures Line-In input, ADC's, DAC's, Line-Out and HP-Out.
 * ---------------------------------------------------------------------------- */
void LineinLineoutConfig() {
//VL - to avoid pops and clicks, set R17 and R64 on 96khz and R57 on 48Khz

	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6);//0 dB*/

	//Set Serial data port I2S bus mode
	AudioWriteToReg(R15_SERIAL_PORT_CONTROL_0, 0x00);
	/* 		0x01 : master mode. VL - as defined in the I2S_PL_ONLY code.
	 		0x00 : slave mode (default)
	*/

	//ADCs and DACs sampling rate (for some reason in was 0x05 and written as 48khz)
	AudioWriteToReg(R17_CONVERTER_CONTROL_0, 0x00); // if you're changing this' R57 also needs to change accordingly!
	/* 		bit 3-6 = 0. This is default
			bits 0-2 = sample rate ->
			0x00 : 48 khz (default)
			0x01 : 8 khz
			0x02 : 12 khz
			0x03 : 16 khz
			0x04 : 24 khz
			0x05 : 32 khz
			0x06 : 96 khz
		*/

	//Serial Port Sampling Rate, should be equal to R17 (for some reason in was 0x05 and written as 48khz)
	AudioWriteToReg(R64_SERIAL_PORT_SAMPLING_RATE, 0x00);
	/* 		bits 0-2 = sample rate ->
			0x00 : 48 khz (default)
			0x01 : 8 khz
			0x02 : 12 khz
			0x03 : 16 khz
			0x04 : 24 khz
			0x05 : 32 khz
			0x06 : 96 khz
		*/

	//VL- I added it. DSP Sampling Rate, should be equal to R17 (or maybe not, see above comment)
	AudioWriteToReg(R57_DSP_SAMPLING_RATE, 0x01);
	/* 		bits 0-3 = sample rate ->
			0x00 : 96 khz
			0x01 : 48 khz (default)
			0x02 : 32 khz
			0x03 : 24 khz
			0x04 : 16 khz
			0x05 : 12 khz
			0x06 : 8 khz
		*/

	//ADC control. inc. HPF
	AudioWriteToReg(R19_ADC_CONTROL, 0x13);
	/* 		0x03 : enable both ADC
			0x13 : enable both ADC + dig. mic (irrelevant)
			0x33 : default + HPF on- @48Khz,f3b@2Hz
	*/

	//DAC control
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03);
	/* 		0x03 : default - both DACs are on , stereo
			0x43 : Left channel in mono mode
			0x83 : Right channel in mono mode
			0xC3 : Both channels in mono mode
	*/

	//Playback Power Management, inc. DAC bias control
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03);
	/* 		0x01 : enable left channel only
			0x02 : enable right channel only
			0x03 : enable left and right channels
	*/

	//This register sets the input where the DACs receive serial data
	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01);

	//This register sets the output where the ADCs send serial data
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01);

	//This register disables or enables the digital clock engine for different blocks within the ADAU1761
	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F);
	/* 		0x7F : enable all clocks
	*/

	//This register disables or enables clocks for the ADC,DAC,DSP and BCLK,LRCLK
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03);
	/* 		0x03 : enable all clocks
	*/

	//VL- I added it. Unmute left PGA for MIC input
	AudioWriteToReg(R8_LEFT_DIFFERENTIAL_INPUT_VOLUME_CONTROL, 0x00);
	/* 	bit 0-1 = 1. Enable PGA
		bits 2-7 = gain LDVOL -> many steps, each is 0.75db increase. Here are some:
		0x03 : -12 db
		0x43 : 0 db
	*/

	AudioWriteToReg(R11_ALC_CONTROL_0, 0x00); //VL- doesn't help me

	//enable mixer 1 and vol ctrl for MIC input left
	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01);
	/* 	bit 0 = 1; enable MXR1
		bits 1-3 , 4-6 = gain LINNG, LINPG for MIC input -> some options:
		0x01 : enable MXR1, mute LINNG, LINPG
		0x7F : 6 db LINNG , 6 db LINPG
		0x0F : 6 db LINNG , 0 db LINPG
	*/

	//aux input to MXR 1. THIS IS THE INPUT GAIN TO THE ADC
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x5);
	/* 	bit 3-4 = LDBOOST for MIC input
		bits 0-2 = gain MX1AUXG for line input left ->
		0x00 : mute
		0x01 : -12 db
		0x02 : -9 db
		0x03 : -6 db
		0x04 : -3 db
		0x05 : 0 db
		0x06 : 3 db
		0x07 : 6 db
		0x08 : mute MX1AUXG and set LDBOOST to 0db
		0x10 : mute MX1AUXG and set LDBOOST to 20db
	*/

	//Controls the digital volume attenuation for left channel inputs from left ADC
	AudioWriteToReg(R20_LEFT_INPUT_DIGITAL_VOLUME, 0x00);
	/* 	There are ton of possible values;
		0x00 : 0 db (default)
		0x18 : -9 db
		0x38 : -21 db
	*/

	//Controls the digital volume attenuation for left channel inputs from left DAC
	AudioWriteToReg(R37_DAC_CONTROL_1, 0x00);
	/* 	There are ton of possible values;
		0x00 : 0 db (default)
		0x18 : -9 db
		0x38 : -21 db
	*/

	//enable mixer 2 and vol ctrl for MIC input right
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01);
	/* 	bit 0 = 1; enable MXR2
		bits 1-3 , 4-6 = gain RINNG, RINPG for MIC input
	*/

	//aux input to MXR 2
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x05);
	/* 	bit 3-4 = RDBOOST for MIC input
		bits 0-2 = gain MX2AUXG for line input right->
		0x00 : mute
		0x01 : -12 db
		0x02 : -9 db
		0x03 : -6 db
		0x04 : -3 db
		0x05 : 0 db
		0x06 : 3 db
		0x07 : 6 db
	*/


	//unmute Left DAC into Mxr 3; enable mxr 3 ; VL- default was 0x21
	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21);
	/*	bit 0,5,6 = 1; enable MXR3, MX3LM, MX3RM
		bits 1-4 gain MX3AUXG ->
		0x61 : mute  ;  0x21 : mute + shut right DAC input to left channel
		0x63 : -15 db
		0x65 : -12 db
		0x67 : -9 db
		0x69 : -6 db
		0x6B : -3 db
		0x6D : 0 db
		0x6F : 3 db
		0x71 : 6 db
	*/

	//unmute Right DAC into Mxr4; enable mxr 4 ; VL- default was 0x41
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41);
	/* 	bit 0,5,6 = 1; enable MXR4, MX4LM, MX4RM
		bits 1-4 gain MX4AUXG ->
		0x61 : mute  ;  0x41 : mute + shut left DAC input to right channel
		0x63 : -15 db
		0x65 : -12 db
		0x67 : -9 db
		0x69 : -6 db
		0x6B : -3 db
		0x6D : 0 db  ;  0x4D : 0 db + shut left DAC input to right channel
		0x6F : 3 db
		0x71 : 6 db
	*/


	//Headphone volume control for left channel, LHP output. Each 1-bit step corresponds to a 1 dB increase in volume
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xff);
	/* 	bit 0-1 = 1. Unmute LHP.
		bits 2-7 = gain LHPVOL for HP output left ->
		0x01 : mute LHP
		0x03 : -57 db (default)
		0x97 : -20 db
		0xBF : -10 db
		0xE7 : 0 db
		0xF3 : 3 db
		0xFF : 6 db
	*/

	//Headphone volume control for right channel, RHP output. Each 1-bit step corresponds to a 1 dB increase in volume.
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xe7);
	/* 	bit 0-1 = 1. Unmute RHP.
		bits 2-7 = gain RHPVOL for HP output left ->
		0x01 : mute RHP
		0x03 : -57 db (default)
		0x97 : -20 db
		0xBF : -10 db
		0xE7 : 0 db
		0xF3 : 3 db
		0xFF : 6 db
	*/


	//enable MXR7 and MONOOUT - doesn't seem to work with AMP
	AudioWriteToReg(R28_PLAYBACK_LR_MIXER_MONO_OUTPUT_CONTROL, 0x00);
	/* 	0x01 : enable MXR7
		0x00 : disable MXR7 (default)
	*/

	//Vol ctrl MONOVOL - doesn't seem to work with AMP
	AudioWriteToReg(R33_PLAYBACK_MONO_OUTPUT_CONTROL, 0x00);
	/* 	0x00 : mute
		0xff : 6 db
	*/

	//more gain and mix between L/R channels for LINE OUT - check further later if relevant
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x05);
	/* 	0x00 : mute
	 *  0x03 : 0dB
	 *  0x05 : 6dB
	*/

	//more gain and mix between L/R channels for LINE OUT - check further later if relevant
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x11);
	/* 	0x00 : mute
	*/

	//Line output volume control for left channel, LOUTN and LOUTP outputs. Each 1-bit step corresponds to a 1 dB increase in volume.
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xe6);//0 dB - VL- originally was E6 = 0db (now was FE)
	/* 	bit 0 -> 0= drive line output, 1= drive HP output
		bit 1 = 1. Unmute LOUTN, LOUTP.
		bits 2-7 = gain LOUTVOL for driving Hedaphones left (loads of 16ohms +) ->
		0x01 : mute LOUTN, LOUTP
		0x03 : -57 db (default)
		0x97 : -20 db
		0xBF : -10 db
		0xE7 : 0 db
		0xF3 : 3 db
		0xFF : 6 db
		bits 2-7 = gain LOUTVOL for driving LINE left (loads of 10kohms +) ->
		0x00 : mute LOUTN, LOUTP
		0x02 : -57 db (default)
		0x96 : -20 db
		0xBE : -10 db
		0xE6 : 0 db
		0xF2 : 3 db
		0xFE : 6 db
	*/


	//Line output volume control for right channel, ROUTN and ROUTP outputs. Each 1-bit step corresponds to a 1 dB increase in volume.
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6);//0 dB - VL- originally was E6 = 0db
	/* 	bit 0 -> 0= drive line output, 1= drive HP output
		bit 1 = 1. Unmute ROUTN, ROUTP.
		bits 2-7 = gain ROUTVOL for driving Hedaphones right (loads of 16ohms +) ->
		0x01 : mute ROUTN, ROUT
		0x03 : -57 db (default)
		0x97 : -20 db
		0xBF : -10 db
		0xE7 : 0 db
		0xF3 : 3 db
		0xFF : 6 db
		bits 2-7 = gain ROUTVOL for driving LINE right (loads of 10kohms +) ->
		0x00 : mute LOUTN, LOUTP
		0x02 : -57 db (default)
		0x96 : -20 db
		0xBE : -10 db
		0xE6 : 0 db
		0xF2 : 3 db
		0xFE : 6 db
	*/
}

