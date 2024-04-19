// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Apr 18 21:52:31 2024
// Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_system_ila_0_1/effects_loop_system_ila_0_1_stub.v
// Design      : effects_loop_system_ila_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_395a,Vivado 2019.1" *)
module effects_loop_system_ila_0_1(clk, probe0, probe1, SLOT_0_AXIS_tid, 
  SLOT_0_AXIS_tdest, SLOT_0_AXIS_tdata, SLOT_0_AXIS_tkeep, SLOT_0_AXIS_tlast, 
  SLOT_0_AXIS_tuser, SLOT_0_AXIS_tvalid, SLOT_0_AXIS_tready, SLOT_1_AXIS_tid, 
  SLOT_1_AXIS_tdest, SLOT_1_AXIS_tdata, SLOT_1_AXIS_tkeep, SLOT_1_AXIS_tlast, 
  SLOT_1_AXIS_tuser, SLOT_1_AXIS_tvalid, SLOT_1_AXIS_tready, resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],SLOT_0_AXIS_tid[7:0],SLOT_0_AXIS_tdest[3:0],SLOT_0_AXIS_tdata[63:0],SLOT_0_AXIS_tkeep[7:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tuser[15:0],SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,SLOT_1_AXIS_tid[7:0],SLOT_1_AXIS_tdest[3:0],SLOT_1_AXIS_tdata[63:0],SLOT_1_AXIS_tkeep[7:0],SLOT_1_AXIS_tlast,SLOT_1_AXIS_tuser[15:0],SLOT_1_AXIS_tvalid,SLOT_1_AXIS_tready,resetn" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [7:0]SLOT_0_AXIS_tid;
  input [3:0]SLOT_0_AXIS_tdest;
  input [63:0]SLOT_0_AXIS_tdata;
  input [7:0]SLOT_0_AXIS_tkeep;
  input SLOT_0_AXIS_tlast;
  input [15:0]SLOT_0_AXIS_tuser;
  input SLOT_0_AXIS_tvalid;
  input SLOT_0_AXIS_tready;
  input [7:0]SLOT_1_AXIS_tid;
  input [3:0]SLOT_1_AXIS_tdest;
  input [63:0]SLOT_1_AXIS_tdata;
  input [7:0]SLOT_1_AXIS_tkeep;
  input SLOT_1_AXIS_tlast;
  input [15:0]SLOT_1_AXIS_tuser;
  input SLOT_1_AXIS_tvalid;
  input SLOT_1_AXIS_tready;
  input resetn;
endmodule
