
`timescale 1 ns / 1 ps

	module fft_ctrl_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here
        input wire event_frame_started,
        input wire event_tlast_unexpected,
        input wire event_tlast_missing,
        input wire event_fft_overflow,
        input wire event_data_in_channel_halt,
        input wire event_data_out_channel_halt,
        input wire event_status_channel_halt,
        
        output reg fft_core_aresetn,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output reg  m00_axis_tvalid,
		output reg [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		//output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		//output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	
	wire inv_flag;
	reg inv_flag_latched;
	reg [3:0] config_status;
	
	localparam SCALING_SCH = 10'b1010101010;
	
	always @ (posedge s00_axi_aclk) 
	begin
	   if (!s00_axi_aresetn) begin
	       config_status <= 0;
	       inv_flag_latched <= inv_flag;
	       m00_axis_tvalid = 1;
	       fft_core_aresetn <= 0;
	   end else begin
	       case (config_status) 
	           0: begin
	               fft_core_aresetn <= 1;
	               if (inv_flag_latched != inv_flag) begin
	                   m00_axis_tvalid <= 0;
	                   
	                   inv_flag_latched <= inv_flag;
	                   config_status <= 1;
	               end else
	                   config_status <= 0;
	           end
	           1: begin
	               fft_core_aresetn <= 0;
	               config_status <= 2;
	           end
	           2: begin
	               config_status <= 3;
	           end
	           3: begin
	               config_status <= 4;
	           end
	           4: begin
	               config_status <= 5;
	           end
	           5: begin
	           	   if (inv_flag_latched == 1) begin
                       m00_axis_tdata <= {SCALING_SCH, 1'b0};
                   end else begin
                       m00_axis_tdata <= {SCALING_SCH, 1'b1};
                   end
                   fft_core_aresetn <= 1;
                   m00_axis_tvalid <= 1;
                   config_status <= 0;
	           end
	       endcase
	   end
	end
	
// Instantiation of Axi Bus Interface S00_AXI
	fft_ctrl_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) fft_ctrl_v1_0_S00_AXI_inst (
	    .inv_flag(inv_flag),
	    .event_frame_started(event_frame_started),
        .event_tlast_unexpected(event_tlast_unexpected),
        .event_tlast_missing(event_tlast_missing),
        .event_fft_overflow(event_fft_overflow),
        .event_data_in_channel_halt(event_data_in_channel_halt),
        .event_data_out_channel_halt(event_data_out_channel_halt),
        .event_status_channel_halt(event_status_channel_halt),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

// Instantiation of Axi Bus Interface M00_AXIS
//	fft_ctrl_v1_0_M00_AXIS # ( 
//		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
//		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
//	) fft_ctrl_v1_0_M00_AXIS_inst (
//		.M_AXIS_ACLK(m00_axis_aclk),
//		.M_AXIS_ARESETN(m00_axis_aresetn),
//		.M_AXIS_TVALID(m00_axis_tvalid),
//		.M_AXIS_TDATA(m00_axis_tdata),
//		.M_AXIS_TSTRB(m00_axis_tstrb),
//		.M_AXIS_TLAST(m00_axis_tlast),
//		.M_AXIS_TREADY(m00_axis_tready)
//	);

	// Add user logic here

	// User logic ends

	endmodule
