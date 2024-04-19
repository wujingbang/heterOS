// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Apr 15 22:23:29 2024
// Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               F:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_multiply_window_0_0/effects_loop_multiply_window_0_0_stub.v
// Design      : effects_loop_multiply_window_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "multiply_window_v1_0,Vivado 2019.1" *)
module effects_loop_multiply_window_0_0(aclk, aresetn, s_axis_tdata, s_axis_tstrb, 
  s_axis_tlast, s_axis_tvalid, s_axis_tready, m_axis_tdata, m_axis_tstrb, m_axis_tlast, 
  m_axis_tvalid, m_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tlast,s_axis_tvalid,s_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tlast,m_axis_tvalid,m_axis_tready" */;
  input aclk;
  input aresetn;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input s_axis_tlast;
  input s_axis_tvalid;
  output s_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output m_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
endmodule
