
`timescale 1 ns / 1 ps

	module multiply_window_v1_0_S_AXIS #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// AXI4Stream sink: Data Width
		parameter integer C_S_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here
        output wire res_fifo_valid,
        input wire res_fifo_rd_en,
        output wire [31:0] res_fifo_outdata,
		// User ports ends
		// Do not modify the ports beyond this line

		// AXI4Stream sink: Clock
		input wire  S_AXIS_ACLK,
		// AXI4Stream sink: Reset
		input wire  S_AXIS_ARESETN,
		// Ready to accept data in
		output wire  S_AXIS_TREADY,
		// Data in
		input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
		// Byte qualifier
		input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TSTRB,
		// Indicates boundary of last packet
		input wire  S_AXIS_TLAST,
		// Data is in valid
		input wire  S_AXIS_TVALID
	);
	// function called clogb2 that returns an integer which has the 
	// value of the ceiling of the log base 2.
	function integer clogb2 (input integer bit_depth);
	  begin
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
	      bit_depth = bit_depth >> 1;
	  end
	endfunction

	// Total number of input data.
	localparam NUMBER_OF_INPUT_WORDS  = 1024;
	// bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
	localparam bit_num  = clogb2(NUMBER_OF_INPUT_WORDS-1);
	
	(*mark_debug = "true"*)reg [3:0] aclk_state;
	reg [3:0] aclk_next;
	
	(*mark_debug = "true"*)reg [9:0] window_addr;
	(*mark_debug = "true"*)wire [31:0] window_data;
	
	(*mark_debug = "true"*)reg [31:0] multi_a_indata;
    (*mark_debug = "true"*)wire multi_a_rdy;
    (*mark_debug = "true"*)reg multi_a_valid;
    (*mark_debug = "true"*)reg [31:0] multi_b_indata;
    (*mark_debug = "true"*)wire multi_b_rdy;
    (*mark_debug = "true"*)reg multi_b_valid;
    (*mark_debug = "true"*)wire [31:0] multi_outdata;
    (*mark_debug = "true"*)wire multi_valid;

    (*mark_debug = "true"*)reg [31:0] res_fifo_indata;
    (*mark_debug = "true"*)wire res_fifo_full;
    (*mark_debug = "true"*)reg res_fifo_wr_en;
    (*mark_debug = "true"*)wire res_fifo_empty;
    
    wire EOL_IN;
    wire VALID_IN;
    reg  READY_OUT;
    wire XFER_SI;

    assign EOL_IN = S_AXIS_TLAST;
    assign VALID_IN = S_AXIS_TVALID;
    assign S_AXIS_TREADY = READY_OUT;
    assign XFER_SI = VALID_IN & READY_OUT;
    
    (*mark_debug = "true"*)reg [bit_num-1:0] write_pointer;
    
    parameter C_STATE_IDLE   = 0,
               C_STATE_A0_START   = 1,
               C_STATE_A0_WAIT = 2,
               C_STATE_LAST_IDLE = 3,
               C_STATE_LAST_START = 4,
               C_STATE_LAST_WAIT = 5,
               C_STATE_ERROR  = 6;
    
    
    always @ (posedge S_AXIS_ACLK)
    begin
        if (!S_AXIS_ARESETN ) begin
            write_pointer <= 0;
        end else begin  
            if (EOL_IN && XFER_SI) begin
                write_pointer <= 0;
            end else if (XFER_SI) begin
                write_pointer <= write_pointer + 1;
            end
        end
    end
    
    // State machine
    always @(posedge S_AXIS_ACLK) begin
      if (!S_AXIS_ARESETN) begin
        aclk_state <= C_STATE_IDLE;
      end else begin
        aclk_state <= aclk_next;
      end
    end
    
    always @(*) begin
      case (aclk_state) 
        C_STATE_IDLE: begin
            if ( VALID_IN)
                aclk_next = C_STATE_A0_START;
            else 
                aclk_next = C_STATE_IDLE;
        end
        C_STATE_A0_START: aclk_next = C_STATE_A0_WAIT;
        C_STATE_A0_WAIT: begin
            if (multi_valid) begin
                if (write_pointer == NUMBER_OF_INPUT_WORDS - 1)
                    if (VALID_IN)
                        aclk_next = C_STATE_LAST_START;
                    else
                        aclk_next = C_STATE_LAST_IDLE;
                else if (VALID_IN)
                    aclk_next = C_STATE_A0_START;
                else
                    aclk_next = C_STATE_IDLE;
            end else
                aclk_next = C_STATE_A0_WAIT;
        end
        C_STATE_LAST_IDLE:
            if ( VALID_IN)
                aclk_next = C_STATE_LAST_START;
            else 
                aclk_next = C_STATE_LAST_IDLE;
        C_STATE_LAST_START: aclk_next = C_STATE_LAST_WAIT;
        C_STATE_LAST_WAIT: begin
            if (multi_valid) aclk_next = C_STATE_IDLE;
            else aclk_next = C_STATE_LAST_WAIT;
        end

        C_STATE_ERROR: aclk_next = C_STATE_IDLE;
        default: aclk_next = C_STATE_ERROR;
      endcase
    end
    
    always @ (posedge S_AXIS_ACLK)
    begin
        if ( !S_AXIS_ARESETN ) begin
            window_addr <= 0;
            multi_a_valid <= 0;
            multi_b_valid <= 0;
            READY_OUT <= 0;     
        end else begin
            case (aclk_next)
                C_STATE_IDLE: begin
//                    window_addr <= 0;
//                    multi_a_valid <= 0;
//                    multi_b_valid <= 0;
//                    READY_OUT <= 0;
                end
                C_STATE_A0_START: begin
                    READY_OUT <= 1;
                    window_addr <= window_addr + 1;
                    multi_a_indata <= S_AXIS_TDATA[31:0];
                    multi_b_indata <= window_data;
                    multi_a_valid <= 1;
                    multi_b_valid <= 1;
                end
                C_STATE_A0_WAIT: begin
                    READY_OUT <= 0;
                    multi_a_valid <= 0;
                    multi_b_valid <= 0;
                end
                C_STATE_LAST_IDLE: begin
                
                end
                C_STATE_LAST_START: begin
                    READY_OUT <= 1;
                    window_addr <= window_addr + 1;
                    multi_a_indata <= S_AXIS_TDATA[31:0];
                    multi_b_indata <= window_data;
                    multi_a_valid <= 1;
                    multi_b_valid <= 1;
                end
                C_STATE_LAST_WAIT: begin
                    READY_OUT <= 0;
                    window_addr <= 0;
                    multi_a_valid <= 0;
                    multi_b_valid <= 0;
                end
                C_STATE_ERROR: begin

                end
            endcase
        end
    end

    always @ (*)
    begin
        if ( !S_AXIS_ARESETN ) begin
            res_fifo_indata <= 0;
            res_fifo_wr_en <= 0;
        end else begin
            if (multi_valid) begin
                res_fifo_indata <= multi_outdata;
                res_fifo_wr_en <= 1;
            end else begin
                res_fifo_indata <= res_fifo_indata;
                res_fifo_wr_en <= 0;
            end
        end
    end



	// Add user logic here
    window_rom window_rom_inst(
        .clk(S_AXIS_ACLK),
        .a(window_addr),
        .qspo(window_data)//For an asynchronous read(non-registered output), the latency is zero
    );
    
    float_multiply float_multiply_inst (
        .aclk(S_AXIS_ACLK),
        .s_axis_a_tdata(multi_a_indata),
        .s_axis_a_tready(multi_a_rdy),
        .s_axis_a_tvalid(multi_a_valid),
        .s_axis_b_tdata(multi_b_indata),
        .s_axis_b_tready(multi_b_rdy),
        .s_axis_b_tvalid(multi_b_valid),
        .m_axis_result_tdata(multi_outdata),
        .m_axis_result_tvalid(multi_valid)
    );

    fifo_generator_0 fifo_res_inst (
        .clk(S_AXIS_ACLK),                // 
        .din(res_fifo_indata),                
        .full(res_fifo_full),
        .wr_en(res_fifo_wr_en),            // input wire wr_en
        .rd_en(res_fifo_rd_en),            // input wire rd_en
        .dout(res_fifo_outdata),              
        .empty(res_fifo_empty),
        .valid(res_fifo_valid)
    );
	// User logic ends

	endmodule
