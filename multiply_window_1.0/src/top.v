`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/04 22:40:24
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top;
reg                             clk                             ;       
reg                             rst_n                           ; 
reg                             start;
wire [63:0] m_axis_tdata;             // AXI4-Stream data
wire m_axis_tvalid;            // AXI4-Stream valid 
wire m_axis_tready;            // AXI4-Stream ready 
wire m_axis_tuser;             // AXI4-Stream tuser (SOF)
wire m_axis_tlast;
wire [63:0] out_tdata;             // AXI4-Stream data
wire out_tvalid;            // AXI4-Stream valid 
reg out_tready;            // AXI4-Stream ready 
wire out_tuser;             // AXI4-Stream tuser (SOF)
wire out_tlast;             // AXI4-Stream tlast (EOL)

always  #1      clk     =   ~clk;

initial begin
	clk 		<=  1'b1;
	rst_n	    <=  1'b0;
	start       <= 0;
	out_tready  <= 1;
	#100
	rst_n	    <=  1'b1;
    #200
    start       <= 1;
    
end

axis_gen axis_gen_inst(
        .clk(clk),
        .resetn(rst_n),
        .start(start),
		// Ports of Axi Master Bus Interface M00_AXIS
        // AXI4-Stream signals
        .m_axis_tdata(m_axis_tdata),             // AXI4-Stream data
        .m_axis_tvalid(m_axis_tvalid),            // AXI4-Stream valid 
        .m_axis_tready(m_axis_tready),            // AXI4-Stream ready 
        .m_axis_tlast(m_axis_tlast)             // AXI4-Stream tlast (EOL)
    );
    
multiply_window_v1_0 multiply_window_inst (
    .aclk(clk),
    .aresetn(rst_n),
    .s_axis_tdata(m_axis_tdata),
    .s_axis_tvalid(m_axis_tvalid),
    .s_axis_tready(m_axis_tready),
    .s_axis_tlast(m_axis_tlast),
    
    .m_axis_tdata(out_tdata),
    .m_axis_tvalid(out_tvalid),
    .m_axis_tready(out_tready),
    .m_axis_tlast(out_tlast)
);



endmodule
