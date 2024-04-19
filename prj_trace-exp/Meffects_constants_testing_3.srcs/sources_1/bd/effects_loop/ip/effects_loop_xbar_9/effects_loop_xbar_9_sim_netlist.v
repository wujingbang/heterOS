// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Apr 15 22:22:07 2024
// Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_xbar_9/effects_loop_xbar_9_sim_netlist.v
// Design      : effects_loop_xbar_9
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "effects_loop_xbar_9,axis_switch_v1_1_19_axis_switch,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_switch_v1_1_19_axis_switch,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module effects_loop_xbar_9
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    s_req_suppress,
    s_decode_err);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF M00_AXIS:M01_AXIS:M02_AXIS:M03_AXIS:M04_AXIS:M05_AXIS:M06_AXIS:M07_AXIS:M08_AXIS:M09_AXIS:M10_AXIS:M11_AXIS:M12_AXIS:M13_AXIS:M14_AXIS:M15_AXIS:S00_AXIS:S01_AXIS:S02_AXIS:S03_AXIS:S04_AXIS:S05_AXIS:S06_AXIS:S07_AXIS:S08_AXIS:S09_AXIS:S10_AXIS:S11_AXIS:S12_AXIS:S13_AXIS:S14_AXIS:S15_AXIS, ASSOCIATED_RESET aresetn, INSERT_VIP 0, ASSOCIATED_CLKEN aclken" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TVALID [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TVALID [0:0] [2:2]" *) input [2:0]s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TREADY [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TREADY [0:0] [2:2]" *) output [2:0]s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA [63:0] [63:0], xilinx.com:interface:axis:1.0 S01_AXIS TDATA [63:0] [127:64], xilinx.com:interface:axis:1.0 S02_AXIS TDATA [63:0] [191:128]" *) input [191:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB [7:0] [7:0], xilinx.com:interface:axis:1.0 S01_AXIS TSTRB [7:0] [15:8], xilinx.com:interface:axis:1.0 S02_AXIS TSTRB [7:0] [23:16]" *) input [23:0]s_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TLAST [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TLAST [0:0] [2:2]" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME S01_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME S02_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [2:0]s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) output [0:0]m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) input [0:0]m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [63:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB" *) output [7:0]m_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [0:0]m_axis_tlast;
  input [2:0]s_req_suppress;
  output [2:0]s_decode_err;

  wire aclk;
  wire aresetn;
  wire [63:0]m_axis_tdata;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire [191:0]s_axis_tdata;
  wire [2:0]s_axis_tlast;
  wire [2:0]s_axis_tready;
  wire [23:0]s_axis_tstrb;
  wire [2:0]s_axis_tvalid;
  wire [2:0]s_decode_err;
  wire [2:0]s_req_suppress;
  wire NLW_inst_s_axi_ctrl_arready_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_awready_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_wready_UNCONNECTED;
  wire [2:0]NLW_inst_arb_dest_UNCONNECTED;
  wire [0:0]NLW_inst_arb_done_UNCONNECTED;
  wire [2:0]NLW_inst_arb_id_UNCONNECTED;
  wire [2:0]NLW_inst_arb_last_UNCONNECTED;
  wire [2:0]NLW_inst_arb_req_UNCONNECTED;
  wire [2:0]NLW_inst_arb_user_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tuser_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_ctrl_bresp_UNCONNECTED;
  wire [31:0]NLW_inst_s_axi_ctrl_rdata_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_ctrl_rresp_UNCONNECTED;

  (* C_ARB_ALGORITHM = "0" *) 
  (* C_ARB_ON_MAX_XFERS = "1" *) 
  (* C_ARB_ON_NUM_CYCLES = "0" *) 
  (* C_ARB_ON_TLAST = "0" *) 
  (* C_AXIS_SIGNAL_SET = "23" *) 
  (* C_AXIS_TDATA_WIDTH = "64" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_DECODER_REG = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_INCLUDE_ARBITER = "1" *) 
  (* C_LOG_SI_SLOTS = "2" *) 
  (* C_M_AXIS_BASETDEST_ARRAY = "1'b0" *) 
  (* C_M_AXIS_CONNECTIVITY_ARRAY = "3'b111" *) 
  (* C_M_AXIS_HIGHTDEST_ARRAY = "1'b0" *) 
  (* C_NUM_MI_SLOTS = "1" *) 
  (* C_NUM_SI_SLOTS = "3" *) 
  (* C_OUTPUT_REG = "0" *) 
  (* C_ROUTING_MODE = "0" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "7" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* LP_CTRL_REG_WIDTH = "20" *) 
  (* LP_MERGEDOWN_MUX = "0" *) 
  (* LP_NUM_SYNCHRONIZER_STAGES = "4" *) 
  (* P_DECODER_CONNECTIVITY_ARRAY = "3'b111" *) 
  (* P_SINGLE_SLAVE_CONNECTIVITY_ARRAY = "1'b0" *) 
  (* P_TPAYLOAD_WIDTH = "73" *) 
  effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch inst
       (.aclk(aclk),
        .aclken(1'b1),
        .arb_dest(NLW_inst_arb_dest_UNCONNECTED[2:0]),
        .arb_done(NLW_inst_arb_done_UNCONNECTED[0]),
        .arb_gnt({1'b0,1'b0,1'b0}),
        .arb_id(NLW_inst_arb_id_UNCONNECTED[2:0]),
        .arb_last(NLW_inst_arb_last_UNCONNECTED[2:0]),
        .arb_req(NLW_inst_arb_req_UNCONNECTED[2:0]),
        .arb_sel({1'b0,1'b0}),
        .arb_user(NLW_inst_arb_user_UNCONNECTED[2:0]),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_inst_m_axis_tkeep_UNCONNECTED[7:0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tuser(NLW_inst_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axi_ctrl_aclk(1'b0),
        .s_axi_ctrl_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_aresetn(1'b0),
        .s_axi_ctrl_arready(NLW_inst_s_axi_ctrl_arready_UNCONNECTED),
        .s_axi_ctrl_arvalid(1'b0),
        .s_axi_ctrl_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_awready(NLW_inst_s_axi_ctrl_awready_UNCONNECTED),
        .s_axi_ctrl_awvalid(1'b0),
        .s_axi_ctrl_bready(1'b0),
        .s_axi_ctrl_bresp(NLW_inst_s_axi_ctrl_bresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_bvalid(NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED),
        .s_axi_ctrl_rdata(NLW_inst_s_axi_ctrl_rdata_UNCONNECTED[31:0]),
        .s_axi_ctrl_rready(1'b0),
        .s_axi_ctrl_rresp(NLW_inst_s_axi_ctrl_rresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_rvalid(NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED),
        .s_axi_ctrl_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_wready(NLW_inst_s_axi_ctrl_wready_UNCONNECTED),
        .s_axi_ctrl_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest({1'b0,1'b0,1'b0}),
        .s_axis_tid({1'b0,1'b0,1'b0}),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tuser({1'b0,1'b0,1'b0}),
        .s_axis_tvalid(s_axis_tvalid),
        .s_decode_err(s_decode_err),
        .s_req_suppress(s_req_suppress));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_arb_rr" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr
   (\gen_tdest_routing.busy_ns ,
    \arb_gnt_r_reg[2]_0 ,
    m_axis_tready_0_sp_1,
    \gen_tdest_routing.busy_ns_0 ,
    \arb_gnt_r_reg[1]_0 ,
    \gen_tdest_routing.busy_ns_1 ,
    \arb_gnt_r_reg[0]_0 ,
    m_axis_tvalid,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    areset_r,
    aclken,
    aclk,
    \gen_tdest_routing.busy_r_reg[0] ,
    s_req_suppress,
    s_axis_tvalid,
    \gen_tdest_routing.busy_r_reg[0]_0 ,
    \gen_tdest_routing.busy_r_reg[0]_1 ,
    m_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    \gen_tdest_router.busy_r );
  output \gen_tdest_routing.busy_ns ;
  output \arb_gnt_r_reg[2]_0 ;
  output m_axis_tready_0_sp_1;
  output \gen_tdest_routing.busy_ns_0 ;
  output \arb_gnt_r_reg[1]_0 ;
  output \gen_tdest_routing.busy_ns_1 ;
  output \arb_gnt_r_reg[0]_0 ;
  output [0:0]m_axis_tvalid;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [0:0]m_axis_tlast;
  input areset_r;
  input aclken;
  input aclk;
  input \gen_tdest_routing.busy_r_reg[0] ;
  input [2:0]s_req_suppress;
  input [2:0]s_axis_tvalid;
  input \gen_tdest_routing.busy_r_reg[0]_0 ;
  input \gen_tdest_routing.busy_r_reg[0]_1 ;
  input [0:0]m_axis_tready;
  input [191:0]s_axis_tdata;
  input [23:0]s_axis_tstrb;
  input [2:0]s_axis_tlast;
  input [2:0]\gen_tdest_router.busy_r ;

  wire aclk;
  wire aclken;
  wire arb_busy_ns;
  wire arb_busy_r;
  wire \arb_gnt_r[0]_i_1_n_0 ;
  wire \arb_gnt_r[1]_i_1_n_0 ;
  wire \arb_gnt_r[2]_i_1_n_0 ;
  wire \arb_gnt_r[2]_i_2_n_0 ;
  wire \arb_gnt_r_reg[0]_0 ;
  wire \arb_gnt_r_reg[1]_0 ;
  wire \arb_gnt_r_reg[2]_0 ;
  wire [2:0]arb_req_i__2;
  wire [2:0]arb_req_rot;
  wire [1:0]arb_sel_i;
  wire \arb_sel_r[0]_i_1_n_0 ;
  wire \arb_sel_r[1]_i_1_n_0 ;
  wire areset_r;
  wire barrel_cntr;
  wire [1:0]barrel_cntr_ns;
  wire \barrel_cntr_reg_n_0_[0] ;
  wire \barrel_cntr_reg_n_0_[1] ;
  wire f_mux_return;
  wire [2:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_tdest_routing.busy_ns_1 ;
  wire \gen_tdest_routing.busy_r_reg[0] ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;
  wire \gen_tdest_routing.busy_r_reg[0]_1 ;
  wire [63:0]m_axis_tdata;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire m_axis_tready_0_sn_1;
  wire [7:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire \m_axis_tvalid[0]_INST_0_i_1_n_0 ;
  wire [5:0]port_priority_ns;
  wire [191:0]s_axis_tdata;
  wire [2:0]s_axis_tlast;
  wire [23:0]s_axis_tstrb;
  wire [2:0]s_axis_tvalid;
  wire [2:0]s_req_suppress;
  wire [1:0]sel_i;
  wire valid_i;

  assign m_axis_tready_0_sp_1 = m_axis_tready_0_sn_1;
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    arb_busy_r_i_1
       (.I0(valid_i),
        .I1(arb_busy_r),
        .I2(m_axis_tready_0_sn_1),
        .O(arb_busy_ns));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    arb_busy_r_i_2
       (.I0(arb_req_i__2[2]),
        .I1(arb_req_i__2[1]),
        .I2(arb_req_i__2[0]),
        .O(valid_i));
  LUT3 #(
    .INIT(8'h80)) 
    arb_busy_r_i_3
       (.I0(m_axis_tready),
        .I1(\m_axis_tvalid[0]_INST_0_i_1_n_0 ),
        .I2(f_mux_return),
        .O(m_axis_tready_0_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    arb_busy_r_i_4
       (.I0(s_req_suppress[2]),
        .I1(s_axis_tvalid[2]),
        .I2(\arb_gnt_r_reg[2]_0 ),
        .I3(\gen_tdest_routing.busy_r_reg[0] ),
        .O(arb_req_i__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    arb_busy_r_i_5
       (.I0(s_req_suppress[1]),
        .I1(s_axis_tvalid[1]),
        .I2(\arb_gnt_r_reg[1]_0 ),
        .I3(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .O(arb_req_i__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    arb_busy_r_i_6
       (.I0(s_req_suppress[0]),
        .I1(s_axis_tvalid[0]),
        .I2(\arb_gnt_r_reg[0]_0 ),
        .I3(\gen_tdest_routing.busy_r_reg[0]_1 ),
        .O(arb_req_i__2[0]));
  LUT5 #(
    .INIT(32'h0FAC00AC)) 
    arb_busy_r_i_7
       (.I0(s_axis_tvalid[1]),
        .I1(s_axis_tvalid[0]),
        .I2(arb_sel_i[0]),
        .I3(arb_sel_i[1]),
        .I4(s_axis_tvalid[2]),
        .O(f_mux_return));
  FDRE arb_busy_r_reg
       (.C(aclk),
        .CE(aclken),
        .D(arb_busy_ns),
        .Q(arb_busy_r),
        .R(areset_r));
  LUT6 #(
    .INIT(64'h040404FF04040400)) 
    \arb_gnt_r[0]_i_1 
       (.I0(sel_i[1]),
        .I1(\arb_gnt_r[2]_i_2_n_0 ),
        .I2(sel_i[0]),
        .I3(areset_r),
        .I4(aclken),
        .I5(\arb_gnt_r_reg[0]_0 ),
        .O(\arb_gnt_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h404040FF40404000)) 
    \arb_gnt_r[1]_i_1 
       (.I0(sel_i[1]),
        .I1(\arb_gnt_r[2]_i_2_n_0 ),
        .I2(sel_i[0]),
        .I3(areset_r),
        .I4(aclken),
        .I5(\arb_gnt_r_reg[1]_0 ),
        .O(\arb_gnt_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h080808FF08080800)) 
    \arb_gnt_r[2]_i_1 
       (.I0(\arb_gnt_r[2]_i_2_n_0 ),
        .I1(sel_i[1]),
        .I2(sel_i[0]),
        .I3(areset_r),
        .I4(aclken),
        .I5(\arb_gnt_r_reg[2]_0 ),
        .O(\arb_gnt_r[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4500)) 
    \arb_gnt_r[2]_i_2 
       (.I0(areset_r),
        .I1(m_axis_tready_0_sn_1),
        .I2(arb_busy_r),
        .I3(valid_i),
        .O(\arb_gnt_r[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFB8880000B888)) 
    \arb_gnt_r[2]_i_3 
       (.I0(port_priority_ns[1]),
        .I1(arb_req_rot[1]),
        .I2(port_priority_ns[3]),
        .I3(arb_req_rot[2]),
        .I4(arb_req_rot[0]),
        .I5(port_priority_ns[5]),
        .O(sel_i[1]));
  LUT6 #(
    .INIT(64'hFFFFB8880000B888)) 
    \arb_gnt_r[2]_i_4 
       (.I0(port_priority_ns[0]),
        .I1(arb_req_rot[1]),
        .I2(port_priority_ns[2]),
        .I3(arb_req_rot[2]),
        .I4(arb_req_rot[0]),
        .I5(port_priority_ns[4]),
        .O(sel_i[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \arb_gnt_r[2]_i_5 
       (.I0(arb_req_i__2[2]),
        .I1(\barrel_cntr_reg_n_0_[0] ),
        .I2(arb_req_i__2[0]),
        .I3(\barrel_cntr_reg_n_0_[1] ),
        .I4(arb_req_i__2[1]),
        .O(arb_req_rot[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \arb_gnt_r[2]_i_6 
       (.I0(arb_req_i__2[0]),
        .I1(\barrel_cntr_reg_n_0_[0] ),
        .I2(arb_req_i__2[1]),
        .I3(\barrel_cntr_reg_n_0_[1] ),
        .I4(arb_req_i__2[2]),
        .O(arb_req_rot[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFCBB3088)) 
    \arb_gnt_r[2]_i_7 
       (.I0(arb_req_i__2[1]),
        .I1(\barrel_cntr_reg_n_0_[0] ),
        .I2(arb_req_i__2[2]),
        .I3(\barrel_cntr_reg_n_0_[1] ),
        .I4(arb_req_i__2[0]),
        .O(arb_req_rot[0]));
  FDRE \arb_gnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_gnt_r[0]_i_1_n_0 ),
        .Q(\arb_gnt_r_reg[0]_0 ),
        .R(1'b0));
  FDRE \arb_gnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_gnt_r[1]_i_1_n_0 ),
        .Q(\arb_gnt_r_reg[1]_0 ),
        .R(1'b0));
  FDRE \arb_gnt_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_gnt_r[2]_i_1_n_0 ),
        .Q(\arb_gnt_r_reg[2]_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF75FF8A000000)) 
    \arb_sel_r[0]_i_1 
       (.I0(aclken),
        .I1(m_axis_tready_0_sn_1),
        .I2(arb_busy_r),
        .I3(valid_i),
        .I4(sel_i[0]),
        .I5(arb_sel_i[0]),
        .O(\arb_sel_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF75FF8A000000)) 
    \arb_sel_r[1]_i_1 
       (.I0(aclken),
        .I1(m_axis_tready_0_sn_1),
        .I2(arb_busy_r),
        .I3(valid_i),
        .I4(sel_i[1]),
        .I5(arb_sel_i[1]),
        .O(\arb_sel_r[1]_i_1_n_0 ));
  FDRE \arb_sel_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_sel_r[0]_i_1_n_0 ),
        .Q(arb_sel_i[0]),
        .R(areset_r));
  FDRE \arb_sel_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_sel_r[1]_i_1_n_0 ),
        .Q(arb_sel_i[1]),
        .R(areset_r));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \barrel_cntr[0]_i_1 
       (.I0(\barrel_cntr_reg_n_0_[1] ),
        .I1(\barrel_cntr_reg_n_0_[0] ),
        .O(barrel_cntr_ns[0]));
  LUT5 #(
    .INIT(32'hAAAAAA8A)) 
    \barrel_cntr[1]_i_1 
       (.I0(aclken),
        .I1(\arb_gnt_r_reg[0]_0 ),
        .I2(arb_busy_r),
        .I3(\arb_gnt_r_reg[1]_0 ),
        .I4(\arb_gnt_r_reg[2]_0 ),
        .O(barrel_cntr));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \barrel_cntr[1]_i_2 
       (.I0(\barrel_cntr_reg_n_0_[1] ),
        .I1(\barrel_cntr_reg_n_0_[0] ),
        .O(barrel_cntr_ns[1]));
  FDRE \barrel_cntr_reg[0] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(barrel_cntr_ns[0]),
        .Q(\barrel_cntr_reg_n_0_[0] ),
        .R(areset_r));
  FDRE \barrel_cntr_reg[1] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(barrel_cntr_ns[1]),
        .Q(\barrel_cntr_reg_n_0_[1] ),
        .R(areset_r));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \gen_tdest_routing.busy_r[0]_i_1 
       (.I0(\arb_gnt_r_reg[2]_0 ),
        .I1(\gen_tdest_routing.busy_r_reg[0] ),
        .I2(m_axis_tready_0_sn_1),
        .O(\gen_tdest_routing.busy_ns ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \gen_tdest_routing.busy_r[0]_i_1__0 
       (.I0(\arb_gnt_r_reg[1]_0 ),
        .I1(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .I2(m_axis_tready_0_sn_1),
        .O(\gen_tdest_routing.busy_ns_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \gen_tdest_routing.busy_r[0]_i_1__1 
       (.I0(\arb_gnt_r_reg[0]_0 ),
        .I1(\gen_tdest_routing.busy_r_reg[0]_1 ),
        .I2(m_axis_tready_0_sn_1),
        .O(\gen_tdest_routing.busy_ns_1 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[0]_INST_0 
       (.I0(s_axis_tdata[128]),
        .I1(s_axis_tdata[0]),
        .I2(s_axis_tdata[64]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[0]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[10]_INST_0 
       (.I0(s_axis_tdata[138]),
        .I1(s_axis_tdata[10]),
        .I2(s_axis_tdata[74]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[10]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[11]_INST_0 
       (.I0(s_axis_tdata[139]),
        .I1(s_axis_tdata[11]),
        .I2(s_axis_tdata[75]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[11]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[12]_INST_0 
       (.I0(s_axis_tdata[140]),
        .I1(s_axis_tdata[12]),
        .I2(s_axis_tdata[76]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[12]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[13]_INST_0 
       (.I0(s_axis_tdata[141]),
        .I1(s_axis_tdata[13]),
        .I2(s_axis_tdata[77]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[13]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[14]_INST_0 
       (.I0(s_axis_tdata[142]),
        .I1(s_axis_tdata[14]),
        .I2(s_axis_tdata[78]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[14]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[15]_INST_0 
       (.I0(s_axis_tdata[143]),
        .I1(s_axis_tdata[15]),
        .I2(s_axis_tdata[79]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[15]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[16]_INST_0 
       (.I0(s_axis_tdata[144]),
        .I1(s_axis_tdata[16]),
        .I2(s_axis_tdata[80]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[16]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[17]_INST_0 
       (.I0(s_axis_tdata[145]),
        .I1(s_axis_tdata[17]),
        .I2(s_axis_tdata[81]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[17]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[18]_INST_0 
       (.I0(s_axis_tdata[146]),
        .I1(s_axis_tdata[18]),
        .I2(s_axis_tdata[82]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[18]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[19]_INST_0 
       (.I0(s_axis_tdata[147]),
        .I1(s_axis_tdata[19]),
        .I2(s_axis_tdata[83]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[19]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[1]_INST_0 
       (.I0(s_axis_tdata[129]),
        .I1(s_axis_tdata[1]),
        .I2(s_axis_tdata[65]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[1]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[20]_INST_0 
       (.I0(s_axis_tdata[148]),
        .I1(s_axis_tdata[20]),
        .I2(s_axis_tdata[84]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[20]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[21]_INST_0 
       (.I0(s_axis_tdata[149]),
        .I1(s_axis_tdata[21]),
        .I2(s_axis_tdata[85]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[21]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[22]_INST_0 
       (.I0(s_axis_tdata[150]),
        .I1(s_axis_tdata[22]),
        .I2(s_axis_tdata[86]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[22]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[23]_INST_0 
       (.I0(s_axis_tdata[151]),
        .I1(s_axis_tdata[23]),
        .I2(s_axis_tdata[87]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[23]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[24]_INST_0 
       (.I0(s_axis_tdata[152]),
        .I1(s_axis_tdata[24]),
        .I2(s_axis_tdata[88]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[24]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[25]_INST_0 
       (.I0(s_axis_tdata[153]),
        .I1(s_axis_tdata[25]),
        .I2(s_axis_tdata[89]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[25]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[26]_INST_0 
       (.I0(s_axis_tdata[154]),
        .I1(s_axis_tdata[26]),
        .I2(s_axis_tdata[90]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[26]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[27]_INST_0 
       (.I0(s_axis_tdata[155]),
        .I1(s_axis_tdata[27]),
        .I2(s_axis_tdata[91]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[27]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[28]_INST_0 
       (.I0(s_axis_tdata[156]),
        .I1(s_axis_tdata[28]),
        .I2(s_axis_tdata[92]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[28]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[29]_INST_0 
       (.I0(s_axis_tdata[157]),
        .I1(s_axis_tdata[29]),
        .I2(s_axis_tdata[93]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[29]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[2]_INST_0 
       (.I0(s_axis_tdata[130]),
        .I1(s_axis_tdata[2]),
        .I2(s_axis_tdata[66]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[2]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[30]_INST_0 
       (.I0(s_axis_tdata[158]),
        .I1(s_axis_tdata[30]),
        .I2(s_axis_tdata[94]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[30]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[31]_INST_0 
       (.I0(s_axis_tdata[159]),
        .I1(s_axis_tdata[31]),
        .I2(s_axis_tdata[95]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[31]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[32]_INST_0 
       (.I0(s_axis_tdata[160]),
        .I1(s_axis_tdata[32]),
        .I2(s_axis_tdata[96]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[32]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[33]_INST_0 
       (.I0(s_axis_tdata[161]),
        .I1(s_axis_tdata[33]),
        .I2(s_axis_tdata[97]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[33]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[34]_INST_0 
       (.I0(s_axis_tdata[162]),
        .I1(s_axis_tdata[34]),
        .I2(s_axis_tdata[98]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[34]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[35]_INST_0 
       (.I0(s_axis_tdata[163]),
        .I1(s_axis_tdata[35]),
        .I2(s_axis_tdata[99]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[35]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[36]_INST_0 
       (.I0(s_axis_tdata[164]),
        .I1(s_axis_tdata[36]),
        .I2(s_axis_tdata[100]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[36]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[37]_INST_0 
       (.I0(s_axis_tdata[165]),
        .I1(s_axis_tdata[37]),
        .I2(s_axis_tdata[101]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[37]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[38]_INST_0 
       (.I0(s_axis_tdata[166]),
        .I1(s_axis_tdata[38]),
        .I2(s_axis_tdata[102]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[38]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[39]_INST_0 
       (.I0(s_axis_tdata[167]),
        .I1(s_axis_tdata[39]),
        .I2(s_axis_tdata[103]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[39]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[3]_INST_0 
       (.I0(s_axis_tdata[131]),
        .I1(s_axis_tdata[3]),
        .I2(s_axis_tdata[67]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[3]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[40]_INST_0 
       (.I0(s_axis_tdata[168]),
        .I1(s_axis_tdata[40]),
        .I2(s_axis_tdata[104]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[40]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[41]_INST_0 
       (.I0(s_axis_tdata[169]),
        .I1(s_axis_tdata[41]),
        .I2(s_axis_tdata[105]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[41]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[42]_INST_0 
       (.I0(s_axis_tdata[170]),
        .I1(s_axis_tdata[42]),
        .I2(s_axis_tdata[106]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[42]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[43]_INST_0 
       (.I0(s_axis_tdata[171]),
        .I1(s_axis_tdata[43]),
        .I2(s_axis_tdata[107]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[43]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[44]_INST_0 
       (.I0(s_axis_tdata[172]),
        .I1(s_axis_tdata[44]),
        .I2(s_axis_tdata[108]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[44]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[45]_INST_0 
       (.I0(s_axis_tdata[173]),
        .I1(s_axis_tdata[45]),
        .I2(s_axis_tdata[109]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[45]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[46]_INST_0 
       (.I0(s_axis_tdata[174]),
        .I1(s_axis_tdata[46]),
        .I2(s_axis_tdata[110]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[46]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[47]_INST_0 
       (.I0(s_axis_tdata[175]),
        .I1(s_axis_tdata[47]),
        .I2(s_axis_tdata[111]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[47]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[48]_INST_0 
       (.I0(s_axis_tdata[176]),
        .I1(s_axis_tdata[48]),
        .I2(s_axis_tdata[112]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[48]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[49]_INST_0 
       (.I0(s_axis_tdata[177]),
        .I1(s_axis_tdata[49]),
        .I2(s_axis_tdata[113]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[49]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[4]_INST_0 
       (.I0(s_axis_tdata[132]),
        .I1(s_axis_tdata[4]),
        .I2(s_axis_tdata[68]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[4]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[50]_INST_0 
       (.I0(s_axis_tdata[178]),
        .I1(s_axis_tdata[50]),
        .I2(s_axis_tdata[114]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[50]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[51]_INST_0 
       (.I0(s_axis_tdata[179]),
        .I1(s_axis_tdata[51]),
        .I2(s_axis_tdata[115]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[51]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[52]_INST_0 
       (.I0(s_axis_tdata[180]),
        .I1(s_axis_tdata[52]),
        .I2(s_axis_tdata[116]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[52]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[53]_INST_0 
       (.I0(s_axis_tdata[181]),
        .I1(s_axis_tdata[53]),
        .I2(s_axis_tdata[117]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[53]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[54]_INST_0 
       (.I0(s_axis_tdata[182]),
        .I1(s_axis_tdata[54]),
        .I2(s_axis_tdata[118]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[54]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[55]_INST_0 
       (.I0(s_axis_tdata[183]),
        .I1(s_axis_tdata[55]),
        .I2(s_axis_tdata[119]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[55]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[56]_INST_0 
       (.I0(s_axis_tdata[184]),
        .I1(s_axis_tdata[56]),
        .I2(s_axis_tdata[120]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[56]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[57]_INST_0 
       (.I0(s_axis_tdata[185]),
        .I1(s_axis_tdata[57]),
        .I2(s_axis_tdata[121]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[57]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[58]_INST_0 
       (.I0(s_axis_tdata[186]),
        .I1(s_axis_tdata[58]),
        .I2(s_axis_tdata[122]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[58]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[59]_INST_0 
       (.I0(s_axis_tdata[187]),
        .I1(s_axis_tdata[59]),
        .I2(s_axis_tdata[123]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[59]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[5]_INST_0 
       (.I0(s_axis_tdata[133]),
        .I1(s_axis_tdata[5]),
        .I2(s_axis_tdata[69]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[5]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[60]_INST_0 
       (.I0(s_axis_tdata[188]),
        .I1(s_axis_tdata[60]),
        .I2(s_axis_tdata[124]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[60]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[61]_INST_0 
       (.I0(s_axis_tdata[189]),
        .I1(s_axis_tdata[61]),
        .I2(s_axis_tdata[125]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[61]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[62]_INST_0 
       (.I0(s_axis_tdata[190]),
        .I1(s_axis_tdata[62]),
        .I2(s_axis_tdata[126]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[62]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[63]_INST_0 
       (.I0(s_axis_tdata[191]),
        .I1(s_axis_tdata[63]),
        .I2(s_axis_tdata[127]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[63]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[6]_INST_0 
       (.I0(s_axis_tdata[134]),
        .I1(s_axis_tdata[6]),
        .I2(s_axis_tdata[70]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[6]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[7]_INST_0 
       (.I0(s_axis_tdata[135]),
        .I1(s_axis_tdata[7]),
        .I2(s_axis_tdata[71]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[7]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[8]_INST_0 
       (.I0(s_axis_tdata[136]),
        .I1(s_axis_tdata[8]),
        .I2(s_axis_tdata[72]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[8]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tdata[9]_INST_0 
       (.I0(s_axis_tdata[137]),
        .I1(s_axis_tdata[9]),
        .I2(s_axis_tdata[73]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tdata[9]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tlast[0]_INST_0 
       (.I0(s_axis_tlast[2]),
        .I1(s_axis_tlast[0]),
        .I2(s_axis_tlast[1]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tlast));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[0]_INST_0 
       (.I0(s_axis_tstrb[16]),
        .I1(s_axis_tstrb[0]),
        .I2(s_axis_tstrb[8]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[0]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[1]_INST_0 
       (.I0(s_axis_tstrb[17]),
        .I1(s_axis_tstrb[1]),
        .I2(s_axis_tstrb[9]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[1]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[2]_INST_0 
       (.I0(s_axis_tstrb[18]),
        .I1(s_axis_tstrb[2]),
        .I2(s_axis_tstrb[10]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[2]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[3]_INST_0 
       (.I0(s_axis_tstrb[19]),
        .I1(s_axis_tstrb[3]),
        .I2(s_axis_tstrb[11]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[3]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[4]_INST_0 
       (.I0(s_axis_tstrb[20]),
        .I1(s_axis_tstrb[4]),
        .I2(s_axis_tstrb[12]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[4]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[5]_INST_0 
       (.I0(s_axis_tstrb[21]),
        .I1(s_axis_tstrb[5]),
        .I2(s_axis_tstrb[13]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[5]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[6]_INST_0 
       (.I0(s_axis_tstrb[22]),
        .I1(s_axis_tstrb[6]),
        .I2(s_axis_tstrb[14]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[6]));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \m_axis_tstrb[7]_INST_0 
       (.I0(s_axis_tstrb[23]),
        .I1(s_axis_tstrb[7]),
        .I2(s_axis_tstrb[15]),
        .I3(arb_sel_i[0]),
        .I4(arb_sel_i[1]),
        .O(m_axis_tstrb[7]));
  LUT6 #(
    .INIT(64'h3B380B0800000000)) 
    \m_axis_tvalid[0]_INST_0 
       (.I0(s_axis_tvalid[2]),
        .I1(arb_sel_i[1]),
        .I2(arb_sel_i[0]),
        .I3(s_axis_tvalid[0]),
        .I4(s_axis_tvalid[1]),
        .I5(\m_axis_tvalid[0]_INST_0_i_1_n_0 ),
        .O(m_axis_tvalid));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \m_axis_tvalid[0]_INST_0_i_1 
       (.I0(\arb_gnt_r_reg[2]_0 ),
        .I1(\gen_tdest_router.busy_r [2]),
        .I2(\arb_gnt_r_reg[1]_0 ),
        .I3(\gen_tdest_router.busy_r [1]),
        .I4(\gen_tdest_router.busy_r [0]),
        .I5(\arb_gnt_r_reg[0]_0 ),
        .O(\m_axis_tvalid[0]_INST_0_i_1_n_0 ));
  FDRE \port_priority_r_reg[0] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[0]),
        .Q(port_priority_ns[4]),
        .R(areset_r));
  FDRE \port_priority_r_reg[1] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[1]),
        .Q(port_priority_ns[5]),
        .R(areset_r));
  FDSE \port_priority_r_reg[2] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[2]),
        .Q(port_priority_ns[0]),
        .S(areset_r));
  FDRE \port_priority_r_reg[3] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[3]),
        .Q(port_priority_ns[1]),
        .R(areset_r));
  FDRE \port_priority_r_reg[4] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[4]),
        .Q(port_priority_ns[2]),
        .R(areset_r));
  FDSE \port_priority_r_reg[5] 
       (.C(aclk),
        .CE(barrel_cntr),
        .D(port_priority_ns[5]),
        .Q(port_priority_ns[3]),
        .S(areset_r));
endmodule

(* C_ARB_ALGORITHM = "0" *) (* C_ARB_ON_MAX_XFERS = "1" *) (* C_ARB_ON_NUM_CYCLES = "0" *) 
(* C_ARB_ON_TLAST = "0" *) (* C_AXIS_SIGNAL_SET = "23" *) (* C_AXIS_TDATA_WIDTH = "64" *) 
(* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TUSER_WIDTH = "1" *) 
(* C_COMMON_CLOCK = "0" *) (* C_DECODER_REG = "0" *) (* C_FAMILY = "zynq" *) 
(* C_INCLUDE_ARBITER = "1" *) (* C_LOG_SI_SLOTS = "2" *) (* C_M_AXIS_BASETDEST_ARRAY = "1'b0" *) 
(* C_M_AXIS_CONNECTIVITY_ARRAY = "3'b111" *) (* C_M_AXIS_HIGHTDEST_ARRAY = "1'b0" *) (* C_NUM_MI_SLOTS = "1" *) 
(* C_NUM_SI_SLOTS = "3" *) (* C_OUTPUT_REG = "0" *) (* C_ROUTING_MODE = "0" *) 
(* C_S_AXI_CTRL_ADDR_WIDTH = "7" *) (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* G_TASK_SEVERITY_WARNING = "1" *) (* LP_CTRL_REG_WIDTH = "20" *) (* LP_MERGEDOWN_MUX = "0" *) 
(* LP_NUM_SYNCHRONIZER_STAGES = "4" *) (* ORIG_REF_NAME = "axis_switch_v1_1_19_axis_switch" *) (* P_DECODER_CONNECTIVITY_ARRAY = "3'b111" *) 
(* P_SINGLE_SLAVE_CONNECTIVITY_ARRAY = "1'b0" *) (* P_TPAYLOAD_WIDTH = "73" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch
   (aclk,
    aresetn,
    aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    arb_req,
    arb_done,
    arb_gnt,
    arb_sel,
    arb_last,
    arb_id,
    arb_dest,
    arb_user,
    s_req_suppress,
    s_axi_ctrl_aclk,
    s_axi_ctrl_aresetn,
    s_axi_ctrl_awvalid,
    s_axi_ctrl_awready,
    s_axi_ctrl_awaddr,
    s_axi_ctrl_wvalid,
    s_axi_ctrl_wready,
    s_axi_ctrl_wdata,
    s_axi_ctrl_bvalid,
    s_axi_ctrl_bready,
    s_axi_ctrl_bresp,
    s_axi_ctrl_arvalid,
    s_axi_ctrl_arready,
    s_axi_ctrl_araddr,
    s_axi_ctrl_rvalid,
    s_axi_ctrl_rready,
    s_axi_ctrl_rdata,
    s_axi_ctrl_rresp,
    s_decode_err);
  input aclk;
  input aresetn;
  input aclken;
  input [2:0]s_axis_tvalid;
  output [2:0]s_axis_tready;
  input [191:0]s_axis_tdata;
  input [23:0]s_axis_tstrb;
  input [23:0]s_axis_tkeep;
  input [2:0]s_axis_tlast;
  input [2:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [2:0]s_axis_tuser;
  output [0:0]m_axis_tvalid;
  input [0:0]m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output [0:0]m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  output [2:0]arb_req;
  output [0:0]arb_done;
  input [2:0]arb_gnt;
  input [1:0]arb_sel;
  output [2:0]arb_last;
  output [2:0]arb_id;
  output [2:0]arb_dest;
  output [2:0]arb_user;
  input [2:0]s_req_suppress;
  input s_axi_ctrl_aclk;
  input s_axi_ctrl_aresetn;
  input s_axi_ctrl_awvalid;
  output s_axi_ctrl_awready;
  input [6:0]s_axi_ctrl_awaddr;
  input s_axi_ctrl_wvalid;
  output s_axi_ctrl_wready;
  input [31:0]s_axi_ctrl_wdata;
  output s_axi_ctrl_bvalid;
  input s_axi_ctrl_bready;
  output [1:0]s_axi_ctrl_bresp;
  input s_axi_ctrl_arvalid;
  output s_axi_ctrl_arready;
  input [6:0]s_axi_ctrl_araddr;
  output s_axi_ctrl_rvalid;
  input s_axi_ctrl_rready;
  output [31:0]s_axi_ctrl_rdata;
  output [1:0]s_axi_ctrl_rresp;
  output [2:0]s_decode_err;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aclken;
  wire [2:0]arb_gnt_i;
  wire areset_r;
  wire aresetn;
  wire \gen_decoder[0].axisc_decoder_0_n_0 ;
  wire \gen_decoder[1].axisc_decoder_0_n_0 ;
  wire \gen_decoder[2].axisc_decoder_0_n_0 ;
  wire [2:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_tdest_routing.busy_ns_1 ;
  wire [63:0]m_axis_tdata;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire p_0_in;
  wire p_0_out;
  wire [191:0]s_axis_tdata;
  wire [2:0]s_axis_tlast;
  wire [2:0]s_axis_tready;
  wire [23:0]s_axis_tstrb;
  wire [2:0]s_axis_tvalid;
  wire [2:0]s_req_suppress;

  assign arb_dest[2] = \<const0> ;
  assign arb_dest[1] = \<const0> ;
  assign arb_dest[0] = \<const0> ;
  assign arb_done[0] = \<const0> ;
  assign arb_id[2] = \<const0> ;
  assign arb_id[1] = \<const0> ;
  assign arb_id[0] = \<const0> ;
  assign arb_last[2] = \<const0> ;
  assign arb_last[1] = \<const0> ;
  assign arb_last[0] = \<const0> ;
  assign arb_req[2] = \<const0> ;
  assign arb_req[1] = \<const0> ;
  assign arb_req[0] = \<const0> ;
  assign arb_user[2] = \<const0> ;
  assign arb_user[1] = \<const0> ;
  assign arb_user[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[7] = \<const1> ;
  assign m_axis_tkeep[6] = \<const1> ;
  assign m_axis_tkeep[5] = \<const1> ;
  assign m_axis_tkeep[4] = \<const1> ;
  assign m_axis_tkeep[3] = \<const1> ;
  assign m_axis_tkeep[2] = \<const1> ;
  assign m_axis_tkeep[1] = \<const1> ;
  assign m_axis_tkeep[0] = \<const1> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign s_axi_ctrl_arready = \<const0> ;
  assign s_axi_ctrl_awready = \<const0> ;
  assign s_axi_ctrl_bresp[1] = \<const0> ;
  assign s_axi_ctrl_bresp[0] = \<const0> ;
  assign s_axi_ctrl_bvalid = \<const0> ;
  assign s_axi_ctrl_rdata[31] = \<const0> ;
  assign s_axi_ctrl_rdata[30] = \<const0> ;
  assign s_axi_ctrl_rdata[29] = \<const0> ;
  assign s_axi_ctrl_rdata[28] = \<const0> ;
  assign s_axi_ctrl_rdata[27] = \<const0> ;
  assign s_axi_ctrl_rdata[26] = \<const0> ;
  assign s_axi_ctrl_rdata[25] = \<const0> ;
  assign s_axi_ctrl_rdata[24] = \<const0> ;
  assign s_axi_ctrl_rdata[23] = \<const0> ;
  assign s_axi_ctrl_rdata[22] = \<const0> ;
  assign s_axi_ctrl_rdata[21] = \<const0> ;
  assign s_axi_ctrl_rdata[20] = \<const0> ;
  assign s_axi_ctrl_rdata[19] = \<const0> ;
  assign s_axi_ctrl_rdata[18] = \<const0> ;
  assign s_axi_ctrl_rdata[17] = \<const0> ;
  assign s_axi_ctrl_rdata[16] = \<const0> ;
  assign s_axi_ctrl_rdata[15] = \<const0> ;
  assign s_axi_ctrl_rdata[14] = \<const0> ;
  assign s_axi_ctrl_rdata[13] = \<const0> ;
  assign s_axi_ctrl_rdata[12] = \<const0> ;
  assign s_axi_ctrl_rdata[11] = \<const0> ;
  assign s_axi_ctrl_rdata[10] = \<const0> ;
  assign s_axi_ctrl_rdata[9] = \<const0> ;
  assign s_axi_ctrl_rdata[8] = \<const0> ;
  assign s_axi_ctrl_rdata[7] = \<const0> ;
  assign s_axi_ctrl_rdata[6] = \<const0> ;
  assign s_axi_ctrl_rdata[5] = \<const0> ;
  assign s_axi_ctrl_rdata[4] = \<const0> ;
  assign s_axi_ctrl_rdata[3] = \<const0> ;
  assign s_axi_ctrl_rdata[2] = \<const0> ;
  assign s_axi_ctrl_rdata[1] = \<const0> ;
  assign s_axi_ctrl_rdata[0] = \<const0> ;
  assign s_axi_ctrl_rresp[1] = \<const0> ;
  assign s_axi_ctrl_rresp[0] = \<const0> ;
  assign s_axi_ctrl_rvalid = \<const0> ;
  assign s_axi_ctrl_wready = \<const0> ;
  assign s_decode_err[2] = \<const0> ;
  assign s_decode_err[1] = \<const0> ;
  assign s_decode_err[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    areset_r_i_1
       (.I0(aresetn),
        .O(p_0_in));
  FDRE areset_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(areset_r),
        .R(1'b0));
  effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder \gen_decoder[0].axisc_decoder_0 
       (.aclk(aclk),
        .aclken(aclken),
        .areset_r(areset_r),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[0].axisc_decoder_0_n_0 ));
  effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0 \gen_decoder[1].axisc_decoder_0 
       (.aclk(aclk),
        .aclken(aclken),
        .areset_r(areset_r),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[1].axisc_decoder_0_n_0 ));
  effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1 \gen_decoder[2].axisc_decoder_0 
       (.aclk(aclk),
        .aclken(aclken),
        .areset_r(areset_r),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns_1 ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[2].axisc_decoder_0_n_0 ));
  effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter \gen_int_arbiter.gen_arbiter.axis_switch_v1_1_19_axis_switch_arbiter 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i),
        .areset_r(areset_r),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns_1 ),
        .\gen_tdest_routing.busy_ns_0 (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_ns_1 (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_r_reg[0] (\gen_decoder[2].axisc_decoder_0_n_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[1].axisc_decoder_0_n_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_1 (\gen_decoder[0].axisc_decoder_0_n_0 ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tvalid(m_axis_tvalid),
        .p_0_out(p_0_out),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tvalid(s_axis_tvalid),
        .s_req_suppress(s_req_suppress));
  effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux \gen_transfer_mux[0].axisc_transfer_mux_0 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i),
        .areset_r(areset_r),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .m_axis_tready(m_axis_tready),
        .p_0_out(p_0_out),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axis_switch_arbiter" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter
   (\gen_tdest_routing.busy_ns ,
    arb_gnt_i,
    p_0_out,
    \gen_tdest_routing.busy_ns_0 ,
    \gen_tdest_routing.busy_ns_1 ,
    m_axis_tvalid,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    areset_r,
    aclken,
    aclk,
    \gen_tdest_routing.busy_r_reg[0] ,
    s_req_suppress,
    s_axis_tvalid,
    \gen_tdest_routing.busy_r_reg[0]_0 ,
    \gen_tdest_routing.busy_r_reg[0]_1 ,
    m_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    \gen_tdest_router.busy_r );
  output \gen_tdest_routing.busy_ns ;
  output [2:0]arb_gnt_i;
  output p_0_out;
  output \gen_tdest_routing.busy_ns_0 ;
  output \gen_tdest_routing.busy_ns_1 ;
  output [0:0]m_axis_tvalid;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [0:0]m_axis_tlast;
  input areset_r;
  input aclken;
  input aclk;
  input \gen_tdest_routing.busy_r_reg[0] ;
  input [2:0]s_req_suppress;
  input [2:0]s_axis_tvalid;
  input \gen_tdest_routing.busy_r_reg[0]_0 ;
  input \gen_tdest_routing.busy_r_reg[0]_1 ;
  input [0:0]m_axis_tready;
  input [191:0]s_axis_tdata;
  input [23:0]s_axis_tstrb;
  input [2:0]s_axis_tlast;
  input [2:0]\gen_tdest_router.busy_r ;

  wire aclk;
  wire aclken;
  wire [2:0]arb_gnt_i;
  wire areset_r;
  wire [2:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_tdest_routing.busy_ns_1 ;
  wire \gen_tdest_routing.busy_r_reg[0] ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;
  wire \gen_tdest_routing.busy_r_reg[0]_1 ;
  wire [63:0]m_axis_tdata;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire p_0_out;
  wire [191:0]s_axis_tdata;
  wire [2:0]s_axis_tlast;
  wire [23:0]s_axis_tstrb;
  wire [2:0]s_axis_tvalid;
  wire [2:0]s_req_suppress;

  effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr \gen_mi_arb[0].gen_arb_algorithm.gen_round_robin.inst_arb_rr_0 
       (.aclk(aclk),
        .aclken(aclken),
        .\arb_gnt_r_reg[0]_0 (arb_gnt_i[0]),
        .\arb_gnt_r_reg[1]_0 (arb_gnt_i[1]),
        .\arb_gnt_r_reg[2]_0 (arb_gnt_i[2]),
        .areset_r(areset_r),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_ns_0 (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_ns_1 (\gen_tdest_routing.busy_ns_1 ),
        .\gen_tdest_routing.busy_r_reg[0] (\gen_tdest_routing.busy_r_reg[0] ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_tdest_routing.busy_r_reg[0]_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_1 (\gen_tdest_routing.busy_r_reg[0]_1 ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tready_0_sp_1(p_0_out),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tvalid(s_axis_tvalid),
        .s_req_suppress(s_req_suppress));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axisc_arb_responder" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder
   (s_axis_tready,
    \gen_tdest_router.busy_r ,
    s_axis_tvalid,
    m_axis_tready,
    arb_gnt_i,
    areset_r,
    aclken,
    p_0_out,
    aclk);
  output [2:0]s_axis_tready;
  output [2:0]\gen_tdest_router.busy_r ;
  input [2:0]s_axis_tvalid;
  input [0:0]m_axis_tready;
  input [2:0]arb_gnt_i;
  input areset_r;
  input aclken;
  input p_0_out;
  input aclk;

  wire aclk;
  wire aclken;
  wire [2:0]arb_gnt_i;
  wire areset_r;
  wire \busy_r[0]_i_1_n_0 ;
  wire \busy_r[1]_i_1_n_0 ;
  wire \busy_r[2]_i_1_n_0 ;
  wire [2:0]\gen_tdest_router.busy_r ;
  wire [0:0]m_axis_tready;
  wire p_0_out;
  wire [2:0]s_axis_tready;
  wire [2:0]s_axis_tvalid;

  LUT5 #(
    .INIT(32'h000A0E0A)) 
    \busy_r[0]_i_1 
       (.I0(\gen_tdest_router.busy_r [0]),
        .I1(arb_gnt_i[0]),
        .I2(areset_r),
        .I3(aclken),
        .I4(p_0_out),
        .O(\busy_r[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000A0E0A)) 
    \busy_r[1]_i_1 
       (.I0(\gen_tdest_router.busy_r [1]),
        .I1(arb_gnt_i[1]),
        .I2(areset_r),
        .I3(aclken),
        .I4(p_0_out),
        .O(\busy_r[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000A0E0A)) 
    \busy_r[2]_i_1 
       (.I0(\gen_tdest_router.busy_r [2]),
        .I1(arb_gnt_i[2]),
        .I2(areset_r),
        .I3(aclken),
        .I4(p_0_out),
        .O(\busy_r[2]_i_1_n_0 ));
  FDRE \busy_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\busy_r[0]_i_1_n_0 ),
        .Q(\gen_tdest_router.busy_r [0]),
        .R(1'b0));
  FDRE \busy_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\busy_r[1]_i_1_n_0 ),
        .Q(\gen_tdest_router.busy_r [1]),
        .R(1'b0));
  FDRE \busy_r_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\busy_r[2]_i_1_n_0 ),
        .Q(\gen_tdest_router.busy_r [2]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8880)) 
    \s_axis_tready[0]_INST_0 
       (.I0(s_axis_tvalid[0]),
        .I1(m_axis_tready),
        .I2(\gen_tdest_router.busy_r [0]),
        .I3(arb_gnt_i[0]),
        .O(s_axis_tready[0]));
  LUT4 #(
    .INIT(16'h8880)) 
    \s_axis_tready[1]_INST_0 
       (.I0(s_axis_tvalid[1]),
        .I1(m_axis_tready),
        .I2(\gen_tdest_router.busy_r [1]),
        .I3(arb_gnt_i[1]),
        .O(s_axis_tready[1]));
  LUT4 #(
    .INIT(16'h8880)) 
    \s_axis_tready[2]_INST_0 
       (.I0(s_axis_tvalid[2]),
        .I1(m_axis_tready),
        .I2(\gen_tdest_router.busy_r [2]),
        .I3(arb_gnt_i[2]),
        .O(s_axis_tready[2]));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axisc_decoder" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder
   (\gen_tdest_routing.busy_r_reg[0]_0 ,
    areset_r,
    aclken,
    \gen_tdest_routing.busy_ns ,
    aclk);
  output \gen_tdest_routing.busy_r_reg[0]_0 ;
  input areset_r;
  input aclken;
  input \gen_tdest_routing.busy_ns ;
  input aclk;

  wire aclk;
  wire aclken;
  wire areset_r;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;

  FDRE \gen_tdest_routing.busy_r_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\gen_tdest_routing.busy_ns ),
        .Q(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .R(areset_r));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axisc_decoder" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0
   (\gen_tdest_routing.busy_r_reg[0]_0 ,
    areset_r,
    aclken,
    \gen_tdest_routing.busy_ns ,
    aclk);
  output \gen_tdest_routing.busy_r_reg[0]_0 ;
  input areset_r;
  input aclken;
  input \gen_tdest_routing.busy_ns ;
  input aclk;

  wire aclk;
  wire aclken;
  wire areset_r;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;

  FDRE \gen_tdest_routing.busy_r_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\gen_tdest_routing.busy_ns ),
        .Q(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .R(areset_r));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axisc_decoder" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1
   (\gen_tdest_routing.busy_r_reg[0]_0 ,
    areset_r,
    aclken,
    \gen_tdest_routing.busy_ns ,
    aclk);
  output \gen_tdest_routing.busy_r_reg[0]_0 ;
  input areset_r;
  input aclken;
  input \gen_tdest_routing.busy_ns ;
  input aclk;

  wire aclk;
  wire aclken;
  wire areset_r;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;

  FDRE \gen_tdest_routing.busy_r_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\gen_tdest_routing.busy_ns ),
        .Q(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .R(areset_r));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_19_axisc_transfer_mux" *) 
module effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux
   (s_axis_tready,
    \gen_tdest_router.busy_r ,
    s_axis_tvalid,
    m_axis_tready,
    arb_gnt_i,
    areset_r,
    aclken,
    p_0_out,
    aclk);
  output [2:0]s_axis_tready;
  output [2:0]\gen_tdest_router.busy_r ;
  input [2:0]s_axis_tvalid;
  input [0:0]m_axis_tready;
  input [2:0]arb_gnt_i;
  input areset_r;
  input aclken;
  input p_0_out;
  input aclk;

  wire aclk;
  wire aclken;
  wire [2:0]arb_gnt_i;
  wire areset_r;
  wire [2:0]\gen_tdest_router.busy_r ;
  wire [0:0]m_axis_tready;
  wire p_0_out;
  wire [2:0]s_axis_tready;
  wire [2:0]s_axis_tvalid;

  effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder \gen_tdest_router.axisc_arb_responder 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i),
        .areset_r(areset_r),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .m_axis_tready(m_axis_tready),
        .p_0_out(p_0_out),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
