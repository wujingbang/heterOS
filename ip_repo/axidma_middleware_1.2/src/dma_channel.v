	module dma_channel #
	(
		// Users to add parameters here
        parameter integer DMA_MM2S_ADDR_BASE = 32'h41E00000,
        parameter integer DMA_S2MM_ADDR_BASE = 32'h40400000,
		// User parameters ends
		// Do not modify the parameters beyond this line

        parameter integer C_LENGTH_WIDTH = 12,
		// Parameters of Axi Slave Bus Interface S00_AXI

		// Parameters of Axi Master Bus Interface M00_AXI
		parameter  C_M00_AXI_START_DATA_VALUE	= 32'hAA000000,
		parameter  C_M00_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M00_AXI_DATA_WIDTH	= 32,
		parameter integer C_M00_AXI_TRANSACTIONS_NUM	= 4,
		
        // Parameters of Axi Slave Bus Interface S_AXI_FULL
		parameter integer C_S00_AXI_ID_WIDTH	= 1,
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6,
		parameter integer C_S00_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_WUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_RUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

        input wire irq_s2mm_in,
        input wire irq_mm2s_in,
        output reg irq_out,
        output wire [3:0] axis_tdest,
        output wire [15:0] axis_suppress,

        output wire dma_resetn_out,
        
		// Ports of Axi Slave Bus Interface S00_AXI
        input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ID_WIDTH-1 : 0] s00_axi_awid,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [7 : 0] s00_axi_awlen,
		input wire [2 : 0] s00_axi_awsize,
		input wire [1 : 0] s00_axi_awburst,
		input wire  s00_axi_awlock,
		input wire [3 : 0] s00_axi_awcache,
		input wire [2 : 0] s00_axi_awprot,
		input wire [3 : 0] s00_axi_awqos,
		input wire [3 : 0] s00_axi_awregion,
		input wire [C_S00_AXI_AWUSER_WIDTH-1 : 0] s00_axi_awuser,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wlast,
		input wire [C_S00_AXI_WUSER_WIDTH-1 : 0] s00_axi_wuser,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [C_S00_AXI_ID_WIDTH-1 : 0] s00_axi_bid,
		output wire [1 : 0] s00_axi_bresp,
		output wire [C_S00_AXI_BUSER_WIDTH-1 : 0] s00_axi_buser,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ID_WIDTH-1 : 0] s00_axi_arid,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [7 : 0] s00_axi_arlen,
		input wire [2 : 0] s00_axi_arsize,
		input wire [1 : 0] s00_axi_arburst,
		input wire  s00_axi_arlock,
		input wire [3 : 0] s00_axi_arcache,
		input wire [2 : 0] s00_axi_arprot,
		input wire [3 : 0] s00_axi_arqos,
		input wire [3 : 0] s00_axi_arregion,
		input wire [C_S00_AXI_ARUSER_WIDTH-1 : 0] s00_axi_aruser,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_ID_WIDTH-1 : 0] s00_axi_rid,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rlast,
		output wire [C_S00_AXI_RUSER_WIDTH-1 : 0] s00_axi_ruser,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXI
		input wire  m00_axi_lite_init_axi_txn,
		output wire  m00_axi_lite_error,
		output wire  m00_axi_lite_txn_done,
		input wire  m00_axi_lite_aclk,
		input wire  m00_axi_lite_aresetn,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_lite_awaddr,
		output wire [2 : 0] m00_axi_lite_awprot,
		output wire  m00_axi_lite_awvalid,
		input wire  m00_axi_lite_awready,
		output wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_lite_wdata,
		output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_lite_wstrb,
		output wire  m00_axi_lite_wvalid,
		input wire  m00_axi_lite_wready,
		input wire [1 : 0] m00_axi_lite_bresp,
		input wire  m00_axi_lite_bvalid,
		output wire  m00_axi_lite_bready,
		(*mark_debug = "true"*)output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_lite_araddr,
		output wire [2 : 0] m00_axi_lite_arprot,
		output wire  m00_axi_lite_arvalid,
		input wire  m00_axi_lite_arready,
		(*mark_debug = "true"*)input wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_lite_rdata,
		input wire [1 : 0] m00_axi_lite_rresp,
		input wire  m00_axi_lite_rvalid,
		output wire  m00_axi_lite_rready
		
	);
	
    //descpriptor fifo
    wire descfifo_wr_en;
    wire descfifo_full;
    wire [31:0] descfifo_din;
    wire descfifo_rd_en;
    wire descfifo_empty;
    wire descfifo_valid;
    wire [127:0] descfifo_dout;
    
    reg [15:0] axis_channel_en;
    
    always @ (*)
    begin
        case (axis_tdest)
            0: axis_channel_en = 16'h1;
            1: axis_channel_en = 16'h2;
            2: axis_channel_en = 16'h4;
            3: axis_channel_en = 16'h8;
            4: axis_channel_en = 16'h10;
            5: axis_channel_en = 16'h20;
            6: axis_channel_en = 16'h40;
            7: axis_channel_en = 16'h80;
            8: axis_channel_en = 16'h100;
            9: axis_channel_en = 16'h200;
            10: axis_channel_en = 16'h400;
            11: axis_channel_en = 16'h800;
            12: axis_channel_en = 16'h1000;
            13: axis_channel_en = 16'h2000;
            14: axis_channel_en = 16'h4000;
            15: axis_channel_en = 16'h8000;
        endcase
    end
    
    assign axis_suppress = ~axis_channel_en;
    
    // ip2bus signals 
    //  IP Master Request/Qualifers
    (*mark_debug = "true"*)wire lite_ip2bus_mstrd_req;
    wire lite_ip2bus_mstwr_req;
    (*mark_debug = "true"*)wire [C_M00_AXI_ADDR_WIDTH-1 : 0] lite_ip2bus_mst_addr;
    wire [(C_M00_AXI_DATA_WIDTH/8)-1 : 0] lite_ip2bus_mst_be;
    wire lite_ip2bus_mst_lock;
    wire lite_ip2bus_mst_reset;
    //  IP Request Status Reply
    (*mark_debug = "true"*)wire lite_bus2ip_mst_cmdack;
    (*mark_debug = "true"*)wire lite_bus2ip_mst_cmplt;
    (*mark_debug = "true"*)wire lite_bus2ip_mst_error;
    wire lite_bus2ip_mst_rearbitrate;
    wire lite_bus2ip_mst_cmd_timeout;
    //  IPIC Read data
    wire [C_M00_AXI_DATA_WIDTH-1 : 0] lite_bus2ip_mstrd_d;
    wire lite_bus2ip_mstrd_src_rdy_n;
    //  IPIC Write data
    wire [C_M00_AXI_DATA_WIDTH-1 : 0] lite_ip2bus_mstwr_d;
    wire lite_bus2ip_mstwr_dst_rdy_n;
    
    fifo_descriptor fifo_descriptor_inst (
      .clk(s00_axi_aclk),                // input wire clk
      .srst(!s00_axi_aresetn),
      .din(descfifo_din),                // input wire [31 : 0] din
      .full(descfifo_full),
      .wr_en(descfifo_wr_en),            // input wire wr_en
      .rd_en(descfifo_rd_en),            // input wire rd_en
      .dout(descfifo_dout),              // output wire [31 : 0] dout
      .empty(descfifo_empty),
      .valid(descfifo_valid)            // output wire valid
      //.data_count(FIFORX_COUNT)
      //.wr_data_count(input_fifo_a1_wrcount),
      //.rd_data_count(input_fifo_a1_rdcount)
    );
    
    ipic_lite_state_machine # (
        .DMA_MM2S_ADDR_BASE(DMA_MM2S_ADDR_BASE),
        .DMA_S2MM_ADDR_BASE(DMA_S2MM_ADDR_BASE),
        .ADDR_WIDTH(C_M00_AXI_ADDR_WIDTH),
        .DATA_WIDTH(C_M00_AXI_DATA_WIDTH),
        .C_LENGTH_WIDTH(C_LENGTH_WIDTH)
    )ipic_lite_state_machine_inst(
        .clk(s00_axi_aclk),
        .reset_n(s00_axi_aresetn),
        .irq_s2mm_in(irq_s2mm_in),
        .irq_mm2s_in(irq_mm2s_in),
        .resetn_out(resetn_out),
        .axis_tdest(axis_tdest),
        .descfifo_rd_en(descfifo_rd_en), 
        .descfifo_dout(descfifo_dout),
        .descfifo_empty(descfifo_empty),
        .descfifo_valid(descfifo_valid),
        //IPIC LITE interface
        .ip2bus_mstrd_req(lite_ip2bus_mstrd_req),                                           //-- IPIC
        .ip2bus_mstwr_req(lite_ip2bus_mstwr_req),                                           //-- IPIC
        .ip2bus_mst_addr(lite_ip2bus_mst_addr),    //-- IPIC
        .ip2bus_mst_be(lite_ip2bus_mst_be),//-- IPIC     
        .ip2bus_mst_lock(lite_ip2bus_mst_lock),                                            //-- IPIC
        .ip2bus_mst_reset(lite_ip2bus_mst_reset),                                           //-- IPIC
        .bus2ip_mst_cmdack(lite_bus2ip_mst_cmdack),                                                //-- IPIC
        .bus2ip_mst_cmplt(lite_bus2ip_mst_cmplt),                                                 //-- IPIC
        .bus2ip_mst_error(lite_bus2ip_mst_error),                                                 //-- IPIC
        .bus2ip_mst_rearbitrate(lite_bus2ip_mst_rearbitrate),                                           //-- IPIC
        .bus2ip_mst_cmd_timeout(lite_bus2ip_mst_cmd_timeout),                                           //-- IPIC
        .bus2ip_mstrd_d(lite_bus2ip_mstrd_d),                                                   //-- IPIC
        .bus2ip_mstrd_src_rdy_n(lite_bus2ip_mstrd_src_rdy_n),                                           //-- IPIC
        .ip2bus_mstwr_d(lite_ip2bus_mstwr_d), //input                                                  //-- IPIC
        .bus2ip_mstwr_dst_rdy_n(lite_bus2ip_mstwr_dst_rdy_n) //output                                          //-- IPIC  

    );
    

