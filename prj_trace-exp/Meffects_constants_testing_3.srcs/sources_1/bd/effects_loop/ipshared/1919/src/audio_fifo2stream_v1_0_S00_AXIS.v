
`timescale 1 ns / 1 ps

	module audio_fifo2stream_v1_0_S00_AXIS #
	(
		// Users to add parameters here
        // Total number of input data.
        parameter integer NUMBER_OF_INPUT_WORDS  = 1024,
		// User parameters ends
		// Do not modify the parameters beyond this line

		// AXI4Stream sink: Data Width
		parameter integer TDATA_WIDTH	= 64
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
        output reg [47:0] FIFOTX_DATA,
        output reg FIFOTX_WR_EN,
        input wire FIFOTX_FULL,
        input wire FIFOTX_EMPTY,
        
		// AXI4Stream sink: Clock
		input wire  S_AXIS_ACLK,
		// AXI4Stream sink: Reset
		input wire  S_AXIS_ARESETN,
		// Ready to accept data in
		output wire  S_AXIS_TREADY,
		// Data in
		input wire [TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
		// Byte qualifier
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


	// bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
	localparam bit_num  = clogb2(NUMBER_OF_INPUT_WORDS-1);

	reg [3:0] aclk_state;
	reg [3:0] aclk_next;
    reg [2:0] float2b24_state;

	
    wire EOL_IN;
    wire VALID_IN;
    reg  READY_OUT;
    reg XFER_SI;

	reg [bit_num-1:0] write_pointer;
	
    reg [31:0] float2b24_input_data;
    wire float2b24_rdy;
    reg float2b24_valid;
    wire [23:0] float2b24_output_data;
    wire float2b24_output_valid;
    
    reg [63:0] tx_l_r_float_indata;
    wire tx_l_r_float_full;
    reg tx_l_r_float_wr_en;
    reg tx_l_r_float_rd_en;
    wire [63:0] tx_l_r_float_outdata;
    wire tx_l_r_float_empty;
    wire tx_l_r_float_valid;
    
    wire  [13:0] tx_float_count;
	
    assign EOL_IN = S_AXIS_TLAST;
    assign VALID_IN = S_AXIS_TVALID;
    assign S_AXIS_TREADY = READY_OUT;
    
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!currently we only process R channel.
    //From CPU 32bits IEEE754 single floating, to ADAU1761 24bits data
    //TX_FLOAT_FIFO to RXFIFO,
    always @ (posedge S_AXIS_ACLK)
    begin
        if (S_AXIS_ARESETN == 0) begin
            float2b24_state <= 0;
            FIFOTX_WR_EN <= 0;
            float2b24_valid <= 0;
            tx_l_r_float_rd_en <= 0;
        end else begin
            case (float2b24_state)
                0: begin
                    FIFOTX_WR_EN <= 0;
                    if (tx_l_r_float_valid && float2b24_rdy) begin
                        float2b24_input_data <= tx_l_r_float_outdata[31:0];
                        tx_l_r_float_rd_en <= 1;
                        float2b24_valid <= 1;
                        float2b24_state <= 1;
                    end else begin
                        tx_l_r_float_rd_en <= 0;
                        float2b24_valid <= 0;
                        float2b24_state <= 0;
                    end
                end
                1: begin
                    tx_l_r_float_rd_en <= 0;
                    float2b24_valid <= 0;
                    if (float2b24_output_valid) begin
                        FIFOTX_DATA[23:0] <= float2b24_output_data;
                        FIFOTX_WR_EN <= 1;
                        float2b24_state <= 0;
                    end else begin
                        FIFOTX_WR_EN <= 0;
                        float2b24_state <= 1;
                    end
                end
            endcase
        end
    end

    parameter C_STATE_IDLE   = 0,
               C_STATE_A0   = 1,
               C_STATE_A0_LAST = 2,
               C_STATE_ERROR  = 3;
    
    always @ (*)
    begin
        if ( aclk_state == C_STATE_ERROR || 
                            aclk_next == C_STATE_ERROR ) begin
            READY_OUT = 0;
            XFER_SI = 0;
        end else if (!tx_l_r_float_full) begin//
            READY_OUT = 1;
            XFER_SI = VALID_IN;
        end else begin
            READY_OUT = 0;
            XFER_SI = 0;
        end
    end
    
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
    
//    always @(*) begin
//        if ( FIFOTX_FULL || !VALID_IN || !READY_OUT || aclk_state == C_STATE_ERROR || aclk_next == C_STATE_ERROR) begin
//            FIFOTX_DATA = 0;
//            FIFOTX_WR_EN = 0;
//        end else if (aclk_next == C_STATE_A0 || aclk_next == C_STATE_A0_LAST) begin
//            FIFOTX_DATA = S_AXIS_TDATA[47:0];
//            FIFOTX_WR_EN = 1;
//        end else begin
//            FIFOTX_DATA = 0;
//            FIFOTX_WR_EN = 0;
//        end
//    end

    always @(*) begin
        if ( tx_l_r_float_full || !VALID_IN || !READY_OUT || aclk_state == C_STATE_ERROR || aclk_next == C_STATE_ERROR) begin
            tx_l_r_float_indata = 0;
            tx_l_r_float_wr_en = 0;
        end else if (aclk_next == C_STATE_A0 || aclk_next == C_STATE_A0_LAST) begin
            tx_l_r_float_indata = S_AXIS_TDATA;
            tx_l_r_float_wr_en = 1;
        end else begin
            tx_l_r_float_indata = 0;
            tx_l_r_float_wr_en = 0;
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
            if ( VALID_IN && !tx_l_r_float_full)
                aclk_next = C_STATE_A0;
            else 
                aclk_next = C_STATE_IDLE;
        end
        C_STATE_A0: begin
            if (VALID_IN && !tx_l_r_float_full)
                if (write_pointer == NUMBER_OF_INPUT_WORDS - 1) 
                    aclk_next = C_STATE_A0_LAST;
                else
                    aclk_next = C_STATE_A0;
            else
                aclk_next = C_STATE_A0;
        end
        C_STATE_A0_LAST: begin
            aclk_next = C_STATE_IDLE;
        end
        C_STATE_ERROR: aclk_next = C_STATE_IDLE;
        default: aclk_next = C_STATE_ERROR;
      endcase
    end
    
    always @ (posedge S_AXIS_ACLK)
    begin
        if ( !S_AXIS_ARESETN ) begin

        end else begin
            case (aclk_next)
                C_STATE_IDLE: begin

                end

                C_STATE_ERROR: begin

                end
            endcase
        end
    end
    
    float_to_b24 float_to_b24_inst (
        .aclk(S_AXIS_ACLK),
        .s_axis_a_tdata(float2b24_input_data),
        .s_axis_a_tready(float2b24_rdy),
        .s_axis_a_tvalid(float2b24_valid),
        .m_axis_result_tdata(float2b24_output_data),
        .m_axis_result_tvalid(float2b24_output_valid)
    );
    
    fifo_L_R_float txfifo_float (
      .clk(S_AXIS_ACLK),                // 
      .din(tx_l_r_float_indata),                
      .full(tx_l_r_float_full),
      .wr_en(tx_l_r_float_wr_en),            // input wire wr_en
      .rd_en(tx_l_r_float_rd_en),            // input wire rd_en
      .dout(tx_l_r_float_outdata),              
      .empty(tx_l_r_float_empty),
      .valid(tx_l_r_float_valid),            // output wire valid
      .data_count(tx_float_count)
      //.wr_data_count(input_fifo_a1_wrcount),
      //.rd_data_count(input_fifo_a1_rdcount)
    );

//	// Define the states of state machine
//	// The control state machine oversees the writing of input streaming data to the FIFO,
//	// and outputs the streaming data from the FIFO
//	parameter [1:0] IDLE = 1'b0,        // This is the initial/idle state 

//	                WRITE_FIFO  = 1'b1; // In this state FIFO is written with the
//	                                    // input stream data S_AXIS_TDATA 
//	wire  	axis_tready;
//	// State variable
//	reg mst_exec_state;  
//	// FIFO implementation signals
//	genvar byte_index;     
//	// FIFO write enable
//	wire fifo_wren;
//	// FIFO full flag
//	reg fifo_full_flag;
//	// FIFO write pointer
//	reg [bit_num-1:0] write_pointer;
//	// sink has accepted all the streaming data and stored in FIFO
//	  reg writes_done;
//	// I/O Connections assignments

//	assign S_AXIS_TREADY	= axis_tready;
//	// Control state machine implementation
//	always @(posedge S_AXIS_ACLK) 
//	begin  
//	  if (!S_AXIS_ARESETN) 
//	  // Synchronous reset (active low)
//	    begin
//	      mst_exec_state <= IDLE;
//	    end  
//	  else
//	    case (mst_exec_state)
//	      IDLE: 
//	        // The sink starts accepting tdata when 
//	        // there tvalid is asserted to mark the
//	        // presence of valid streaming data 
//	          if (S_AXIS_TVALID)
//	            begin
//	              mst_exec_state <= WRITE_FIFO;
//	            end
//	          else
//	            begin
//	              mst_exec_state <= IDLE;
//	            end
//	      WRITE_FIFO: 
//	        // When the sink has accepted all the streaming input data,
//	        // the interface swiches functionality to a streaming master
//	        if (writes_done)
//	          begin
//	            mst_exec_state <= IDLE;
//	          end
//	        else
//	          begin
//	            // The sink accepts and stores tdata 
//	            // into FIFO
//	            mst_exec_state <= WRITE_FIFO;
//	          end

//	    endcase
//	end
//	// AXI Streaming Sink 
//	// 
//	// The example design sink is always ready to accept the S_AXIS_TDATA  until
//	// the FIFO is not filled with NUMBER_OF_INPUT_WORDS number of input words.
//	assign axis_tready = ((mst_exec_state == WRITE_FIFO) && (write_pointer <= NUMBER_OF_INPUT_WORDS-1));

//	always@(posedge S_AXIS_ACLK)
//	begin
//	  if(!S_AXIS_ARESETN)
//	    begin
//	      write_pointer <= 0;
//	      writes_done <= 1'b0;
//	    end  
//	  else
//	    if (write_pointer <= NUMBER_OF_INPUT_WORDS-1)
//	      begin
//	        if (fifo_wren)
//	          begin
//	            // write pointer is incremented after every write to the FIFO
//	            // when FIFO write signal is enabled.
//	            write_pointer <= write_pointer + 1;
//	            writes_done <= 1'b0;
//	          end
//	          if ((write_pointer == NUMBER_OF_INPUT_WORDS-1)|| S_AXIS_TLAST)
//	            begin
//	              // reads_done is asserted when NUMBER_OF_INPUT_WORDS numbers of streaming data 
//	              // has been written to the FIFO which is also marked by S_AXIS_TLAST(kept for optional usage).
//	              writes_done <= 1'b1;
//	            end
//	      end  
//	end

//	// FIFO write enable generation
//	assign fifo_wren = S_AXIS_TVALID && axis_tready;
//    assign FIFOTX_WR_EN = fifo_wren;
    

//    // Streaming input data is stored in FIFO

//    always @( posedge S_AXIS_ACLK )
//    begin
//      if (fifo_wren)// && S_AXIS_TSTRB[byte_index])
//        begin
//          FIFOTX_DATA[47:0] <= S_AXIS_TDATA[47:0];
//        end  
//    end  


//	// Add user logic here

//	// User logic ends

	endmodule
