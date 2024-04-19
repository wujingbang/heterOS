
`timescale 1 ns / 1 ps

	module multiply_window_v1_0_M_AXIS #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32,
		// Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		parameter integer C_M_START_COUNT	= 32
	)
	(
		// Users to add ports here
        input wire res_fifo_valid,
        output reg res_fifo_rd_en,
        input wire [31:0] res_fifo_outdata,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global ports
		input wire  M_AXIS_ACLK,
		// 
		input wire  M_AXIS_ARESETN,
		// Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		output wire  M_AXIS_TVALID,
		// TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
		// TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB,
		// TLAST indicates the boundary of a packet.
		output wire  M_AXIS_TLAST,
		// TREADY indicates that the slave can accept a transfer in the current cycle.
		input wire  M_AXIS_TREADY
	);
	// Total number of output data                                                 
	localparam NUMBER_OF_OUTPUT_WORDS = 1024;                                               
	                                                                                     
	// function called clogb2 that returns an integer which has the                      
	// value of the ceiling of the log base 2.                                           
	function integer clogb2 (input integer bit_depth);                                   
	  begin                                                                              
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
	      bit_depth = bit_depth >> 1;                                                    
	  end                                                                                
	endfunction                                                                          
	                                                                                     
	// WAIT_COUNT_BITS is the width of the wait counter.                                 
	localparam integer WAIT_COUNT_BITS = clogb2(C_M_START_COUNT-1);                      
	                                                                                     
	// bit_num gives the minimum number of bits needed to address 'depth' size of FIFO.  
	localparam bit_num  = clogb2(NUMBER_OF_OUTPUT_WORDS);                                
    reg [bit_num-1:0] read_pointer;

    reg VALID_OUT;
    wire READY_IN;
    reg EOL_OUT;
    reg [C_M_AXIS_TDATA_WIDTH-1 : 0] TDATA_OUT;
    
    assign M_AXIS_TLAST = EOL_OUT;
    assign READY_IN = M_AXIS_TREADY;
    assign M_AXIS_TDATA = TDATA_OUT;
    assign M_AXIS_TVALID = VALID_OUT;
    
    reg [2:0] curr_out_state;
    reg [2:0] next_out_state;
    
    parameter OUT_IDLE = 0, 
            OUT_START=1, OUT_START_LAST=2;
            //OUT_DETERMIN=6;

    always @ (*)
    begin
     VALID_OUT =
        ((curr_out_state == OUT_START || curr_out_state == OUT_START_LAST) && res_fifo_valid);//
    end
    
    always @ (*)
    begin
        if (VALID_OUT && READY_IN) begin
            if (curr_out_state == OUT_START || curr_out_state == OUT_START_LAST) begin
                res_fifo_rd_en = 1;
                TDATA_OUT = res_fifo_outdata;
            end else begin // if (curr_out_state == OUT_A1_LINE || curr_out_state == OUT_A1_LINE_LAST) begin
                res_fifo_rd_en = 0;
                TDATA_OUT = 0;
            end
        end else begin
            res_fifo_rd_en = 0;
            TDATA_OUT = 0;
        end
    end
    
    always @(posedge M_AXIS_ACLK)
    begin
        if (M_AXIS_ARESETN == 0) begin
            read_pointer <= 0;
        end else begin
            if (VALID_OUT && READY_IN)
                if (EOL_OUT) begin
                    read_pointer <= 0;
                end else 
                    read_pointer <= read_pointer + 1;
            else
                read_pointer <= read_pointer; 
        end
    end

    always @ (posedge M_AXIS_ACLK)
    begin
        if ( M_AXIS_ARESETN == 0 )
            curr_out_state <= OUT_IDLE;
        else
            curr_out_state <= next_out_state;
    end
    
    always @ (*)//process_line_starting or ipic_done_wire or curr_process_state)
    begin
        case (curr_out_state)
            OUT_IDLE:
            begin
                if (res_fifo_valid) 
                    next_out_state = OUT_START;
                else
                    next_out_state = OUT_IDLE;
            end
            OUT_START: begin
                if ((read_pointer == (NUMBER_OF_OUTPUT_WORDS - 2)) && VALID_OUT && READY_IN)//
                    next_out_state = OUT_START_LAST;
                else
                    next_out_state = OUT_START;
            end
            OUT_START_LAST: begin
                if (VALID_OUT && READY_IN) 
                    next_out_state = OUT_IDLE;
                else
                    next_out_state = OUT_START_LAST;
            end
            default:
                next_out_state = OUT_IDLE;
        endcase
    end

    always @(posedge M_AXIS_ACLK)
    begin
        if ( M_AXIS_ARESETN == 0 )
        begin
            EOL_OUT <= 0;
        end else begin
            case (next_out_state)
                OUT_IDLE: begin
                    EOL_OUT <= 0;
                end
                OUT_START: begin
                
                end
                OUT_START_LAST: begin
                    EOL_OUT <= 1;
                end
            endcase
        end
    end
    
	endmodule
