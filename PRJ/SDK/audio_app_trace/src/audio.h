#ifndef __AUDIO_H_
#define __AUDIO_H_

#include "xparameters.h"
#include <string>
#include <vector>
#include <string>
#include <array>

///* Redefine audio controller base address from xparameters.h */
//#define AUDIO_BASE				XPAR_ZED_AUDIO_CTRL_0_BASEADDR

/* Slave address for the ADAU audio controller 8 */
#define IIC_SLAVE_ADDR			0x70

/* I2C Serial Clock frequency in Hertz */
#define IIC_SCLK_RATE			400000

/* ADAU internal registers */
enum audio_regs {
	R0_CLOCK_CONTROL								= 0x00,
	R1_PLL_CONTROL 									= 0x02,
	R2_DIGITAL_MIC_JACK_DETECTION_CONTROL 			= 0x08,
	R3_RECORD_POWER_MANAGEMENT						= 0x09,
	R4_RECORD_MIXER_LEFT_CONTROL_0 					= 0x0A,
	R5_RECORD_MIXER_LEFT_CONTROL_1 					= 0x0B,
	R6_RECORD_MIXER_RIGHT_CONTROL_0 				= 0x0C,
	R7_RECORD_MIXER_RIGHT_CONTROL_1 				= 0x0D,
	R8_LEFT_DIFFERENTIAL_INPUT_VOLUME_CONTROL 		= 0x0E,
	R9_RIGHT_DIFFERENTIAL_INPUT_VOLUME_CONTROL 		= 0x0F,
	R10_RECORD_MICROPHONE_BIAS_CONTROL 				= 0x10,
	R11_ALC_CONTROL_0								= 0x11,
	R12_ALC_CONTROL_1								= 0x12,
	R13_ALC_CONTROL_2								= 0x13,
	R14_ALC_CONTROL_3								= 0x14,
	R15_SERIAL_PORT_CONTROL_0 						= 0x15,
	R16_SERIAL_PORT_CONTROL_1 						= 0x16,
	R17_CONVERTER_CONTROL_0 						= 0x17,
	R18_CONVERTER_CONTROL_1 						= 0x18,
	R19_ADC_CONTROL									= 0x19,
	R20_LEFT_INPUT_DIGITAL_VOLUME 					= 0x1A,
	R21_RIGHT_INPUT_DIGITAL_VOLUME 					= 0x1B,
	R22_PLAYBACK_MIXER_LEFT_CONTROL_0 				= 0x1C,
	R23_PLAYBACK_MIXER_LEFT_CONTROL_1 				= 0x1D,
	R24_PLAYBACK_MIXER_RIGHT_CONTROL_0 				= 0x1E,
	R25_PLAYBACK_MIXER_RIGHT_CONTROL_1 				= 0x1F,
	R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL 	= 0x20,
	R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL = 0x21,
	R28_PLAYBACK_LR_MIXER_MONO_OUTPUT_CONTROL 		= 0x22,
	R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL 		= 0x23,
	R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL 	= 0x24,
	R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL 	= 0x25,
	R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL 	= 0x26,
	R33_PLAYBACK_MONO_OUTPUT_CONTROL 				= 0x27,
	R34_PLAYBACK_POP_CLICK_SUPPRESSION 				= 0x28,
	R35_PLAYBACK_POWER_MANAGEMENT 					= 0x29,
	R36_DAC_CONTROL_0 								= 0x2A,
	R37_DAC_CONTROL_1 								= 0x2B,
	R38_DAC_CONTROL_2 								= 0x2C,
	R39_SERIAL_PORT_PAD_CONTROL 					= 0x2D,
	R40_CONTROL_PORT_PAD_CONTROL_0 					= 0x2F,
	R41_CONTROL_PORT_PAD_CONTROL_1 					= 0x30,
	R42_JACK_DETECT_PIN_CONTROL 					= 0x31,
	R67_DEJITTER_CONTROL 							= 0x36,
	R57_DSP_SAMPLING_RATE                           = 0xEB, //VL - I added it, in order to change sampling rate. It goes with R17.
	R58_SERIAL_INPUT_ROUTE_CONTROL					= 0xF2,
	R59_SERIAL_OUTPUT_ROUTE_CONTROL					= 0xF3,
	R61_DSP_ENABLE									= 0xF5,
	R62_DSP_RUN										= 0xF6,
	R63_DSP_SLEW_MODES								= 0xF7,
	R64_SERIAL_PORT_SAMPLING_RATE 					= 0xF8,
	R65_CLOCK_ENABLE_0 								= 0xF9,
	R66_CLOCK_ENABLE_1 								= 0xFA
};

enum class FrameMod : uint8_t {
  KEEP = 0,
  UP,
  DOWN
};

class Params
{
public:
  static constexpr size_t frame_size      = 1024;
  static constexpr          int    frames_per_bit = 2;
  static constexpr size_t bands_per_frame = 30;
  static constexpr int max_band          = 100;
  static constexpr int min_band          = 15;

  static constexpr          double water_delta = 0.015;
  static           std::string json_output;
  static           bool strict;
  static           bool mix;
  static           bool hard;                      // hard decode bits? (soft decoding is better)
  static           bool snr;                       // compute/show snr while adding watermark
  static           int  have_key;

  static           bool detect_speed;
  static           bool detect_speed_patient;
  static           double try_speed;               // manual speed correction
  static           double test_speed;              // for debugging --detect-speed

  static           size_t payload_size;            // number of payload bits for the watermark
  static           bool   payload_short;

  static constexpr int sync_bits           = 6;
  static constexpr int sync_frames_per_bit = 85;
  static constexpr int sync_search_step    = 256;
  static constexpr int sync_search_fine    = 8;
  static constexpr double sync_threshold2  = 0.7; // minimum refined quality

  static constexpr size_t frames_pad_start = 250; // padding at start, in case track starts with silence
  static constexpr int mark_sample_rate = 44100; // watermark generation and detection sample rate

  static constexpr double limiter_block_size_ms = 1000;
  static constexpr double limiter_ceiling       = 0.99;

  static           int test_cut; // for sync test
  static           bool test_no_sync;
  static           bool test_no_limiter;
  static           int test_truncate;
  static           int expect_matches;


  static           int hls_bit_rate;

  // input/output labels can be set for pretty output for videowmark add
  static           std::string input_label;
  static           std::string output_label;
};



/* Audio controller registers */
//enum i2s_regs {
//	I2S_DATA_RX_L_REG	= 0x00 + AUDIO_BASE, //should be 0x00 + base
//	I2S_DATA_RX_R_REG	= 0x04 + AUDIO_BASE,
//	I2S_DATA_TX_L_REG   = 0x08 + AUDIO_BASE,
//	I2S_DATA_TX_R_REG   = 0x0c + AUDIO_BASE,
//	I2S_STATUS_REG      = 0x10 + AUDIO_BASE,
//};

/* Prototype Functions */
unsigned char IicConfig(unsigned int DeviceIdPS);
void AudioPllConfig();
void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data);
void AudioConfigureJacks();
void LineinLineoutConfig();

#endif