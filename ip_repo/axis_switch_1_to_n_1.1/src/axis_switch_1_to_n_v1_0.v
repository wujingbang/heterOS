
`timescale 1 ns / 1 ps

	module axis_switch_1_to_n_v1_0 #
	(
		
		parameter integer DEVICE_NUMBER = 3,
		//Ensure width of tdata lower than 64
		parameter integer AXIS_TDATA_WIDTH	= 64

	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        input wire s00_suppress,
        input wire s01_suppress,
        input wire s02_suppress,
        
        output wire s00_valid,
        output wire s01_valid,
        output wire s02_valid,
        
        output reg [DEVICE_NUMBER-1:0] s2mm_rdy_dly,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  axis_aclk,
		input wire  axis_aresetn,
		input wire  axis_aclken,
		
		output reg  s00_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Slave Bus Interface S01_AXIS
//		input wire  s01_axis_aclk,
//		input wire  s01_axis_aresetn,
		output reg  s01_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s01_axis_tdata,
		input wire [(AXIS_TDATA_WIDTH/8)-1 : 0] s01_axis_tstrb,
		input wire  s01_axis_tlast,
		input wire  s01_axis_tvalid,

		// Ports of Axi Slave Bus Interface S02_AXIS
//		input wire  s02_axis_aclk,
//		input wire  s02_axis_aresetn,
		output reg  s02_axis_tready,
		input wire [AXIS_TDATA_WIDTH-1 : 0] s02_axis_tdata,
		input wire [(AXIS_TDATA_WIDTH/8)-1 : 0] s02_axis_tstrb,
		input wire  s02_axis_tlast,
		input wire  s02_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
//		input wire  m00_axis_aclk,
//		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output reg [(AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	//(*mark_debug = "true"*)
	reg TVALID_IN_S;
	reg TLAST_IN_S;
	wire TREADY_OUT_S;
	reg [AXIS_TDATA_WIDTH-1 : 0] TDATA_S;
	
	reg FIFO_WR_EN;
    reg FIFO_FULL;
    reg [64:0] FIFO_DIN; //last bit refer to the last word of the packet.
    wire FIFO_RD_EN;
    reg FIFO_VALID;
    reg [64:0] FIFO_DOUT;
    
	reg fifo_wr_en_0;
    wire fifo_full_0;
    reg [64:0] fifo_din_0; //last bit refer to the last word of the packet.
    reg fifo_rd_en_0;
    wire fifo_empty_0;
    wire fifo_valid_0;
    wire [64:0] fifo_dout_0;
    
	fifo_generator_0 fifo_inst_0 (
      .clk(axis_aclk),                // input wire clk
      .srst(!axis_aresetn),
      .din(fifo_din_0),                // input wire [31 : 0] din
      .full(fifo_full_0),
      .wr_en(fifo_wr_en_0),            // input wire wr_en
      .rd_en(fifo_rd_en_0),            // input wire rd_en
      .dout(fifo_dout_0),              // output wire [31 : 0] dout
      .empty(fifo_empty_0),
      .valid(fifo_valid_0)            // output wire valid
    );

    reg fifo_wr_en_1;
    wire fifo_full_1;
    reg [64:0] fifo_din_1; //last bit refer to the last word of the packet.
    reg fifo_rd_en_1;
    wire fifo_empty_1;
    wire fifo_valid_1;
    wire [64:0] fifo_dout_1;
    
	fifo_generator_0 fifo_inst_1 (
      .clk(axis_aclk),                // input wire clk
      .srst(!axis_aresetn),
      .din(fifo_din_1),                // input wire [31 : 0] din
      .full(fifo_full_1),
      .wr_en(fifo_wr_en_1),            // input wire wr_en
      .rd_en(fifo_rd_en_1),            // input wire rd_en
      .dout(fifo_dout_1),              // output wire [31 : 0] dout
      .empty(fifo_empty_1),
      .valid(fifo_valid_1)            // output wire valid
    );
    
    reg fifo_wr_en_2;
    wire fifo_full_2;
    reg [64:0] fifo_din_2; //last bit refer to the last word of the packet.
    reg fifo_rd_en_2;
    wire fifo_empty_2;
    wire fifo_valid_2;
    wire [64:0] fifo_dout_2;
    
	fifo_generator_0 fifo_inst_2 (
      .clk(axis_aclk),                // input wire clk
      .srst(!axis_aresetn),
      .din(fifo_din_2),                // input wire [31 : 0] din
      .full(fifo_full_2),
      .wr_en(fifo_wr_en_2),            // input wire wr_en
      .rd_en(fifo_rd_en_2),            // input wire rd_en
      .dout(fifo_dout_2),              // output wire [31 : 0] dout
      .empty(fifo_empty_2),
      .valid(fifo_valid_2)            // output wire valid
    );
    
    assign TREADY_OUT_S = !FIFO_FULL;
	assign s00_valid = s00_axis_tvalid;
    assign s01_valid = s01_axis_tvalid;
    assign s02_valid = s02_axis_tvalid;
    
    always @ (posedge axis_aclk)
    begin
        s2mm_rdy_dly[0] = s00_axis_tready;
        s2mm_rdy_dly[1] = s01_axis_tready;
        s2mm_rdy_dly[2] = s02_axis_tready;
    end

	always @(*) begin
       if (!s00_suppress) begin
           TVALID_IN_S = s00_axis_tvalid;
           TDATA_S = s00_axis_tdata;
           TLAST_IN_S = s00_axis_tlast;
           s00_axis_tready = TREADY_OUT_S;
           s01_axis_tready = 0;
           s02_axis_tready = 0;
           m00_axis_tstrb = s00_axis_tstrb;
           
           fifo_wr_en_0 = FIFO_WR_EN;
           FIFO_FULL = fifo_full_0;
           fifo_din_0 = FIFO_DIN; 
           fifo_rd_en_0 = FIFO_RD_EN;
           FIFO_VALID = fifo_valid_0;
           FIFO_DOUT = fifo_dout_0;
       end else if (!s01_suppress) begin
           TVALID_IN_S = s01_axis_tvalid;
           TDATA_S = s01_axis_tdata;
           TLAST_IN_S = s01_axis_tlast;
           s01_axis_tready = TREADY_OUT_S;
           s00_axis_tready = 0;
           s02_axis_tready = 0;
           m00_axis_tstrb = s01_axis_tstrb;
           
           fifo_wr_en_1 = FIFO_WR_EN;
           FIFO_FULL = fifo_full_1;
           fifo_din_1 = FIFO_DIN; 
           fifo_rd_en_1 = FIFO_RD_EN;
           FIFO_VALID = fifo_valid_1;
           FIFO_DOUT = fifo_dout_1;
       end else if (!s02_suppress) begin
           TVALID_IN_S = s02_axis_tvalid;
           TDATA_S = s02_axis_tdata;
           TLAST_IN_S = s02_axis_tlast;
           s02_axis_tready = TREADY_OUT_S;
           s00_axis_tready = 0;
           s01_axis_tready = 0;
           m00_axis_tstrb = s02_axis_tstrb;
           
           fifo_wr_en_2 = FIFO_WR_EN;
           FIFO_FULL = fifo_full_2;
           fifo_din_2 = FIFO_DIN; 
           fifo_rd_en_2 = FIFO_RD_EN;
           FIFO_VALID = fifo_valid_2;
           FIFO_DOUT = fifo_dout_2;
       end else begin
           TVALID_IN_S = 0;
           TDATA_S = 0;
           TLAST_IN_S = 0;
           s00_axis_tready = 0;
           s01_axis_tready = 0;
           s02_axis_tready = 0;
           m00_axis_tstrb = 0;
           
           fifo_wr_en_0 = 0;
           fifo_wr_en_1 = 0;
           fifo_wr_en_2 = 0;
           FIFO_FULL = 0;
           
           fifo_rd_en_0 = 0;
           fifo_rd_en_1 = 0;
           fifo_rd_en_2 = 0;
           FIFO_VALID = 0;
           FIFO_DOUT = 0;
       end
	end
	
    always @(*) begin
        if (TVALID_IN_S && TREADY_OUT_S) begin
            FIFO_WR_EN = 1;
            FIFO_DIN[AXIS_TDATA_WIDTH-1 : 0] = TDATA_S;
            if (TLAST_IN_S) begin
                FIFO_DIN[AXIS_TDATA_WIDTH] = 1;
            end else begin
                FIFO_DIN[AXIS_TDATA_WIDTH] = 0;
            end
        end else begin
            FIFO_WR_EN = 0;
            FIFO_DIN = 0;
        end
    end
  
    output_stream # (
        .AXIS_TDATA_WIDTH(AXIS_TDATA_WIDTH)
    ) output_stream_inst (
        .aclk(axis_aclk),
        .resetn(axis_aresetn),
        .m_axis_tdata(m00_axis_tdata),             // AXI4-Stream data
        .m_axis_tvalid(m00_axis_tvalid),            // AXI4-Stream valid 
        .m_axis_tready(m00_axis_tready),            // AXI4-Stream ready 
        .m_axis_tlast(m00_axis_tlast),             // AXI4-Stream tlast (EOL)
        .fifo_dout(FIFO_DOUT),
        .fifo_rd_en(FIFO_RD_EN),
        .fifo_valid(FIFO_VALID)
    );
	
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
