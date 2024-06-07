
`timescale 1 ns / 1 ps

	module audio_fifo2stream_v1_0_M00_AXIS #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		parameter integer TDATA_WIDTH	= 64,
		// Total number of output data         
		parameter integer NUMBER_OF_OUTPUT_WORDS = 1024,
		// Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		parameter integer C_M_START_COUNT	= 64
	)
	(
		// Users to add ports here
        input wire [47:0] FIFORX_DATA,
        input wire FIFORX_VALID,
        output reg FIFORX_RD_EN,
        input wire FIFORX_FULL,
        input wire FIFORX_EMPTY,
        
		// User ports ends
		// Do not modify the ports beyond this line

		// Global ports
		input wire  M_AXIS_ACLK,
		// 
		input wire  M_AXIS_ARESETN,
		// Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		output wire  M_AXIS_TVALID,
		// TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		output wire [TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
		// TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		// TLAST indicates the boundary of a packet.
		output wire  M_AXIS_TLAST,
		// TREADY indicates that the slave can accept a transfer in the current cycle.
		input wire  M_AXIS_TREADY
	);
                            
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
	localparam bit_num  = clogb2(NUMBER_OF_OUTPUT_WORDS-1);                                

    reg [bit_num-1:0] read_pointer;

    reg VALID_OUT;
    wire READY_IN;
    reg EOL_OUT;
    reg [63:0] TDATA_OUT;
    
    reg [2:0] curr_out_state;
    reg [2:0] next_out_state;
    reg [2:0] b24tofloat_state;
    
    reg [23:0] b24tofloat_input_data_l;
    wire b24tofloat_rdy_l;
    reg b24tofloat_valid_l;
    wire [31:0] b24tofloat_output_data_l;
    wire b24tofloat_output_valid_l;
    
    reg [23:0] b24tofloat_input_data_r;
    wire b24tofloat_rdy_r;
    reg b24tofloat_valid_r;
    wire [31:0] b24tofloat_output_data_r;
    wire b24tofloat_output_valid_r;
    
    reg [63:0] rx_l_r_float_indata;
    wire rx_l_r_float_full;
    reg rx_l_r_float_wr_en;
    reg rx_l_r_float_rd_en;
    wire [63:0] rx_l_r_float_outdata;
    wire rx_l_r_float_empty;
    wire rx_l_r_float_valid;
    
    wire  [13:0] rx_float_count;
              
    assign M_AXIS_TLAST = EOL_OUT;
    assign READY_IN = M_AXIS_TREADY;
    assign M_AXIS_TDATA = TDATA_OUT;
    assign M_AXIS_TVALID = VALID_OUT;
    
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //
    //From ADAU1761 24bits data to 32bits IEEE754 single floating
    //RXFIFO to RX_FLOAT_FIFO,
    always @ (posedge M_AXIS_ACLK)
    begin
        if (M_AXIS_ARESETN == 0) begin
            b24tofloat_state <= 0;
            rx_l_r_float_wr_en <= 0;
            b24tofloat_valid_l <= 0;
            b24tofloat_valid_r <= 0;
            FIFORX_RD_EN <= 0;
        end else begin
            case (b24tofloat_state)
                0: begin
                    rx_l_r_float_wr_en <= 0;
                    if (FIFORX_VALID && b24tofloat_rdy_l && b24tofloat_rdy_r) begin
                        FIFORX_RD_EN <= 1;
                        b24tofloat_input_data_l <= FIFORX_DATA[47:24];
                        b24tofloat_valid_l <= 1;
                        b24tofloat_input_data_r <= FIFORX_DATA[23:0];
                        b24tofloat_valid_r <= 1;
                        b24tofloat_state <= 1;
                    end else begin
                        FIFORX_RD_EN <= 0;
                        b24tofloat_valid_l <= 0;
                        b24tofloat_valid_r <= 0;
                        b24tofloat_state <= 0;
                    end
                end
                1: begin
                    FIFORX_RD_EN <= 0;
                    b24tofloat_valid_l <= 0;
                    b24tofloat_valid_r <= 0;
                    if (b24tofloat_output_valid_l) begin
                        rx_l_r_float_indata[63:32] <= b24tofloat_output_data_l;
                        rx_l_r_float_indata[31:0] <= b24tofloat_output_data_r;
                        rx_l_r_float_wr_en <= 1;
                        b24tofloat_state <= 0;
                    end else begin
                        rx_l_r_float_wr_en <= 0;
                        b24tofloat_state <= 1;
                    end
                end
//                2: begin
//                    if (rx_l_r_float_full) 
//                        b24tofloat_state <= 2;
//                    else
//                        b24tofloat_state <= 0;
//                end
            endcase
        end
    end
    
    parameter OUT_IDLE = 0, 
            OUT_START=1, OUT_START_LAST=2;
            //OUT_DETERMIN=6;

    always @ (*)
    begin
     VALID_OUT =
        ((curr_out_state == OUT_START || curr_out_state == OUT_START_LAST) && rx_l_r_float_valid);//
    end
    
    always @ (*)
    begin
        if (VALID_OUT && READY_IN) begin
            if (curr_out_state == OUT_START || curr_out_state == OUT_START_LAST) begin
                rx_l_r_float_rd_en = 1;
                TDATA_OUT = rx_l_r_float_outdata;
            end else begin // if (curr_out_state == OUT_A1_LINE || curr_out_state == OUT_A1_LINE_LAST) begin
                rx_l_r_float_rd_en = 0;
                TDATA_OUT = 0;
            end
        end else begin
            rx_l_r_float_rd_en = 0;
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
                if (rx_l_r_float_valid) 
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
    

    
    b24_to_float b24_to_float_l_inst (
        .aclk(M_AXIS_ACLK),
        .s_axis_a_tdata(b24tofloat_input_data_l),
        .s_axis_a_tready(b24tofloat_rdy_l),
        .s_axis_a_tvalid(b24tofloat_valid_l),
        .m_axis_result_tdata(b24tofloat_output_data_l),
        .m_axis_result_tvalid(b24tofloat_output_valid_l)
    );
    
    b24_to_float b24_to_float_r_inst (
        .aclk(M_AXIS_ACLK),
        .s_axis_a_tdata(b24tofloat_input_data_r),
        .s_axis_a_tready(b24tofloat_rdy_r),
        .s_axis_a_tvalid(b24tofloat_valid_r),
        .m_axis_result_tdata(b24tofloat_output_data_r),
        .m_axis_result_tvalid(b24tofloat_output_valid_r)
    );
    
    fifo_L_R_float rxfifo_float (
      .clk(M_AXIS_ACLK),                // 
      .din(rx_l_r_float_indata),                
      .full(rx_l_r_float_full),
      .wr_en(rx_l_r_float_wr_en),            // input wire wr_en
      .rd_en(rx_l_r_float_rd_en),            // input wire rd_en
      .dout(rx_l_r_float_outdata),              
      .empty(rx_l_r_float_empty),
      .valid(rx_l_r_float_valid),            // output wire valid
      .data_count(rx_float_count)
      //.wr_data_count(input_fifo_a1_wrcount),
      //.rd_data_count(input_fifo_a1_rdcount)
    );

             
	
	endmodule
