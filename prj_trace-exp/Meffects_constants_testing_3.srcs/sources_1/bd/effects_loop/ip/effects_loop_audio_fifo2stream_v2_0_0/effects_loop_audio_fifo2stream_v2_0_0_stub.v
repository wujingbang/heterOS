// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Apr 15 22:23:35 2024
// Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               F:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_audio_fifo2stream_v2_0_0/effects_loop_audio_fifo2stream_v2_0_0_stub.v
// Design      : effects_loop_audio_fifo2stream_v2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "audio_fifo2stream_v1_0,Vivado 2019.1" *)
module effects_loop_audio_fifo2stream_v2_0_0(clk_100mhz, aresetn, BCLK, LRCLK, SDATA_I, SDATA_O, 
  s_axi_config_aclk, s_axi_config_aresetn, s_axi_config_awaddr, s_axi_config_awprot, 
  s_axi_config_awvalid, s_axi_config_awready, s_axi_config_wdata, s_axi_config_wstrb, 
  s_axi_config_wvalid, s_axi_config_wready, s_axi_config_bresp, s_axi_config_bvalid, 
  s_axi_config_bready, s_axi_config_araddr, s_axi_config_arprot, s_axi_config_arvalid, 
  s_axi_config_arready, s_axi_config_rdata, s_axi_config_rresp, s_axi_config_rvalid, 
  s_axi_config_rready, s00_axis_aclk, s00_axis_aresetn, s00_axis_tready, s00_axis_tdata, 
  s00_axis_tlast, s00_axis_tvalid, m00_axis_aclk, m00_axis_aresetn, m00_axis_tvalid, 
  m00_axis_tdata, m00_axis_tlast, m00_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="clk_100mhz,aresetn,BCLK,LRCLK,SDATA_I,SDATA_O,s_axi_config_aclk,s_axi_config_aresetn,s_axi_config_awaddr[4:0],s_axi_config_awprot[2:0],s_axi_config_awvalid,s_axi_config_awready,s_axi_config_wdata[31:0],s_axi_config_wstrb[3:0],s_axi_config_wvalid,s_axi_config_wready,s_axi_config_bresp[1:0],s_axi_config_bvalid,s_axi_config_bready,s_axi_config_araddr[4:0],s_axi_config_arprot[2:0],s_axi_config_arvalid,s_axi_config_arready,s_axi_config_rdata[31:0],s_axi_config_rresp[1:0],s_axi_config_rvalid,s_axi_config_rready,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tdata[63:0],s00_axis_tlast,s00_axis_tvalid,m00_axis_aclk,m00_axis_aresetn,m00_axis_tvalid,m00_axis_tdata[63:0],m00_axis_tlast,m00_axis_tready" */;
  input clk_100mhz;
  input aresetn;
  output BCLK;
  output LRCLK;
  input SDATA_I;
  output SDATA_O;
  input s_axi_config_aclk;
  input s_axi_config_aresetn;
  input [4:0]s_axi_config_awaddr;
  input [2:0]s_axi_config_awprot;
  input s_axi_config_awvalid;
  output s_axi_config_awready;
  input [31:0]s_axi_config_wdata;
  input [3:0]s_axi_config_wstrb;
  input s_axi_config_wvalid;
  output s_axi_config_wready;
  output [1:0]s_axi_config_bresp;
  output s_axi_config_bvalid;
  input s_axi_config_bready;
  input [4:0]s_axi_config_araddr;
  input [2:0]s_axi_config_arprot;
  input s_axi_config_arvalid;
  output s_axi_config_arready;
  output [31:0]s_axi_config_rdata;
  output [1:0]s_axi_config_rresp;
  output s_axi_config_rvalid;
  input s_axi_config_rready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  output s00_axis_tready;
  input [63:0]s00_axis_tdata;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  input m00_axis_aclk;
  input m00_axis_aresetn;
  output m00_axis_tvalid;
  output [63:0]m00_axis_tdata;
  output m00_axis_tlast;
  input m00_axis_tready;
endmodule
