
`timescale 1 ns / 1 ps

	module axis_switch_1_to_n_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Slave Bus Interface S01_AXIS
		parameter integer C_S01_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Slave Bus Interface S02_AXIS
		parameter integer C_S02_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        input wire s00_suppress,
        input wire s01_suppress,
        input wire s02_suppress,
        
        output reg s00_valid,
        output reg s01_valid,
        output reg s02_valid,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  axis_aclk,
		input wire  axis_aresetn,
		input wire  axis_aclken,
		
		output reg  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Slave Bus Interface S01_AXIS
//		input wire  s01_axis_aclk,
//		input wire  s01_axis_aresetn,
		output reg  s01_axis_tready,
		input wire [C_S01_AXIS_TDATA_WIDTH-1 : 0] s01_axis_tdata,
		input wire [(C_S01_AXIS_TDATA_WIDTH/8)-1 : 0] s01_axis_tstrb,
		input wire  s01_axis_tlast,
		input wire  s01_axis_tvalid,

		// Ports of Axi Slave Bus Interface S02_AXIS
//		input wire  s02_axis_aclk,
//		input wire  s02_axis_aresetn,
		output reg  s02_axis_tready,
		input wire [C_S02_AXIS_TDATA_WIDTH-1 : 0] s02_axis_tdata,
		input wire [(C_S02_AXIS_TDATA_WIDTH/8)-1 : 0] s02_axis_tstrb,
		input wire  s02_axis_tlast,
		input wire  s02_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
//		input wire  m00_axis_aclk,
//		input wire  m00_axis_aresetn,
		output reg  m00_axis_tvalid,
		output reg [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output reg [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output reg  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	always @(posedge axis_aclk) begin
	   if (!axis_aresetn || !axis_aclken) begin
           s00_valid <= 0;
           s01_valid <= 0;
           s02_valid <= 0;
	   end else begin
	       s00_valid <= s00_axis_tvalid;
           s01_valid <= s01_axis_tvalid;
           s02_valid <= s02_axis_tvalid;
	   end
	end
	
	always @(posedge axis_aclk) begin
	   if (!axis_aresetn || !axis_aclken) begin
	       m00_axis_tvalid <= 0;
           m00_axis_tdata <= 0;
           m00_axis_tstrb <= 0;
           m00_axis_tlast <= 0;
           s00_axis_tready <= 0;
           s01_axis_tready <= 0;
           s02_axis_tready <= 0;
	   end else begin
           if (!s00_suppress) begin
               m00_axis_tvalid <= s00_axis_tvalid;
               m00_axis_tdata <= s00_axis_tdata;
               m00_axis_tstrb <= s00_axis_tstrb;
               m00_axis_tlast <= s00_axis_tlast;
               s00_axis_tready <= m00_axis_tready;
           end else if (!s01_suppress) begin
               m00_axis_tvalid <= s01_axis_tvalid;
               m00_axis_tdata <= s01_axis_tdata;
               m00_axis_tstrb <= s01_axis_tstrb;
               m00_axis_tlast <= s01_axis_tlast;
               s01_axis_tready <= m00_axis_tready;
           end else if (!s02_suppress) begin
               m00_axis_tvalid <= s02_axis_tvalid;
               m00_axis_tdata <= s02_axis_tdata;
               m00_axis_tstrb <= s02_axis_tstrb;
               m00_axis_tlast <= s02_axis_tlast;
               s02_axis_tready <= m00_axis_tready;
           end else begin
               m00_axis_tvalid <= 0;
               m00_axis_tdata <= 0;
               m00_axis_tstrb <= 0;
               m00_axis_tlast <= 0;
               s00_axis_tready <= 0;
               s01_axis_tready <= 0;
               s02_axis_tready <= 0;
           end
	   end
	end
	
//// Instantiation of Axi Bus Interface S00_AXIS
//	axis_switch_1_to_n_v1_0_S00_AXIS # ( 
//		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
//	) axis_switch_1_to_n_v1_0_S00_AXIS_inst (
//		.S_AXIS_ACLK(axis_aclk),
//		.S_AXIS_ARESETN(axis_aresetn),
//		.S_AXIS_TREADY(s00_axis_tready),
//		.S_AXIS_TDATA(s00_axis_tdata),
//		.S_AXIS_TSTRB(s00_axis_tstrb),
//		.S_AXIS_TLAST(s00_axis_tlast),
//		.S_AXIS_TVALID(s00_axis_tvalid)
//	);

//// Instantiation of Axi Bus Interface S01_AXIS
//	axis_switch_1_to_n_v1_0_S01_AXIS # ( 
//		.C_S_AXIS_TDATA_WIDTH(C_S01_AXIS_TDATA_WIDTH)
//	) axis_switch_1_to_n_v1_0_S01_AXIS_inst (
//		.S_AXIS_ACLK(axis_aclk),
//		.S_AXIS_ARESETN(axis_aresetn),
//		.S_AXIS_TREADY(s01_axis_tready),
//		.S_AXIS_TDATA(s01_axis_tdata),
//		.S_AXIS_TSTRB(s01_axis_tstrb),
//		.S_AXIS_TLAST(s01_axis_tlast),
//		.S_AXIS_TVALID(s01_axis_tvalid)
//	);

//// Instantiation of Axi Bus Interface S02_AXIS
//	axis_switch_1_to_n_v1_0_S02_AXIS # ( 
//		.C_S_AXIS_TDATA_WIDTH(C_S02_AXIS_TDATA_WIDTH)
//	) axis_switch_1_to_n_v1_0_S02_AXIS_inst (
//		.S_AXIS_ACLK(axis_aclk),
//		.S_AXIS_ARESETN(axis_aresetn),
//		.S_AXIS_TREADY(s02_axis_tready),
//		.S_AXIS_TDATA(s02_axis_tdata),
//		.S_AXIS_TSTRB(s02_axis_tstrb),
//		.S_AXIS_TLAST(s02_axis_tlast),
//		.S_AXIS_TVALID(s02_axis_tvalid)
//	);

//// Instantiation of Axi Bus Interface M00_AXIS
//	axis_switch_1_to_n_v1_0_M00_AXIS # ( 
//		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
//		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
//	) axis_switch_1_to_n_v1_0_M00_AXIS_inst (
//		.M_AXIS_ACLK(axis_aclk),
//		.M_AXIS_ARESETN(axis_aresetn),
//		.M_AXIS_TVALID(m00_axis_tvalid),
//		.M_AXIS_TDATA(m00_axis_tdata),
//		.M_AXIS_TSTRB(m00_axis_tstrb),
//		.M_AXIS_TLAST(m00_axis_tlast),
//		.M_AXIS_TREADY(m00_axis_tready)
//	);

	// Add user logic here

	// User logic ends

	endmodule