// Instantiation of Axi Bus Interface S01_AXI
	axidma_middleware_S_AXI_FULL # ( 
		.C_S_AXI_ID_WIDTH(C_S00_AXI_ID_WIDTH),
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH),
		.C_S_AXI_AWUSER_WIDTH(C_S00_AXI_AWUSER_WIDTH),
		.C_S_AXI_ARUSER_WIDTH(C_S00_AXI_ARUSER_WIDTH),
		.C_S_AXI_WUSER_WIDTH(C_S00_AXI_WUSER_WIDTH),
		.C_S_AXI_RUSER_WIDTH(C_S00_AXI_RUSER_WIDTH),
		.C_S_AXI_BUSER_WIDTH(C_S00_AXI_BUSER_WIDTH)
	) axidma_middleware_S_AXI_FULL_inst (
	    .descfifo_din(descfifo_din), 
        .descfifo_full(descfifo_full),
        .descfifo_wr_en(descfifo_wr_en),
        
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWID(s00_axi_awid),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWLEN(s00_axi_awlen),
		.S_AXI_AWSIZE(s00_axi_awsize),
		.S_AXI_AWBURST(s00_axi_awburst),
		.S_AXI_AWLOCK(s00_axi_awlock),
		.S_AXI_AWCACHE(s00_axi_awcache),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWQOS(s00_axi_awqos),
		.S_AXI_AWREGION(s00_axi_awregion),
		.S_AXI_AWUSER(s00_axi_awuser),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WLAST(s00_axi_wlast),
		.S_AXI_WUSER(s00_axi_wuser),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BID(s00_axi_bid),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BUSER(s00_axi_buser),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARID(s00_axi_arid),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARLEN(s00_axi_arlen),
		.S_AXI_ARSIZE(s00_axi_arsize),
		.S_AXI_ARBURST(s00_axi_arburst),
		.S_AXI_ARLOCK(s00_axi_arlock),
		.S_AXI_ARCACHE(s00_axi_arcache),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARQOS(s00_axi_arqos),
		.S_AXI_ARREGION(s00_axi_arregion),
		.S_AXI_ARUSER(s00_axi_aruser),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RID(s00_axi_rid),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RLAST(s00_axi_rlast),
		.S_AXI_RUSER(s00_axi_ruser),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);
	
