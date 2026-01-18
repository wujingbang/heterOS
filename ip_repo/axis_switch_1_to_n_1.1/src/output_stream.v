`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 21:06:28
// Design Name: 
// Module Name: output_stream
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


module output_stream#(
        //parameter integer MAX_LINE=540 //1080/2
        parameter integer AXIS_TDATA_WIDTH	= 64
)(
        input  wire aclk,
        input  wire resetn,

        // Ports of Axi Master Bus Interface M00_AXIS
        output wire [AXIS_TDATA_WIDTH-1:0] m_axis_tdata,             // AXI4-Stream data
        output wire m_axis_tvalid,            // AXI4-Stream valid 
        input  wire m_axis_tready,            // AXI4-Stream ready 
        output reg m_axis_tlast,             // AXI4-Stream tlast (EOL)
        
        input wire [64:0] fifo_dout,
        output reg fifo_rd_en,
        input wire fifo_valid
    );
    
    reg VALID_OUT;
    wire READY_IN;
    reg [AXIS_TDATA_WIDTH-1:0] TDATA_OUT;
    
    
//    parameter FILE_PATH_A = "r:/yuv444-out.dat";
//    integer i;
//    integer file_o;
//    initial begin
//        file_o = $fopen(FILE_PATH_A,"w");//r:????????
//    end
//    always @ (negedge aclk)
//    begin
//        if (VALID_OUT && READY_IN)
//            $fwrite(file_o, "%h\n", TDATA_OUT);
//    end
    
    reg [3:0] curr_out_state;
    reg [3:0] next_out_state;
        
    assign READY_IN = m_axis_tready;
    assign m_axis_tdata = TDATA_OUT;
    assign m_axis_tvalid = VALID_OUT;
    
//    always @ (*)
//    begin
//     VALID_OUT = fifo_valid;
//    end
    
    always @(*)
    begin
//        if (resetn == 0) begin
//            fifo_rd_en = 0;
//        end else begin
            if (fifo_valid && READY_IN) begin
                fifo_rd_en = 1;
                TDATA_OUT = fifo_dout[AXIS_TDATA_WIDTH-1:0];
                VALID_OUT = 1;
                m_axis_tlast = fifo_dout[64];
            end else begin
                fifo_rd_en = 0;
                TDATA_OUT = 0;
                VALID_OUT = 0;
                m_axis_tlast = 0;
            end
//        end
    end
    
//    always @ (*)
//    begin
//        if (VALID_OUT && READY_IN) begin
//            fifo_rd_en = 1;
//            TDATA_OUT = fifo_dout[AXIS_TDATA_WIDTH-1:0];
//            m_axis_tlast = fifo_dout[64];
//        end else begin
//            fifo_rd_en = 0;
//            TDATA_OUT = 0;
//            m_axis_tlast = 0;
//        end
//    end
    

endmodule
