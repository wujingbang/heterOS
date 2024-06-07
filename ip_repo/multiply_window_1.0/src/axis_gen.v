`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/20 13:51:08
// Design Name: 
// Module Name: video_stream_generator
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


module axis_gen(
        input clk,
        input resetn,
        input start,
        //input en,
		// Ports of Axi Master Bus Interface M00_AXIS
        // AXI4-Stream signals
        output wire [63:0] m_axis_tdata,             // AXI4-Stream data
        output wire m_axis_tvalid,            // AXI4-Stream valid 
        input  wire m_axis_tready,            // AXI4-Stream ready 
        output wire m_axis_tuser,             // AXI4-Stream tuser (SOF)
        output wire m_axis_tlast             // AXI4-Stream tlast (EOL)
    );
    
parameter COL   =   1024;

    reg VALID_OUT;
    wire READY_IN;
    reg SOF_OUT;
    reg EOL_OUT;
    reg [63:0] TDATA_OUT;
    
    reg [3:0] curr_out_state;
    reg [3:0] next_out_state;
    reg [10:0] pixel_inline_count;
    
    //reg [9:0] wait_count;
    assign m_axis_tuser = SOF_OUT;
    assign m_axis_tlast = EOL_OUT;
    assign READY_IN = m_axis_tready;
    assign m_axis_tdata = TDATA_OUT;
    assign m_axis_tvalid = VALID_OUT;
    
    parameter OUT_IDLE = 0, 
            OUT_BEGIN_OF_LINE=1, 
            OUT_A0_LINE=2, OUT_A0_LINE_LAST=3,
            OUT_DETERMIN=4,
            //OUT_WAIT = 5,
            ERROR = 6;
            
    

   

    always @ (posedge clk)
    begin
        if ( resetn == 0 )
            curr_out_state <= OUT_IDLE;
        else
            curr_out_state <= next_out_state;
    end
    
    always @ (*)//process_line_starting or ipic_done_wire or curr_process_state)
    begin
        case (curr_out_state)
            OUT_IDLE:
            begin
                if (start)
                    next_out_state = OUT_BEGIN_OF_LINE;
                else
                    next_out_state = OUT_IDLE;
            end
            OUT_BEGIN_OF_LINE: begin
                if (VALID_OUT && READY_IN) 
                    next_out_state = OUT_A0_LINE;
                else
                    next_out_state = OUT_BEGIN_OF_LINE;
            end
            OUT_A0_LINE: begin
                if ((pixel_inline_count == (COL - 2)) && VALID_OUT && READY_IN)//
                    next_out_state = OUT_A0_LINE_LAST;
                else
                    next_out_state = OUT_A0_LINE;
            end
            OUT_A0_LINE_LAST: begin
                if (VALID_OUT && READY_IN) begin
                    next_out_state = ERROR;
                end else
                    next_out_state = OUT_A0_LINE_LAST;
            end

            ERROR: begin
                next_out_state = ERROR;
            end
            default:
                next_out_state = OUT_IDLE;
        endcase
    end
    
    always @ (*)
    begin
     VALID_OUT = curr_out_state > OUT_IDLE && curr_out_state < ERROR;//en && 
    end
    
    reg [7:0] uvdata;
    reg [7:0] ydata;
    always @ (*)
    begin
        if (resetn == 0) begin
            TDATA_OUT = 32'h399784ec;
        end else
        if (VALID_OUT && READY_IN) begin
            if (SOF_OUT)
            begin
                TDATA_OUT = 32'h399784ec;
                uvdata = 0;
                ydata = 32'h399784ec;
            end else if (curr_out_state == OUT_BEGIN_OF_LINE || curr_out_state == OUT_A0_LINE || curr_out_state == OUT_A0_LINE_LAST) begin
                uvdata = uvdata + 1;
                ydata = ydata + 1;
                TDATA_OUT = TDATA_OUT;//{uvdata, ydata};
            end else begin // if (curr_out_state == OUT_A1_LINE || curr_out_state == OUT_A1_LINE_LAST) begin
                TDATA_OUT = TDATA_OUT;
            end
        end else begin
            TDATA_OUT = TDATA_OUT;
        end
    end
    
    always @(posedge clk)
    begin
        if (resetn == 0) begin
            pixel_inline_count <= 0;
        end else begin
            if (VALID_OUT && READY_IN)
                if (SOF_OUT) begin
                    pixel_inline_count <= 1;
                end else if (EOL_OUT) begin
                    pixel_inline_count <= 0;
                end else 
                    pixel_inline_count <= pixel_inline_count + 1;
            else
                pixel_inline_count <= pixel_inline_count; 
        end
    end

    always @(posedge clk)
    begin
        if ( resetn == 0 )
        begin
            SOF_OUT <= 0;
            EOL_OUT <= 0;
        end else begin
            case (next_out_state)
                OUT_IDLE: begin
                    SOF_OUT <= 1;
                    EOL_OUT <= 0;
                end
                OUT_BEGIN_OF_LINE: begin
                    EOL_OUT <= 0;
                end
                OUT_A0_LINE: begin
                    SOF_OUT <= 0;
                end
                OUT_A0_LINE_LAST: begin
                    EOL_OUT <= 1;
                end
                OUT_DETERMIN: begin
                    EOL_OUT <= 0;
                end
                ERROR: begin
                    EOL_OUT <= 0;
                end
            endcase
        end
    end
    
endmodule