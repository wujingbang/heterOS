
`timescale 1 ns / 1 ps

	(* DONT_TOUCH = "yes" *) module axidma_middleware_v1_0 #
	(
		// Users to add parameters here
        parameter integer CH0_DMA_MM2S_ADDR_BASE = 32'h41E00000,
        parameter integer CH0_DMA_S2MM_ADDR_BASE = 32'h40400000,
        
        parameter integer CH1_DMA_MM2S_ADDR_BASE = 32'h41E00000,
        parameter integer CH1_DMA_S2MM_ADDR_BASE = 32'h40400000,
       
		// User parameters ends
		// Do not modify the parameters beyond this line

        parameter integer C_LENGTH_WIDTH = 12,

		// Parameters of Axi Master Bus Interface M00_AXI
		parameter integer C_M_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		
        // Parameters of Axi Slave Bus Interface S_AXI_FULL
		parameter integer C_S_AXI_ID_WIDTH	= 1,
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 6,
		parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_S_AXI_WUSER_WIDTH	= 0,
		parameter integer C_S_AXI_RUSER_WIDTH	= 0,
		parameter integer C_S_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

        input wire irq_s2mm_in_0,
        input wire irq_mm2s_in_0,
        output wire irq_out_0,
        output wire [3:0] axis_tdest_0,
        output wire [15:0] axis_suppress_0,
        output wire axis_aclken_0,
        
        input wire irq_s2mm_in_1,
        input wire irq_mm2s_in_1,
        output wire irq_out_1,
        output wire [3:0] axis_tdest_1,
        output wire [15:0] axis_suppress_1,
        output wire resetn_out_1,
		// Ports of Axi Slave Bus Interface Scontrol_AXI
		input wire  s_axi_aclk,
		input wire  s_axi_aresetn,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] sctrl_axi_awaddr,
		input wire [2 : 0] sctrl_axi_awprot,
		input wire  sctrl_axi_awvalid,
		output wire  sctrl_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] sctrl_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] sctrl_axi_wstrb,
		input wire  sctrl_axi_wvalid,
		output wire  sctrl_axi_wready,
		output wire [1 : 0] sctrl_axi_bresp,
		output wire  sctrl_axi_bvalid,
		input wire  sctrl_axi_bready,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] sctrl_axi_araddr,
		input wire [2 : 0] sctrl_axi_arprot,
		input wire  sctrl_axi_arvalid,
		output wire  sctrl_axi_arready,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] sctrl_axi_rdata,
		output wire [1 : 0] sctrl_axi_rresp,
		output wire  sctrl_axi_rvalid,
		input wire  sctrl_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXI
//		input wire  m00_axi_lite_init_axi_txn,
//		output wire  m00_axi_lite_error,
//		output wire  m00_axi_lite_txn_done,
		input wire  m00_axi_lite_aclk,
		input wire  m00_axi_lite_aresetn,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m00_axi_lite_awaddr,
		output wire [2 : 0] m00_axi_lite_awprot,
		output wire  m00_axi_lite_awvalid,
		input wire  m00_axi_lite_awready,
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] m00_axi_lite_wdata,
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m00_axi_lite_wstrb,
		output wire  m00_axi_lite_wvalid,
		input wire  m00_axi_lite_wready,
		input wire [1 : 0] m00_axi_lite_bresp,
		input wire  m00_axi_lite_bvalid,
		output wire  m00_axi_lite_bready,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m00_axi_lite_araddr,
		output wire [2 : 0] m00_axi_lite_arprot,
		output wire  m00_axi_lite_arvalid,
		input wire  m00_axi_lite_arready,
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] m00_axi_lite_rdata,
		input wire [1 : 0] m00_axi_lite_rresp,
		input wire  m00_axi_lite_rvalid,
		output wire  m00_axi_lite_rready,
		
		// Ports of Axi Slave Bus Interface S01_AXI
//		input wire  s00_axi_aclk,
//		input wire  s00_axi_aresetn,
		input wire [C_S_AXI_ID_WIDTH-1 : 0] s00_axi_awid,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [7 : 0] s00_axi_awlen,
		input wire [2 : 0] s00_axi_awsize,
		input wire [1 : 0] s00_axi_awburst,
		input wire  s00_axi_awlock,
		input wire [3 : 0] s00_axi_awcache,
		input wire [2 : 0] s00_axi_awprot,
		input wire [3 : 0] s00_axi_awqos,
		input wire [3 : 0] s00_axi_awregion,
		input wire [C_S_AXI_AWUSER_WIDTH-1 : 0] s00_axi_awuser,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wlast,
		input wire [C_S_AXI_WUSER_WIDTH-1 : 0] s00_axi_wuser,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [C_S_AXI_ID_WIDTH-1 : 0] s00_axi_bid,
		output wire [1 : 0] s00_axi_bresp,
		output wire [C_S_AXI_BUSER_WIDTH-1 : 0] s00_axi_buser,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S_AXI_ID_WIDTH-1 : 0] s00_axi_arid,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [7 : 0] s00_axi_arlen,
		input wire [2 : 0] s00_axi_arsize,
		input wire [1 : 0] s00_axi_arburst,
		input wire  s00_axi_arlock,
		input wire [3 : 0] s00_axi_arcache,
		input wire [2 : 0] s00_axi_arprot,
		input wire [3 : 0] s00_axi_arqos,
		input wire [3 : 0] s00_axi_arregion,
		input wire [C_S_AXI_ARUSER_WIDTH-1 : 0] s00_axi_aruser,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S_AXI_ID_WIDTH-1 : 0] s00_axi_rid,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rlast,
		output wire [C_S_AXI_RUSER_WIDTH-1 : 0] s00_axi_ruser,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,
		
		// Ports of Axi Master Bus Interface M00_AXI
//		input wire  m01_axi_lite_init_axi_txn,
//		output wire  m01_axi_lite_error,
//		output wire  m01_axi_lite_txn_done,
		input wire  m01_axi_lite_aclk,
		input wire  m01_axi_lite_aresetn,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m01_axi_lite_awaddr,
		output wire [2 : 0] m01_axi_lite_awprot,
		output wire  m01_axi_lite_awvalid,
		input wire  m01_axi_lite_awready,
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] m01_axi_lite_wdata,
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m01_axi_lite_wstrb,
		output wire  m01_axi_lite_wvalid,
		input wire  m01_axi_lite_wready,
		input wire [1 : 0] m01_axi_lite_bresp,
		input wire  m01_axi_lite_bvalid,
		output wire  m01_axi_lite_bready,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m01_axi_lite_araddr,
		output wire [2 : 0] m01_axi_lite_arprot,
		output wire  m01_axi_lite_arvalid,
		input wire  m01_axi_lite_arready,
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] m01_axi_lite_rdata,
		input wire [1 : 0] m01_axi_lite_rresp,
		input wire  m01_axi_lite_rvalid,
		output wire  m01_axi_lite_rready,
		
		// Ports of Axi Slave Bus Interface S01_AXI
//		input wire  s01_axi_aclk,
//		input wire  s01_axi_aresetn,
		input wire [C_S_AXI_ID_WIDTH-1 : 0] s01_axi_awid,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s01_axi_awaddr,
		input wire [7 : 0] s01_axi_awlen,
		input wire [2 : 0] s01_axi_awsize,
		input wire [1 : 0] s01_axi_awburst,
		input wire  s01_axi_awlock,
		input wire [3 : 0] s01_axi_awcache,
		input wire [2 : 0] s01_axi_awprot,
		input wire [3 : 0] s01_axi_awqos,
		input wire [3 : 0] s01_axi_awregion,
		input wire [C_S_AXI_AWUSER_WIDTH-1 : 0] s01_axi_awuser,
		input wire  s01_axi_awvalid,
		output wire  s01_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s01_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s01_axi_wstrb,
		input wire  s01_axi_wlast,
		input wire [C_S_AXI_WUSER_WIDTH-1 : 0] s01_axi_wuser,
		input wire  s01_axi_wvalid,
		output wire  s01_axi_wready,
		output wire [C_S_AXI_ID_WIDTH-1 : 0] s01_axi_bid,
		output wire [1 : 0] s01_axi_bresp,
		output wire [C_S_AXI_BUSER_WIDTH-1 : 0] s01_axi_buser,
		output wire  s01_axi_bvalid,
		input wire  s01_axi_bready,
		input wire [C_S_AXI_ID_WIDTH-1 : 0] s01_axi_arid,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s01_axi_araddr,
		input wire [7 : 0] s01_axi_arlen,
		input wire [2 : 0] s01_axi_arsize,
		input wire [1 : 0] s01_axi_arburst,
		input wire  s01_axi_arlock,
		input wire [3 : 0] s01_axi_arcache,
		input wire [2 : 0] s01_axi_arprot,
		input wire [3 : 0] s01_axi_arqos,
		input wire [3 : 0] s01_axi_arregion,
		input wire [C_S_AXI_ARUSER_WIDTH-1 : 0] s01_axi_aruser,
		input wire  s01_axi_arvalid,
		output wire  s01_axi_arready,
		output wire [C_S_AXI_ID_WIDTH-1 : 0] s01_axi_rid,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s01_axi_rdata,
		output wire [1 : 0] s01_axi_rresp,
		output wire  s01_axi_rlast,
		output wire [C_S_AXI_RUSER_WIDTH-1 : 0] s01_axi_ruser,
		output wire  s01_axi_rvalid,
		input wire  s01_axi_rready
	);
    
    dma_channel # (
        .DMA_MM2S_ADDR_BASE(CH0_DMA_MM2S_ADDR_BASE),
        .DMA_S2MM_ADDR_BASE(CH0_DMA_S2MM_ADDR_BASE),
        .C_LENGTH_WIDTH(C_LENGTH_WIDTH),
		.C_M00_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
		.C_M00_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH),
		.C_S00_AXI_ID_WIDTH(C_S_AXI_ID_WIDTH),
		.C_S00_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S00_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
		.C_S00_AXI_AWUSER_WIDTH(C_S_AXI_AWUSER_WIDTH),
		.C_S00_AXI_ARUSER_WIDTH(C_S_AXI_ARUSER_WIDTH),
		.C_S00_AXI_WUSER_WIDTH(C_S_AXI_WUSER_WIDTH),
		.C_S00_AXI_RUSER_WIDTH(C_S_AXI_RUSER_WIDTH),
		.C_S00_AXI_BUSER_WIDTH(C_S_AXI_BUSER_WIDTH)
    )dma_channel_c0_inst (

        .irq_s2mm_in(irq_s2mm_in_0),
        .irq_mm2s_in(irq_mm2s_in_0),
        .irq_out(irq_out_0),
        .axis_tdest_mm2s(axis_tdest_0),
        .axis_suppress(axis_suppress_0),
        .axis_aclken(axis_aclken_0),
        //.resetn_out(dma_resetn_out_0),
        
        .s00_axi_aclk(s_axi_aclk),
		.s00_axi_aresetn(s_axi_aresetn),
		.s00_axi_awid(s00_axi_awid),
		.s00_axi_awaddr(s00_axi_awaddr),
		.s00_axi_awlen(s00_axi_awlen),
		.s00_axi_awsize(s00_axi_awsize),
		.s00_axi_awburst(s00_axi_awburst),
		.s00_axi_awlock(s00_axi_awlock),
		.s00_axi_awcache(s00_axi_awcache),
		.s00_axi_awprot(s00_axi_awprot),
		.s00_axi_awqos(s00_axi_awqos),
		.s00_axi_awregion(s00_axi_awregion),
		.s00_axi_awuser(s00_axi_awuser),
		.s00_axi_awvalid(s00_axi_awvalid),
		.s00_axi_awready(s00_axi_awready),
		.s00_axi_wdata(s00_axi_wdata),
		.s00_axi_wstrb(s00_axi_wstrb),
		.s00_axi_wlast(s00_axi_wlast),
		.s00_axi_wuser(s00_axi_wuser),
		.s00_axi_wvalid(s00_axi_wvalid),
		.s00_axi_wready(s00_axi_wready),
		.s00_axi_bid(s00_axi_bid),
		.s00_axi_bresp(s00_axi_bresp),
		.s00_axi_buser(s00_axi_buser),
		.s00_axi_bvalid(s00_axi_bvalid),
		.s00_axi_bready(s00_axi_bready),
		.s00_axi_arid(s00_axi_arid),
		.s00_axi_araddr(s00_axi_araddr),
		.s00_axi_arlen(s00_axi_arlen),
		.s00_axi_arsize(s00_axi_arsize),
		.s00_axi_arburst(s00_axi_arburst),
		.s00_axi_arlock(s00_axi_arlock),
		.s00_axi_arcache(s00_axi_arcache),
		.s00_axi_arprot(s00_axi_arprot),
		.s00_axi_arqos(s00_axi_arqos),
		.s00_axi_arregion(s00_axi_arregion),
		.s00_axi_aruser(s00_axi_aruser),
		.s00_axi_arvalid(s00_axi_arvalid),
		.s00_axi_arready(s00_axi_arready),
		.s00_axi_rid(s00_axi_rid),
		.s00_axi_rdata(s00_axi_rdata),
		.s00_axi_rresp(s00_axi_rresp),
		.s00_axi_rlast(s00_axi_rlast),
		.s00_axi_ruser(s00_axi_ruser),
		.s00_axi_rvalid(s00_axi_rvalid),
		.s00_axi_rready(s00_axi_rready),

//		.m00_axi_lite_init_axi_txn(m00_axi_lite_init_axi_txn),
//		.m00_axi_lite_error(m00_axi_lite_error),
//		.m00_axi_lite_txn_done(m00_axi_lite_txn_done),
		.m00_axi_lite_aclk(m00_axi_lite_aclk),
		.m00_axi_lite_aresetn(m00_axi_lite_aresetn),
		.m00_axi_lite_awaddr(m00_axi_lite_awaddr),
		.m00_axi_lite_awprot(m00_axi_lite_awprot),
		.m00_axi_lite_awvalid(m00_axi_lite_awvalid),
		.m00_axi_lite_awready(m00_axi_lite_awready),
		.m00_axi_lite_wdata(m00_axi_lite_wdata),
		.m00_axi_lite_wstrb(m00_axi_lite_wstrb),
		.m00_axi_lite_wvalid(m00_axi_lite_wvalid),
		.m00_axi_lite_wready(m00_axi_lite_wready),
		.m00_axi_lite_bresp(m00_axi_lite_bresp),
		.m00_axi_lite_bvalid(m00_axi_lite_bvalid),
		.m00_axi_lite_bready(m00_axi_lite_bready),
		.m00_axi_lite_araddr(m00_axi_lite_araddr),
		.m00_axi_lite_arprot(m00_axi_lite_arprot),
		.m00_axi_lite_arvalid(m00_axi_lite_arvalid),
		.m00_axi_lite_arready(m00_axi_lite_arready),
		.m00_axi_lite_rdata(m00_axi_lite_rdata),
		.m00_axi_lite_rresp(m00_axi_lite_rresp),
		.m00_axi_lite_rvalid(m00_axi_lite_rvalid),
		.m00_axi_lite_rready(m00_axi_lite_rready)
    );
/*
    dma_channel # (
        .DMA_MM2S_ADDR_BASE(CH1_DMA_MM2S_ADDR_BASE),
        .DMA_S2MM_ADDR_BASE(CH1_DMA_S2MM_ADDR_BASE),
        .C_LENGTH_WIDTH(C_LENGTH_WIDTH),
		.C_M00_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
		.C_M00_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH),
		.C_S00_AXI_ID_WIDTH(C_S_AXI_ID_WIDTH),
		.C_S00_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S00_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
		.C_S00_AXI_AWUSER_WIDTH(C_S_AXI_AWUSER_WIDTH),
		.C_S00_AXI_ARUSER_WIDTH(C_S_AXI_ARUSER_WIDTH),
		.C_S00_AXI_WUSER_WIDTH(C_S_AXI_WUSER_WIDTH),
		.C_S00_AXI_RUSER_WIDTH(C_S_AXI_RUSER_WIDTH),
		.C_S00_AXI_BUSER_WIDTH(C_S_AXI_BUSER_WIDTH)
    )dma_channel_c1_inst (

        .irq_s2mm_in(irq_s2mm_in_1),
        .irq_mm2s_in(irq_mm2s_in_1),
        .irq_out(irq_out_1),
        .axis_tdest(axis_tdest_1),
        .axis_suppress(axis_suppress_1),

        .resetn_out(resetn_out_1),
        
        .s00_axi_aclk(s01_axi_aclk),
		.s00_axi_aresetn(s01_axi_aresetn),
		.s00_axi_awid(s01_axi_awid),
		.s00_axi_awaddr(s01_axi_awaddr),
		.s00_axi_awlen(s01_axi_awlen),
		.s00_axi_awsize(s01_axi_awsize),
		.s00_axi_awburst(s01_axi_awburst),
		.s00_axi_awlock(s01_axi_awlock),
		.s00_axi_awcache(s01_axi_awcache),
		.s00_axi_awprot(s01_axi_awprot),
		.s00_axi_awqos(s01_axi_awqos),
		.s00_axi_awregion(s01_axi_awregion),
		.s00_axi_awuser(s01_axi_awuser),
		.s00_axi_awvalid(s01_axi_awvalid),
		.s00_axi_awready(s01_axi_awready),
		.s00_axi_wdata(s01_axi_wdata),
		.s00_axi_wstrb(s01_axi_wstrb),
		.s00_axi_wlast(s01_axi_wlast),
		.s00_axi_wuser(s01_axi_wuser),
		.s00_axi_wvalid(s01_axi_wvalid),
		.s00_axi_wready(s01_axi_wready),
		.s00_axi_bid(s01_axi_bid),
		.s00_axi_bresp(s01_axi_bresp),
		.s00_axi_buser(s01_axi_buser),
		.s00_axi_bvalid(s01_axi_bvalid),
		.s00_axi_bready(s01_axi_bready),
		.s00_axi_arid(s01_axi_arid),
		.s00_axi_araddr(s01_axi_araddr),
		.s00_axi_arlen(s01_axi_arlen),
		.s00_axi_arsize(s01_axi_arsize),
		.s00_axi_arburst(s01_axi_arburst),
		.s00_axi_arlock(s01_axi_arlock),
		.s00_axi_arcache(s01_axi_arcache),
		.s00_axi_arprot(s01_axi_arprot),
		.s00_axi_arqos(s01_axi_arqos),
		.s00_axi_arregion(s01_axi_arregion),
		.s00_axi_aruser(s01_axi_aruser),
		.s00_axi_arvalid(s01_axi_arvalid),
		.s00_axi_arready(s01_axi_arready),
		.s00_axi_rid(s01_axi_rid),
		.s00_axi_rdata(s01_axi_rdata),
		.s00_axi_rresp(s01_axi_rresp),
		.s00_axi_rlast(s01_axi_rlast),
		.s00_axi_ruser(s01_axi_ruser),
		.s00_axi_rvalid(s01_axi_rvalid),
		.s00_axi_rready(s01_axi_rready),

//		.m00_axi_lite_init_axi_txn(m01_axi_lite_init_axi_txn),
//		.m00_axi_lite_error(m01_axi_lite_error),
//		.m00_axi_lite_txn_done(m01_axi_lite_txn_done),
		.m00_axi_lite_aclk(m01_axi_lite_aclk),
		.m00_axi_lite_aresetn(m01_axi_lite_aresetn),
		.m00_axi_lite_awaddr(m01_axi_lite_awaddr),
		.m00_axi_lite_awprot(m01_axi_lite_awprot),
		.m00_axi_lite_awvalid(m01_axi_lite_awvalid),
		.m00_axi_lite_awready(m01_axi_lite_awready),
		.m00_axi_lite_wdata(m01_axi_lite_wdata),
		.m00_axi_lite_wstrb(m01_axi_lite_wstrb),
		.m00_axi_lite_wvalid(m01_axi_lite_wvalid),
		.m00_axi_lite_wready(m01_axi_lite_wready),
		.m00_axi_lite_bresp(m01_axi_lite_bresp),
		.m00_axi_lite_bvalid(m01_axi_lite_bvalid),
		.m00_axi_lite_bready(m01_axi_lite_bready),
		.m00_axi_lite_araddr(m01_axi_lite_araddr),
		.m00_axi_lite_arprot(m01_axi_lite_arprot),
		.m00_axi_lite_arvalid(m01_axi_lite_arvalid),
		.m00_axi_lite_arready(m01_axi_lite_arready),
		.m00_axi_lite_rdata(m01_axi_lite_rdata),
		.m00_axi_lite_rresp(m01_axi_lite_rresp),
		.m00_axi_lite_rvalid(m01_axi_lite_rvalid),
		.m00_axi_lite_rready(m01_axi_lite_rready)
    );*/
//    //descpriptor fifo
//    (*mark_debug = "true"*)wire descfifo_wr_en;
//    (*mark_debug = "true"*)wire descfifo_full;
//    (*mark_debug = "true"*)wire [31:0] descfifo_din;
//    (*mark_debug = "true"*)wire descfifo_rd_en;
//    (*mark_debug = "true"*)wire descfifo_empty;
//    (*mark_debug = "true"*)wire descfifo_valid;
//    (*mark_debug = "true"*)wire [127:0] descfifo_dout;
    
//    reg [15:0] axis_channel_en;
    
//    always @ (*)
//    begin
//        case (axis_tdest)
//            0: axis_channel_en = 16'h1;
//            1: axis_channel_en = 16'h2;
//            2: axis_channel_en = 16'h4;
//            3: axis_channel_en = 16'h8;
//            4: axis_channel_en = 16'h10;
//            5: axis_channel_en = 16'h20;
//            6: axis_channel_en = 16'h40;
//            7: axis_channel_en = 16'h80;
//            8: axis_channel_en = 16'h100;
//            9: axis_channel_en = 16'h200;
//            10: axis_channel_en = 16'h400;
//            11: axis_channel_en = 16'h800;
//            12: axis_channel_en = 16'h1000;
//            13: axis_channel_en = 16'h2000;
//            14: axis_channel_en = 16'h4000;
//            15: axis_channel_en = 16'h8000;
//        endcase
//    end
    
//    assign axis_suppress = ~axis_channel_en;
    
//    // ip2bus signals 
//    //  IP Master Request/Qualifers
//    wire lite_ip2bus_mstrd_req;
//    wire lite_ip2bus_mstwr_req;
//    wire [C_M_AXI_ADDR_WIDTH-1 : 0] lite_ip2bus_mst_addr;
//    wire [(C_M_AXI_DATA_WIDTH/8)-1 : 0] lite_ip2bus_mst_be;
//    wire lite_ip2bus_mst_lock;
//    wire lite_ip2bus_mst_reset;
//    //  IP Request Status Reply
//    wire lite_bus2ip_mst_cmdack;
//    wire lite_bus2ip_mst_cmplt;
//    wire lite_bus2ip_mst_error;
//    wire lite_bus2ip_mst_rearbitrate;
//    wire lite_bus2ip_mst_cmd_timeout;
//    //  IPIC Read data
//    wire [C_M_AXI_DATA_WIDTH-1 : 0] lite_bus2ip_mstrd_d;
//    wire lite_bus2ip_mstrd_src_rdy_n;
//    //  IPIC Write data
//    wire [C_M_AXI_DATA_WIDTH-1 : 0] lite_ip2bus_mstwr_d;
//    wire lite_bus2ip_mstwr_dst_rdy_n;
    
//    fifo_descriptor fifo_descriptor_inst (
//      .clk(s00_axi_aclk),                // input wire clk
//      .srst(!s00_axi_aresetn),
//      .din(descfifo_din),                // input wire [31 : 0] din
//      .full(descfifo_full),
//      .wr_en(descfifo_wr_en),            // input wire wr_en
//      .rd_en(descfifo_rd_en),            // input wire rd_en
//      .dout(descfifo_dout),              // output wire [31 : 0] dout
//      .empty(descfifo_empty),
//      .valid(descfifo_valid)            // output wire valid
//      //.data_count(FIFORX_COUNT)
//      //.wr_data_count(input_fifo_a1_wrcount),
//      //.rd_data_count(input_fifo_a1_rdcount)
//    );
    
//    ipic_lite_state_machine # (
//        .DMA_ADDR_BASE(CH0_DMA_ADDR_BASE),
//        .ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
//        .DATA_WIDTH(C_M_AXI_DATA_WIDTH),
//        .C_LENGTH_WIDTH(C_LENGTH_WIDTH)
//    )ipic_lite_state_machine_inst(
//        .clk(s00_axi_aclk),
//        .reset_n(s00_axi_aresetn),
//        .irq_s2mm_in(irq_s2mm_in),
//        .irq_mm2s_in(irq_mm2s_in),
//        .resetn_out(resetn_out),
//        .axis_tdest(axis_tdest),
//        .descfifo_rd_en(descfifo_rd_en), 
//        .descfifo_dout(descfifo_dout),
//        .descfifo_empty(descfifo_empty),
//        .descfifo_valid(descfifo_valid),
//        //IPIC LITE interface
//        .ip2bus_mstrd_req(lite_ip2bus_mstrd_req),                                           //-- IPIC
//        .ip2bus_mstwr_req(lite_ip2bus_mstwr_req),                                           //-- IPIC
//        .ip2bus_mst_addr(lite_ip2bus_mst_addr),    //-- IPIC
//        .ip2bus_mst_be(lite_ip2bus_mst_be),//-- IPIC     
//        .ip2bus_mst_lock(lite_ip2bus_mst_lock),                                            //-- IPIC
//        .ip2bus_mst_reset(lite_ip2bus_mst_reset),                                           //-- IPIC
//        .bus2ip_mst_cmdack(lite_bus2ip_mst_cmdack),                                                //-- IPIC
//        .bus2ip_mst_cmplt(lite_bus2ip_mst_cmplt),                                                 //-- IPIC
//        .bus2ip_mst_error(lite_bus2ip_mst_error),                                                 //-- IPIC
//        .bus2ip_mst_rearbitrate(lite_bus2ip_mst_rearbitrate),                                           //-- IPIC
//        .bus2ip_mst_cmd_timeout(lite_bus2ip_mst_cmd_timeout),                                           //-- IPIC
//        .bus2ip_mstrd_d(lite_bus2ip_mstrd_d),                                                   //-- IPIC
//        .bus2ip_mstrd_src_rdy_n(lite_bus2ip_mstrd_src_rdy_n),                                           //-- IPIC
//        .ip2bus_mstwr_d(lite_ip2bus_mstwr_d), //input                                                  //-- IPIC
//        .bus2ip_mstwr_dst_rdy_n(lite_bus2ip_mstwr_dst_rdy_n) //output                                          //-- IPIC  

//    );
    
//// Instantiation of Axi Bus Interface S00_AXI
////	axidma_middleware_v1_0_S00_AXI # ( 
////		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
////		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
////	) axidma_middleware_v1_0_S00_AXI_inst (
////		.S_AXI_ACLK(s00_axi_aclk),
////		.S_AXI_ARESETN(s00_axi_aresetn),
////		.S_AXI_AWADDR(s00_axi_awaddr),
////		.S_AXI_AWPROT(s00_axi_awprot),
////		.S_AXI_AWVALID(s00_axi_awvalid),
////		.S_AXI_AWREADY(s00_axi_awready),
////		.S_AXI_WDATA(s00_axi_wdata),
////		.S_AXI_WSTRB(s00_axi_wstrb),
////		.S_AXI_WVALID(s00_axi_wvalid),
////		.S_AXI_WREADY(s00_axi_wready),
////		.S_AXI_BRESP(s00_axi_bresp),
////		.S_AXI_BVALID(s00_axi_bvalid),
////		.S_AXI_BREADY(s00_axi_bready),
////		.S_AXI_ARADDR(s00_axi_araddr),
////		.S_AXI_ARPROT(s00_axi_arprot),
////		.S_AXI_ARVALID(s00_axi_arvalid),
////		.S_AXI_ARREADY(s00_axi_arready),
////		.S_AXI_RDATA(s00_axi_rdata),
////		.S_AXI_RRESP(s00_axi_rresp),
////		.S_AXI_RVALID(s00_axi_rvalid),
////		.S_AXI_RREADY(s00_axi_rready)
////	);

//// Instantiation of Axi Bus Interface S01_AXI
//	axidma_middleware_S_AXI_FULL # ( 
//		.C_S_AXI_ID_WIDTH(C_S_AXI_ID_WIDTH),
//		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
//		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
//		.C_S_AXI_AWUSER_WIDTH(C_S_AXI_AWUSER_WIDTH),
//		.C_S_AXI_ARUSER_WIDTH(C_S_AXI_ARUSER_WIDTH),
//		.C_S_AXI_WUSER_WIDTH(C_S_AXI_WUSER_WIDTH),
//		.C_S_AXI_RUSER_WIDTH(C_S_AXI_RUSER_WIDTH),
//		.C_S_AXI_BUSER_WIDTH(C_S_AXI_BUSER_WIDTH)
//	) axidma_middleware_S_AXI_FULL_inst (
//	    .descfifo_din(descfifo_din), 
//        .descfifo_full(descfifo_full),
//        .descfifo_wr_en(descfifo_wr_en),
        
//		.S_AXI_ACLK(s00_axi_aclk),
//		.S_AXI_ARESETN(s00_axi_aresetn),
//		.S_AXI_AWID(s00_axi_awid),
//		.S_AXI_AWADDR(s00_axi_awaddr),
//		.S_AXI_AWLEN(s00_axi_awlen),
//		.S_AXI_AWSIZE(s00_axi_awsize),
//		.S_AXI_AWBURST(s00_axi_awburst),
//		.S_AXI_AWLOCK(s00_axi_awlock),
//		.S_AXI_AWCACHE(s00_axi_awcache),
//		.S_AXI_AWPROT(s00_axi_awprot),
//		.S_AXI_AWQOS(s00_axi_awqos),
//		.S_AXI_AWREGION(s00_axi_awregion),
//		.S_AXI_AWUSER(s00_axi_awuser),
//		.S_AXI_AWVALID(s00_axi_awvalid),
//		.S_AXI_AWREADY(s00_axi_awready),
//		.S_AXI_WDATA(s00_axi_wdata),
//		.S_AXI_WSTRB(s00_axi_wstrb),
//		.S_AXI_WLAST(s00_axi_wlast),
//		.S_AXI_WUSER(s00_axi_wuser),
//		.S_AXI_WVALID(s00_axi_wvalid),
//		.S_AXI_WREADY(s00_axi_wready),
//		.S_AXI_BID(s00_axi_bid),
//		.S_AXI_BRESP(s00_axi_bresp),
//		.S_AXI_BUSER(s00_axi_buser),
//		.S_AXI_BVALID(s00_axi_bvalid),
//		.S_AXI_BREADY(s00_axi_bready),
//		.S_AXI_ARID(s00_axi_arid),
//		.S_AXI_ARADDR(s00_axi_araddr),
//		.S_AXI_ARLEN(s00_axi_arlen),
//		.S_AXI_ARSIZE(s00_axi_arsize),
//		.S_AXI_ARBURST(s00_axi_arburst),
//		.S_AXI_ARLOCK(s00_axi_arlock),
//		.S_AXI_ARCACHE(s00_axi_arcache),
//		.S_AXI_ARPROT(s00_axi_arprot),
//		.S_AXI_ARQOS(s00_axi_arqos),
//		.S_AXI_ARREGION(s00_axi_arregion),
//		.S_AXI_ARUSER(s00_axi_aruser),
//		.S_AXI_ARVALID(s00_axi_arvalid),
//		.S_AXI_ARREADY(s00_axi_arready),
//		.S_AXI_RID(s00_axi_rid),
//		.S_AXI_RDATA(s00_axi_rdata),
//		.S_AXI_RRESP(s00_axi_rresp),
//		.S_AXI_RLAST(s00_axi_rlast),
//		.S_AXI_RUSER(s00_axi_ruser),
//		.S_AXI_RVALID(s00_axi_rvalid),
//		.S_AXI_RREADY(s00_axi_rready)
//	);
	
//// Instantiation of Axi Bus Interface axi_master_lite
//	axi_master_lite # (      
//        // AXI4-Lite Parameters 
        
//        .C_M_AXI_LITE_ADDR_WIDTH (C_M_AXI_ADDR_WIDTH),  
//        // width of AXI4 Address Bus (in bits)
                 
//        .C_M_AXI_LITE_DATA_WIDTH (C_M_AXI_DATA_WIDTH),  
//          //  Width of the AXI4 Data Bus (in bits)
                 
//        // FPGA Family Parameter      
//        .C_FAMILY ("virtex7")
//          // Select the target architecture type
//          // see the family.vhd package in the proc_common
//          // library
//    ) axi_master_lite_inst (
        
//        //-----------------------------------------------------------------------
//        // Clock Input
//        //-----------------------------------------------------------------------
//        .m_axi_lite_aclk(m00_axi_lite_aclk),    //-- AXI4  
//        //-----------------------------------------------------------------------
//        ////-- Reset Input (active low) 
//        //-----------------------------------------------------------------------
//        .m_axi_lite_aresetn(m00_axi_lite_aresetn), //-- AXI4   
//        //-----------------------------------------------------------------------
//        ////-- Master Detected Error output 
//        //-----------------------------------------------------------------------
//        .md_error(m00_axi_lite_error),                           //-- Discrete Out

//        //----------------------------------------------------------------------------
//        ////-- AXI4 Read Channels
//        //----------------------------------------------------------------------------
//        ////--  AXI4 Read Address Channel                                          //-- AXI4
//        .m_axi_lite_arready(m00_axi_lite_arready),  //-- AXI4
//        .m_axi_lite_arvalid(m00_axi_lite_arvalid),//-- AXI4
//        .m_axi_lite_araddr(m00_axi_lite_araddr), //-- AXI4
//        .m_axi_lite_arprot(m00_axi_lite_arprot), //-- AXI4
//                                                                               //-- AXI4
//        ////--  AXI4 Read Data Channel                                             //-- AXI4
//        .m_axi_lite_rready(m00_axi_lite_rready), //-- AXI4
//        .m_axi_lite_rvalid(m00_axi_lite_rvalid),   //-- AXI4
//        .m_axi_lite_rdata(m00_axi_lite_rdata), //-- AXI4
//        .m_axi_lite_rresp(m00_axi_lite_rresp), //-- AXI4

//        //-----------------------------------------------------------------------------
//        ////-- AXI4 Write Channels
//        //-----------------------------------------------------------------------------
//        ////-- AXI4 Write Address Channel
//        .m_axi_lite_awready(m00_axi_lite_awready),     //-- AXI4
//        .m_axi_lite_awvalid(m00_axi_lite_awvalid),   //-- AXI4
//        .m_axi_lite_awaddr(m00_axi_lite_awaddr),//-- AXI4
//        .m_axi_lite_awprot(m00_axi_lite_awprot),   //-- AXI4
//                                                                                  //-- AXI4
//        ////-- AXI4 Write Data Channel                                                //-- AXI4
//        .m_axi_lite_wready(m00_axi_lite_wready),      //-- AXI4
//        .m_axi_lite_wvalid(m00_axi_lite_wvalid),    //-- AXI4
//        .m_axi_lite_wdata(m00_axi_lite_wdata),    //-- AXI4
//        .m_axi_lite_wstrb(m00_axi_lite_wstrb),//-- AXI4
//                                                                                  //-- AXI4
//        ////-- AXI4 Write Response Channel                                            //-- AXI4
//        .m_axi_lite_bready(m00_axi_lite_bready),    //-- AXI4
//        .m_axi_lite_bvalid(m00_axi_lite_bvalid),      //-- AXI4
//        .m_axi_lite_bresp(m00_axi_lite_bresp),    //-- AXI4
    
//        //-----------------------------------------------------------------------------
//        ////-- IP Master Request/Qualifers (ALL INPUT)
//        //-----------------------------------------------------------------------------
//        .ip2bus_mstrd_req(lite_ip2bus_mstrd_req),                                           //-- IPIC
//        .ip2bus_mstwr_req(lite_ip2bus_mstwr_req),                                           //-- IPIC
//        .ip2bus_mst_addr(lite_ip2bus_mst_addr),    //-- IPIC
//        .ip2bus_mst_be(lite_ip2bus_mst_be),//-- IPIC     
//        .ip2bus_mst_lock(lite_ip2bus_mst_lock),                                            //-- IPIC
//        .ip2bus_mst_reset(lite_ip2bus_mst_reset),                                           //-- IPIC
//                                                                                              //-- IPIC
//        //-----------------------------------------------------------------------------
//        //-- IP Request Status Reply  (ALL OUTPUT)                                                          
//        //-----------------------------------------------------------------------------
//        .bus2ip_mst_cmdack(lite_bus2ip_mst_cmdack),                                                //-- IPIC
//        .bus2ip_mst_cmplt(lite_bus2ip_mst_cmplt),                                                 //-- IPIC
//        .bus2ip_mst_error(lite_bus2ip_mst_error),                                                 //-- IPIC
//        .bus2ip_mst_rearbitrate(lite_bus2ip_mst_rearbitrate),                                           //-- IPIC
//        .bus2ip_mst_cmd_timeout(lite_bus2ip_mst_cmd_timeout),                                           //-- IPIC
//                                                                                //-- IPIC
//        //-----------------------------------------------------------------------------
//        //-- IPIC Read data  (ALL OUTPUT)                                                                   
//        //-----------------------------------------------------------------------------
//        .bus2ip_mstrd_d(lite_bus2ip_mstrd_d),                                                   //-- IPIC
//        .bus2ip_mstrd_src_rdy_n(lite_bus2ip_mstrd_src_rdy_n),                                           //-- IPIC
//                                                                                              //-- IPIC
//        //-----------------------------------------------------------------------------
//        //-- IPIC Write data                                                                    
//        //-----------------------------------------------------------------------------
//        .ip2bus_mstwr_d(lite_ip2bus_mstwr_d), //input                                                  //-- IPIC
//        .bus2ip_mstwr_dst_rdy_n(lite_bus2ip_mstwr_dst_rdy_n) //output                                          //-- IPIC                                           
//    );
//	// Add user logic here


		
	// User logic ends
	axidma_middleware_S_AXI_CONFIG # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) axidma_middleware_S_AXI_CONFIG (
		.S_AXI_ACLK(s_axi_aclk),
		.S_AXI_ARESETN(s_axi_aresetn),
		.S_AXI_AWADDR(sctrl_axi_awaddr),
		.S_AXI_AWPROT(sctrl_axi_awprot),
		.S_AXI_AWVALID(sctrl_axi_awvalid),
		.S_AXI_AWREADY(sctrl_axi_awready),
		.S_AXI_WDATA(sctrl_axi_wdata),
		.S_AXI_WSTRB(sctrl_axi_wstrb),
		.S_AXI_WVALID(sctrl_axi_wvalid),
		.S_AXI_WREADY(sctrl_axi_wready),
		.S_AXI_BRESP(sctrl_axi_bresp),
		.S_AXI_BVALID(sctrl_axi_bvalid),
		.S_AXI_BREADY(sctrl_axi_bready),
		.S_AXI_ARADDR(sctrl_axi_araddr),
		.S_AXI_ARPROT(sctrl_axi_arprot),
		.S_AXI_ARVALID(sctrl_axi_arvalid),
		.S_AXI_ARREADY(sctrl_axi_arready),
		.S_AXI_RDATA(sctrl_axi_rdata),
		.S_AXI_RRESP(sctrl_axi_rresp),
		.S_AXI_RVALID(sctrl_axi_rvalid),
		.S_AXI_RREADY(sctrl_axi_rready)
        
		//.user_reset_reg(user_reset)
	);
	endmodule
