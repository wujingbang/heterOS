// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Apr 18 21:51:40 2024
// Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_auto_ss_slidr_3/effects_loop_auto_ss_slidr_3_stub.v
// Design      : effects_loop_auto_ss_slidr_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "top_effects_loop_auto_ss_slidr_3,Vivado 2019.1" *)
module effects_loop_auto_ss_slidr_3(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, s_axis_tlast, s_axis_tid, s_axis_tdest, s_axis_tuser, m_axis_tvalid, 
  m_axis_tready, m_axis_tdata, m_axis_tlast, m_axis_tuser)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tlast,s_axis_tid[7:0],s_axis_tdest[3:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tlast,m_axis_tuser[15:0]" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input s_axis_tlast;
  input [7:0]s_axis_tid;
  input [3:0]s_axis_tdest;
  input [15:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output m_axis_tlast;
  output [15:0]m_axis_tuser;
endmodule
