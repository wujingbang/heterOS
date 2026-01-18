
`timescale 1 ns / 1 ps

	module axis_switch_n_to_1_v1_0 #
	(
		// Users to add parameters here
        parameter integer DEVICE_NUMBER	= 3,
		// User parameters ends
		// Do not modify the parameters beyond this line
		
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_AXIS_TDATA_WIDTH	= 64


	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        input wire [3:0] s_axis_tdest,
        output reg [DEVICE_NUMBER-1:0] mm2s_valid_dly,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  axis_aclk,
		input wire  axis_aresetn,
		
		output reg  s00_axis_tready,
		input wire [C_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
//		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
//		input wire  m00_axis_aclk,
//		input wire  m00_axis_aresetn,
		output reg  m00_axis_tvalid,
		output reg [C_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
//		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output reg  m00_axis_tlast,
		input wire  m00_axis_tready,

		// Ports of Axi Master Bus Interface M01_AXIS
//		input wire  m01_axis_aclk,
//		input wire  m01_axis_aresetn,
		output reg  m01_axis_tvalid,
		output reg [C_AXIS_TDATA_WIDTH-1 : 0] m01_axis_tdata,
//		output wire [(C_M01_AXIS_TDATA_WIDTH/8)-1 : 0] m01_axis_tstrb,
		output reg  m01_axis_tlast,
		input wire  m01_axis_tready,

		// Ports of Axi Master Bus Interface M02_AXIS
//		input wire  m02_axis_aclk,
//		input wire  m02_axis_aresetn,
		output reg  m02_axis_tvalid,
		output reg [C_AXIS_TDATA_WIDTH-1 : 0] m02_axis_tdata,
//		output wire [(C_M02_AXIS_TDATA_WIDTH/8)-1 : 0] m02_axis_tstrb,
		output reg  m02_axis_tlast,
		input wire  m02_axis_tready
	);
	
	always @ (posedge axis_aclk)
	begin
	   mm2s_valid_dly[0] <= m00_axis_tvalid;
	   mm2s_valid_dly[1] <= m01_axis_tvalid;
	   mm2s_valid_dly[2] <= m02_axis_tvalid;
	end
	
	always @ (*)
	begin
	   if (s_axis_tdest == 0) begin
	       s00_axis_tready = m00_axis_tready;
	       m00_axis_tvalid = s00_axis_tvalid;
	       m00_axis_tdata = s00_axis_tdata;
	       m00_axis_tlast = s00_axis_tlast;
	   end else if (s_axis_tdest == 1) begin
	       s00_axis_tready = m01_axis_tready;
	       m01_axis_tvalid = s00_axis_tvalid;
	       m01_axis_tdata = s00_axis_tdata;
	       m01_axis_tlast = s00_axis_tlast;
	   end else if (s_axis_tdest == 2) begin
	       s00_axis_tready = m02_axis_tready;
	       m02_axis_tvalid = s00_axis_tvalid;
	       m02_axis_tdata = s00_axis_tdata;
	       m02_axis_tlast = s00_axis_tlast;
	   end else begin
	       s00_axis_tready = 0;
	       m00_axis_tvalid = 0;
	       m01_axis_tvalid = 0;
	       m02_axis_tvalid = 0;
	       m00_axis_tlast = 0;
	       m01_axis_tlast = 0;
	       m02_axis_tlast = 0;
	   end
	end
	
	
	
	
	
	
	
	
//// Instantiation of Axi Bus Interface S00_AXIS
//	axis_switch_n_to_1_v1_0_S00_AXIS # ( 
//		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
//	) axis_switch_n_to_1_v1_0_S00_AXIS_inst (
//		.S_AXIS_ACLK(s00_axis_aclk),
//		.S_AXIS_ARESETN(s00_axis_aresetn),
//		.S_AXIS_TREADY(s00_axis_tready),
//		.S_AXIS_TDATA(s00_axis_tdata),
//		.S_AXIS_TSTRB(s00_axis_tstrb),
//		.S_AXIS_TLAST(s00_axis_tlast),
//		.S_AXIS_TVALID(s00_axis_tvalid)
//	);

//// Instantiation of Axi Bus Interface M00_AXIS
//	axis_switch_n_to_1_v1_0_M00_AXIS # ( 
//		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
//		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
//	) axis_switch_n_to_1_v1_0_M00_AXIS_inst (
//		.M_AXIS_ACLK(m00_axis_aclk),
//		.M_AXIS_ARESETN(m00_axis_aresetn),
//		.M_AXIS_TVALID(m00_axis_tvalid),
//		.M_AXIS_TDATA(m00_axis_tdata),
//		.M_AXIS_TSTRB(m00_axis_tstrb),
//		.M_AXIS_TLAST(m00_axis_tlast),
//		.M_AXIS_TREADY(m00_axis_tready)
//	);

//// Instantiation of Axi Bus Interface M01_AXIS
//	axis_switch_n_to_1_v1_0_M01_AXIS # ( 
//		.C_M_AXIS_TDATA_WIDTH(C_M01_AXIS_TDATA_WIDTH),
//		.C_M_START_COUNT(C_M01_AXIS_START_COUNT)
//	) axis_switch_n_to_1_v1_0_M01_AXIS_inst (
//		.M_AXIS_ACLK(m01_axis_aclk),
//		.M_AXIS_ARESETN(m01_axis_aresetn),
//		.M_AXIS_TVALID(m01_axis_tvalid),
//		.M_AXIS_TDATA(m01_axis_tdata),
//		.M_AXIS_TSTRB(m01_axis_tstrb),
//		.M_AXIS_TLAST(m01_axis_tlast),
//		.M_AXIS_TREADY(m01_axis_tready)
//	);

//// Instantiation of Axi Bus Interface M02_AXIS
//	axis_switch_n_to_1_v1_0_M02_AXIS # ( 
//		.C_M_AXIS_TDATA_WIDTH(C_M02_AXIS_TDATA_WIDTH),
//		.C_M_START_COUNT(C_M02_AXIS_START_COUNT)
//	) axis_switch_n_to_1_v1_0_M02_AXIS_inst (
//		.M_AXIS_ACLK(m02_axis_aclk),
//		.M_AXIS_ARESETN(m02_axis_aresetn),
//		.M_AXIS_TVALID(m02_axis_tvalid),
//		.M_AXIS_TDATA(m02_axis_tdata),
//		.M_AXIS_TSTRB(m02_axis_tstrb),
//		.M_AXIS_TLAST(m02_axis_tlast),
//		.M_AXIS_TREADY(m02_axis_tready)
//	);

	// Add user logic here

	// User logic ends

	endmodule