// Instantiation of Axi Bus Interface axi_master_lite
	axi_master_lite # (      
        // AXI4-Lite Parameters 
        
        .C_M_AXI_LITE_ADDR_WIDTH (C_M00_AXI_ADDR_WIDTH),  
        // width of AXI4 Address Bus (in bits)
                 
        .C_M_AXI_LITE_DATA_WIDTH (C_M00_AXI_DATA_WIDTH),  
          //  Width of the AXI4 Data Bus (in bits)
                 
        // FPGA Family Parameter      
        .C_FAMILY ("virtex7")
          // Select the target architecture type
          // see the family.vhd package in the proc_common
          // library
    ) axi_master_lite_inst (
        
        //-----------------------------------------------------------------------
        // Clock Input
        //-----------------------------------------------------------------------
        .m_axi_lite_aclk(m00_axi_lite_aclk),    //-- AXI4  
        //-----------------------------------------------------------------------
        ////-- Reset Input (active low) 
        //-----------------------------------------------------------------------
        .m_axi_lite_aresetn(m00_axi_lite_aresetn), //-- AXI4   
        //-----------------------------------------------------------------------
        ////-- Master Detected Error output 
        //-----------------------------------------------------------------------
        .md_error(m00_axi_lite_error),                           //-- Discrete Out

        //----------------------------------------------------------------------------
        ////-- AXI4 Read Channels
        //----------------------------------------------------------------------------
        ////--  AXI4 Read Address Channel                                          //-- AXI4
        .m_axi_lite_arready(m00_axi_lite_arready),  //-- AXI4
        .m_axi_lite_arvalid(m00_axi_lite_arvalid),//-- AXI4
        .m_axi_lite_araddr(m00_axi_lite_araddr), //-- AXI4
        .m_axi_lite_arprot(m00_axi_lite_arprot), //-- AXI4
                                                                               //-- AXI4
        ////--  AXI4 Read Data Channel                                             //-- AXI4
        .m_axi_lite_rready(m00_axi_lite_rready), //-- AXI4
        .m_axi_lite_rvalid(m00_axi_lite_rvalid),   //-- AXI4
        .m_axi_lite_rdata(m00_axi_lite_rdata), //-- AXI4
        .m_axi_lite_rresp(m00_axi_lite_rresp), //-- AXI4

        //-----------------------------------------------------------------------------
        ////-- AXI4 Write Channels
        //-----------------------------------------------------------------------------
        ////-- AXI4 Write Address Channel
        .m_axi_lite_awready(m00_axi_lite_awready),     //-- AXI4
        .m_axi_lite_awvalid(m00_axi_lite_awvalid),   //-- AXI4
        .m_axi_lite_awaddr(m00_axi_lite_awaddr),//-- AXI4
        .m_axi_lite_awprot(m00_axi_lite_awprot),   //-- AXI4
                                                                                  //-- AXI4
        ////-- AXI4 Write Data Channel                                                //-- AXI4
        .m_axi_lite_wready(m00_axi_lite_wready),      //-- AXI4
        .m_axi_lite_wvalid(m00_axi_lite_wvalid),    //-- AXI4
        .m_axi_lite_wdata(m00_axi_lite_wdata),    //-- AXI4
        .m_axi_lite_wstrb(m00_axi_lite_wstrb),//-- AXI4
                                                                                  //-- AXI4
        ////-- AXI4 Write Response Channel                                            //-- AXI4
        .m_axi_lite_bready(m00_axi_lite_bready),    //-- AXI4
        .m_axi_lite_bvalid(m00_axi_lite_bvalid),      //-- AXI4
        .m_axi_lite_bresp(m00_axi_lite_bresp),    //-- AXI4
    
        //-----------------------------------------------------------------------------
        ////-- IP Master Request/Qualifers (ALL INPUT)
        //-----------------------------------------------------------------------------
        .ip2bus_mstrd_req(lite_ip2bus_mstrd_req),                                           //-- IPIC
        .ip2bus_mstwr_req(lite_ip2bus_mstwr_req),                                           //-- IPIC
        .ip2bus_mst_addr(lite_ip2bus_mst_addr),    //-- IPIC
        .ip2bus_mst_be(lite_ip2bus_mst_be),//-- IPIC     
        .ip2bus_mst_lock(lite_ip2bus_mst_lock),                                            //-- IPIC
        .ip2bus_mst_reset(lite_ip2bus_mst_reset),                                           //-- IPIC
                                                                                              //-- IPIC
        //-----------------------------------------------------------------------------
        //-- IP Request Status Reply  (ALL OUTPUT)                                                          
        //-----------------------------------------------------------------------------
        .bus2ip_mst_cmdack(lite_bus2ip_mst_cmdack),                                                //-- IPIC
        .bus2ip_mst_cmplt(lite_bus2ip_mst_cmplt),                                                 //-- IPIC
        .bus2ip_mst_error(lite_bus2ip_mst_error),                                                 //-- IPIC
        .bus2ip_mst_rearbitrate(lite_bus2ip_mst_rearbitrate),                                           //-- IPIC
        .bus2ip_mst_cmd_timeout(lite_bus2ip_mst_cmd_timeout),                                           //-- IPIC
                                                                                //-- IPIC
        //-----------------------------------------------------------------------------
        //-- IPIC Read data  (ALL OUTPUT)                                                                   
        //-----------------------------------------------------------------------------
        .bus2ip_mstrd_d(lite_bus2ip_mstrd_d),                                                   //-- IPIC
        .bus2ip_mstrd_src_rdy_n(lite_bus2ip_mstrd_src_rdy_n),                                           //-- IPIC
                                                                                              //-- IPIC
        //-----------------------------------------------------------------------------
        //-- IPIC Write data                                                                    
        //-----------------------------------------------------------------------------
        .ip2bus_mstwr_d(lite_ip2bus_mstwr_d), //input                                                  //-- IPIC
        .bus2ip_mstwr_dst_rdy_n(lite_bus2ip_mstwr_dst_rdy_n) //output                                          //-- IPIC                                           
    );
	// Add user logic here

	// User logic ends

	endmodule