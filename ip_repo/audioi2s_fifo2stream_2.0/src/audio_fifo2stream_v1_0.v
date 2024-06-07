
`timescale 1 ns / 1 ps

	module audio_fifo2stream_v1_0 #
	(
		// Users to add parameters here
        parameter integer DIRECT_CONNECT = 0,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI_CONFIG
		parameter integer C_S_AXI_CONFIG_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_CONFIG_ADDR_WIDTH	= 5,

		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer AXIS_TDATA_WIDTH	= 64,
		
		parameter integer TRANSFER_SIZE	= 1024,
		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_START_COUNT	= 64
	)
	(
		// Users to add ports here
        input wire clk_100mhz,
        input wire aresetn,
        output wire BCLK,
        output wire LRCLK,
        input wire SDATA_I,
        output wire SDATA_O,
        
        output wire BCLK_CPY,
        output wire LRCLK_CPY,
		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface S_AXI_CONFIG
		input wire  s_axi_config_aclk,
		input wire  s_axi_config_aresetn,
		input wire [C_S_AXI_CONFIG_ADDR_WIDTH-1 : 0] s_axi_config_awaddr,
		input wire [2 : 0] s_axi_config_awprot,
		input wire  s_axi_config_awvalid,
		output wire  s_axi_config_awready,
		input wire [C_S_AXI_CONFIG_DATA_WIDTH-1 : 0] s_axi_config_wdata,
		input wire [(C_S_AXI_CONFIG_DATA_WIDTH/8)-1 : 0] s_axi_config_wstrb,
		input wire  s_axi_config_wvalid,
		output wire  s_axi_config_wready,
		output wire [1 : 0] s_axi_config_bresp,
		output wire  s_axi_config_bvalid,
		input wire  s_axi_config_bready,
		input wire [C_S_AXI_CONFIG_ADDR_WIDTH-1 : 0] s_axi_config_araddr,
		input wire [2 : 0] s_axi_config_arprot,
		input wire  s_axi_config_arvalid,
		output wire  s_axi_config_arready,
		output wire [C_S_AXI_CONFIG_DATA_WIDTH-1 : 0] s_axi_config_rdata,
		output wire [1 : 0] s_axi_config_rresp,
		output wire  s_axi_config_rvalid,
		input wire  s_axi_config_rready,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		//input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		//output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	
	assign BCLK_CPY = BCLK;
	assign LRCLK_CPY = LRCLK;
	
	//(*mark_debug = "true"*)
	wire [47:0] fiforx_data;
	wire fiforx_valid;
	wire fiforx_rden;
	wire fiforx_full;
	wire fiforx_empty;
	
    wire [13:0] FIFORX_COUNT;
    wire FIFORX_OVERFLOW;
    wire FIFORX_UNDERFLOW;
    
    wire [47:0] fifotx_data;
	wire fifotx_wren;
    wire [13:0] FIFOTX_COUNT;
    wire FIFOTX_OVERFLOW;
    wire FIFOTX_UNDERFLOW;
    wire fifotx_full;
	wire fifotx_empty;
	
	wire rxfifo_en;
	wire txfifo_en;
	
    i2s_fifo # (
        .DIRECT_CONNECT(DIRECT_CONNECT)
    ) i2s_fifo_inst(
        .clk_100mhz(clk_100mhz),
        .aresetn(aresetn),
        
        .rxfifo_en(rxfifo_en),
	    .txfifo_en(txfifo_en),
	    
        .FIFORX_DATA(fiforx_data),
        .FIFORX_COUNT(FIFORX_COUNT),
        .FIFORX_VALID(fiforx_valid),
        .FIFORX_OVERFLOW(FIFORX_OVERFLOW),
        .FIFORX_UNDERFLOW(FIFORX_UNDERFLOW),
        .FIFORX_RD_EN(fiforx_rden),
        .FIFORX_FULL(fiforx_full),
        .FIFORX_EMPTY(fiforx_empty),
        
        .FIFOTX_DATA(fifotx_data),
        .FIFOTX_COUNT(FIFOTX_COUNT),
        .FIFOTX_WR_EN(fifotx_wren),
        .FIFOTX_OVERFLOW(FIFOTX_OVERFLOW),
        .FIFOTX_UNDERFLOW(FIFOTX_UNDERFLOW),
        .FIFOTX_FULL(fifotx_full),
        .FIFOTX_EMPTY(fifotx_empty),
        
        .BCLK(BCLK),
        .LRCLK(LRCLK),
        .SDATA_I(SDATA_I),
        .SDATA_O(SDATA_O)
    );
// Instantiation of Axi Bus Interface S_AXI_CONFIG
	audio_fifo2stream_v1_0_S_AXI_CONFIG # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_CONFIG_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_CONFIG_ADDR_WIDTH)
	) audio_fifo2stream_v1_0_S_AXI_CONFIG_inst (
	    .rxfifo_en(rxfifo_en),
	    .txfifo_en(txfifo_en),
        
		.S_AXI_ACLK(s_axi_config_aclk),
		.S_AXI_ARESETN(s_axi_config_aresetn),
		.S_AXI_AWADDR(s_axi_config_awaddr),
		.S_AXI_AWPROT(s_axi_config_awprot),
		.S_AXI_AWVALID(s_axi_config_awvalid),
		.S_AXI_AWREADY(s_axi_config_awready),
		.S_AXI_WDATA(s_axi_config_wdata),
		.S_AXI_WSTRB(s_axi_config_wstrb),
		.S_AXI_WVALID(s_axi_config_wvalid),
		.S_AXI_WREADY(s_axi_config_wready),
		.S_AXI_BRESP(s_axi_config_bresp),
		.S_AXI_BVALID(s_axi_config_bvalid),
		.S_AXI_BREADY(s_axi_config_bready),
		.S_AXI_ARADDR(s_axi_config_araddr),
		.S_AXI_ARPROT(s_axi_config_arprot),
		.S_AXI_ARVALID(s_axi_config_arvalid),
		.S_AXI_ARREADY(s_axi_config_arready),
		.S_AXI_RDATA(s_axi_config_rdata),
		.S_AXI_RRESP(s_axi_config_rresp),
		.S_AXI_RVALID(s_axi_config_rvalid),
		.S_AXI_RREADY(s_axi_config_rready)
	);

// Instantiation of Axi Bus Interface S00_AXIS
	audio_fifo2stream_v1_0_S00_AXIS # ( 
		.TDATA_WIDTH(AXIS_TDATA_WIDTH),
		.NUMBER_OF_INPUT_WORDS(TRANSFER_SIZE)
	) audio_fifo2stream_v1_0_S00_AXIS_inst (
        .FIFOTX_DATA(fifotx_data),
        .FIFOTX_WR_EN(fifotx_wren),
        .FIFOTX_FULL(fifotx_full),
        .FIFOTX_EMPTY(fifotx_empty),
        
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		//.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);

// Instantiation of Axi Bus Interface M00_AXIS
	audio_fifo2stream_v1_0_M00_AXIS # ( 
		.TDATA_WIDTH(AXIS_TDATA_WIDTH),
		.NUMBER_OF_OUTPUT_WORDS(TRANSFER_SIZE),
		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) audio_fifo2stream_v1_0_M00_AXIS_inst (
	    .FIFORX_DATA(fiforx_data),
        .FIFORX_VALID(fiforx_valid),
        .FIFORX_RD_EN(fiforx_rden),
        .FIFORX_FULL(fiforx_full),
        .FIFORX_EMPTY(fiforx_empty),
        
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		//.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

	// Add user logic here

	// User logic ends

	endmodule
