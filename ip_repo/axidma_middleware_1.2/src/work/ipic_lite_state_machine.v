`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 15:08:15
// Design Name: 
// Module Name: ipic_lite_state_machine
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

(* DONT_TOUCH = "yes" *)
module ipic_lite_state_machine#(
        parameter integer DMA_MM2S_ADDR_BASE = 32'h41E00000,
        parameter integer DMA_S2MM_ADDR_BASE = 32'h40400000,
        parameter integer DESC_IRQ_FLAG_POS = 16,
        parameter integer DEVICE_NUMBER = 4,
        parameter integer ADDR_WIDTH = 32,
        parameter integer DATA_WIDTH = 32,
        parameter integer C_LENGTH_WIDTH = 14
)
(
        //clk
        input wire clk,
        input wire reset_n,
        
        //irq_in
        (*mark_debug = "true"*)input wire irq_s2mm_in,
        (*mark_debug = "true"*)input wire irq_mm2s_in,
        
        output reg axis_aclken,
        (*mark_debug = "true"*)output reg [3:0] axis_tdest_mm2s,
        (*mark_debug = "true"*)output reg [15:0] axis_tdest_s2mm,
        
        //  IP Master Request/Qualifers
        output     reg                     ip2bus_mstrd_req,
        output  reg                     ip2bus_mstwr_req,
        output     reg     [ADDR_WIDTH-1 : 0]                ip2bus_mst_addr,
        output     reg     [(DATA_WIDTH/8)-1 : 0]     ip2bus_mst_be,
        output  reg                     ip2bus_mst_lock,
        output     reg                     ip2bus_mst_reset,
        //  IP Request Status Reply  
        input     wire                     bus2ip_mst_cmdack,
        input   wire                     bus2ip_mst_cmplt,
        input   wire                     bus2ip_mst_error,
        input   wire                     bus2ip_mst_rearbitrate,
        input   wire                     bus2ip_mst_cmd_timeout,
        //  IPIC Read data
        input     wire     [DATA_WIDTH-1 : 0]        bus2ip_mstrd_d,
        input     wire                     bus2ip_mstrd_src_rdy_n,
        //  IPIC Write data
        output     reg     [DATA_WIDTH-1 : 0]        ip2bus_mstwr_d,
        input     wire                     bus2ip_mstwr_dst_rdy_n,     
        //USER LOGIC
        input wire [DEVICE_NUMBER-1:0] rd_channel_valid,
        input wire [DEVICE_NUMBER-1:0] mm2s_dma_valid,
        input wire [DEVICE_NUMBER-1:0] s2mm_dma_ready,
        
        output reg descfifo_rd_en,
        input wire descfifo_empty,
        input wire descfifo_valid,
        input wire [127:0] descfifo_dout,
        
        output reg descfifo_trans_wr_en,
        input wire descfifo_trans_full,
        output reg [127:0] descfifo_trans_din,
    
        output reg [DATA_WIDTH-1 : 0] single_read_data
        
//        input wire [2:0]ipic_type_dp, //desc processor
//        input wire ipic_start_dp,
//        output reg ipic_ack_dp,
//        output reg ipic_done_dp,
//        input wire [ADDR_WIDTH-1 : 0] read_addr_dp,
//        input wire [ADDR_WIDTH-1 : 0] write_addr_dp,
//        input wire [DATA_WIDTH-1 : 0] write_data_dp,

//        input wire [2:0]ipic_type_tc, //tdma control
//        input wire ipic_start_tc,
//        output reg ipic_ack_tc,
//        output reg ipic_done_tc,
//        input wire [ADDR_WIDTH-1 : 0] read_addr_tc,
//        input wire [ADDR_WIDTH-1 : 0] write_addr_tc,
//        input wire [DATA_WIDTH-1 : 0] write_data_tc,        
        // Output current State.
            
    );
    
    //DEVICE_TO_DMA: s2mm
    localparam FIFOWIDTH=4;
    localparam INADDR_WORDPOS=0, OUTADDR_WORDPOS=1, OPCODE_WORDPOS=2, DESCADDR_WORDPOS=3;
    
    localparam CMD_RW_BIT_S=0, CMD_RW_BIT_E=1,
                CMD_LEN_BIT_S=2, CMD_LEN_BIT_E=17,
                CMD_CH_BIT_S=18, CMD_CH_BIT_E=21;
    
    
    `define S2MM_FLAG   2'b00
    `define MM2S_FLAG   2'b01
    `define RWBOTH_FLAG 2'b10
    `define TEST_FLAG   2'b11
    
    //-----------------------------------------------------------------------------------------
    //--IPIC transaction state machine:
    ////0: single read transaction
    ////1: single write transaction
    //-----------------------------------------------------------------------------------------
    `define SINGLE_RD 0
    `define SINGLE_WR 1
//    `define RD_IRQ_S2MM 2
//    `define RD_IRQ_MM2S 3
//    `define CLR_IRQ_S2MM 4
//    `define CLR_IRQ_MM2S 5
    
    reg [31:0] desc_inaddr;
    reg [31:0] desc_outaddr;
    reg [31:0] desc_cmd;
    reg [31:0] desc_addr;
    
//    reg [31:0] desc_inaddr_s2mm;
    reg [31:0] desc_outaddr_s2mm;
    reg [31:0] desc_cmd_s2mm;
    reg [31:0] desc_addr_s2mm;
    
    reg [31:0] desc_inaddr_mm2s;
//    reg [31:0] desc_outaddr_mm2s;
    reg [31:0] desc_cmd_mm2s;
    reg [31:0] desc_addr_mm2s;
    
    (*mark_debug = "true"*)reg [2:0]ipic_type;
    (*mark_debug = "true"*)reg ipic_start;
    (*mark_debug = "true"*)reg ipic_done;
    reg [ADDR_WIDTH-1 : 0] read_addr;
    reg [ADDR_WIDTH-1 : 0] write_addr;
    reg [DATA_WIDTH-1 : 0] write_data;

    reg[2:0] ipic_type_mm2s;
    reg[ADDR_WIDTH-1 : 0] read_addr_mm2s;
    reg[ADDR_WIDTH-1 : 0] write_addr_mm2s;
    reg[DATA_WIDTH-1 : 0] write_data_mm2s;
    reg ipic_start_mm2s;
    reg ipic_ack_mm2s;
    reg ipic_done_mm2s;
    
    reg[2:0] ipic_type_s2mm;
    reg[ADDR_WIDTH-1 : 0] read_addr_s2mm;
    reg[ADDR_WIDTH-1 : 0] write_addr_s2mm;
    reg[DATA_WIDTH-1 : 0] write_data_s2mm;
    reg ipic_start_s2mm;
    reg ipic_ack_s2mm;
    reg ipic_done_s2mm;
    
    reg[2:0] ipic_type_disp;
    reg[ADDR_WIDTH-1 : 0] write_addr_disp;
    reg[DATA_WIDTH-1 : 0] write_data_disp;
    reg ipic_start_disp;
    reg ipic_ack_disp;
    reg ipic_done_disp;
    
    reg s2mm_start;
    reg mm2s_start;
    reg s2mm_working;
    reg mm2s_working;
    reg s2mm_done;
    reg mm2s_done;
    
    (*mark_debug = "true"*)reg [3:0] curr_ipic_state;
    reg [3:0] next_ipic_state;

    (*mark_debug = "true"*)reg [3:0] curr_dispatch_state;
    reg [3:0] next_dispatch_state;  
    
    (*mark_debug = "true"*)reg [5:0] curr_mm2s_state;
    reg [5:0] next_mm2s_state;  
    (*mark_debug = "true"*)reg [5:0] curr_s2mm_state;
    reg [5:0] next_s2mm_state;
    
    (*mark_debug = "true"*)reg [2:0] select_channel;
    
//    (*mark_debug = "true"*)reg rdboth_flag;
    
    localparam DISP_IDLE=0, DISP_RD_FIFO=1,DISP_DISPATCH=2, 
                DISP_S2MM_START=3, DISP_S2MM_WAIT=4,
                DISP_MM2S_START=5, DISP_MM2S_WAIT=6,
                //DISP_SEND_IRQ_0 = 7, DISP_SEND_IRQ_WAIT=8,
                DISP_S2MM_CHECK=7, DISP_S2MM_RESTORE=8,
                DISP_ERROR=9;

always @ (posedge clk)
begin
    if ( reset_n == 0 )
        curr_dispatch_state <= DISP_IDLE;
    else
        curr_dispatch_state <= next_dispatch_state;
end

always @ (*)//process_line_starting or ipic_done_wire or curr_process_state)
begin
    case (curr_dispatch_state)
        DISP_IDLE:
            if (descfifo_valid)
                next_dispatch_state <= DISP_RD_FIFO;
            else
                next_dispatch_state <= DISP_IDLE;
        DISP_RD_FIFO: next_dispatch_state <= DISP_DISPATCH;
        DISP_DISPATCH: 
            if (desc_cmd[CMD_RW_BIT_E:CMD_RW_BIT_S] == `S2MM_FLAG || desc_cmd[CMD_RW_BIT_E:CMD_RW_BIT_S] == `RWBOTH_FLAG)
                next_dispatch_state <= DISP_S2MM_CHECK;
            else if (desc_cmd[CMD_RW_BIT_E:CMD_RW_BIT_S] == `MM2S_FLAG)
                next_dispatch_state <= DISP_MM2S_WAIT;
            else if (desc_cmd[CMD_RW_BIT_E:CMD_RW_BIT_S] == `TEST_FLAG)
                next_dispatch_state <= DISP_IDLE;
            else
                next_dispatch_state <= DISP_ERROR;
        DISP_S2MM_CHECK: 
            if (rd_channel_valid[select_channel] == 0) 
                next_dispatch_state <= DISP_S2MM_RESTORE;
            else
                next_dispatch_state <= DISP_S2MM_WAIT;
        DISP_S2MM_RESTORE:
            next_dispatch_state <= DISP_IDLE;
                
        DISP_S2MM_WAIT:
			if (!s2mm_working)
				next_dispatch_state <= DISP_S2MM_START;
			else
				next_dispatch_state <= DISP_S2MM_WAIT;
        DISP_S2MM_START: next_dispatch_state <= DISP_IDLE;
        
        DISP_MM2S_WAIT:
			if (!mm2s_working)
				next_dispatch_state <= DISP_MM2S_START;
			else
				next_dispatch_state <= DISP_MM2S_WAIT;
        DISP_MM2S_START: next_dispatch_state <= DISP_IDLE;

        default: begin
            next_dispatch_state <= DISP_ERROR;
        end
    endcase
end


always @ (posedge clk)
begin
    if (reset_n == 0)
    begin
        descfifo_rd_en <= 0;
        descfifo_trans_wr_en <= 0;
//        rdboth_flag <= 0;
    end
    else
    begin
        case (next_dispatch_state)
        DISP_IDLE: begin
            descfifo_rd_en <= 0;
//            rdboth_flag <= 0;
			
			s2mm_start <= 0;
			mm2s_start <= 0;
			ipic_start_disp <= 0;
			descfifo_trans_wr_en <= 0;
        end
        DISP_RD_FIFO: begin
            descfifo_rd_en <= 1;
            desc_inaddr <= descfifo_dout[((FIFOWIDTH-INADDR_WORDPOS)*32 -1) -: 32];
            desc_outaddr <= descfifo_dout[((FIFOWIDTH-OUTADDR_WORDPOS)*32 -1) -: 32];
            desc_cmd <= descfifo_dout[((FIFOWIDTH-OPCODE_WORDPOS)*32 -1) -: 32];
            desc_addr <= descfifo_dout[((FIFOWIDTH-DESCADDR_WORDPOS)*32 -1) -: 32];
            descfifo_trans_din <= descfifo_dout;
        end
        DISP_DISPATCH: begin
//            if (desc_cmd[CMD_RW_BIT_E:CMD_RW_BIT_S] == `RWBOTH_FLAG)
//                rdboth_flag <= 1;
//            else
//                rdboth_flag <= 0;
            select_channel <= desc_cmd[CMD_CH_BIT_E:CMD_CH_BIT_S];
            descfifo_rd_en <= 0;
        end
        DISP_S2MM_CHECK: begin
        
        end
        DISP_S2MM_RESTORE: begin
            descfifo_trans_wr_en <= 1;
       
        end
        
        DISP_S2MM_START:  begin
			s2mm_start <= 1;
		end
		
		
        DISP_MM2S_START: begin
			mm2s_start <= 1;
		end


        default: begin
        end
        endcase
    end
end


    localparam S2MM_IDLE=0, 
                S2MM_WRADDR=1,S2MM_WRADDR_WAIT=2, S2MM_WRADDR_END=3,
                S2MM_RDS2MM_DMACR=4, S2MM_RDS2MM_DMACR_WAIT=5, S2MM_RDS2MM_DMACR_END=6,
                S2MM_WRS2MM_DMACR=7, S2MM_WRS2MM_DMACR_WAIT=8, S2MM_WRS2MM_DMACR_END=9,
                S2MM_WRS2MM_LENGTH=10, S2MM_WRS2MM_LENGTH_WAIT=11, S2MM_WRS2MM_LENGTH_END=12,
                S2MM_WAIT_IRQ=13, S2MM_GET_IRQ=14, S2MM_GET_IRQ_WAIT=15, S2MM_GET_IRQ_END=16, 
                S2MM_CLR_IRQ=17, S2MM_CLR_IRQ_WAIT=18, S2MM_CLR_IRQ_END=19, 
                S2MM_CLR_IRQ_CHECK=20,
                S2MM_SEND_IRQ=21, S2MM_SEND_IRQ_WAIT=22, S2MM_SEND_IRQ_END=23, 
                S2MM_DONE=24,

                S2MM_ERROR=31;

always @ (posedge clk)
begin
    if ( reset_n == 0 )
        curr_s2mm_state <= S2MM_IDLE;
    else
        curr_s2mm_state <= next_s2mm_state;
end

always @ (*)//process_line_starting or ipic_done_wire or curr_process_state)
begin
    case (curr_s2mm_state)
        S2MM_IDLE:
            if (s2mm_start)
                next_s2mm_state <= S2MM_WRADDR;
            else
                next_s2mm_state <= S2MM_IDLE;

        S2MM_WRADDR: next_s2mm_state <= S2MM_WRADDR_WAIT;
        S2MM_WRADDR_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_WRADDR_END;
            else
                next_s2mm_state <= S2MM_WRADDR_WAIT;
        S2MM_WRADDR_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_RDS2MM_DMACR;
            else
                next_s2mm_state <= S2MM_WRADDR_END;
        S2MM_RDS2MM_DMACR: next_s2mm_state <= S2MM_RDS2MM_DMACR_WAIT;
        S2MM_RDS2MM_DMACR_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_RDS2MM_DMACR_END;
            else
                next_s2mm_state <= S2MM_RDS2MM_DMACR_WAIT;
        S2MM_RDS2MM_DMACR_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_WRS2MM_DMACR;
            else
                next_s2mm_state <= S2MM_RDS2MM_DMACR_END;
        S2MM_WRS2MM_DMACR: next_s2mm_state <= S2MM_WRS2MM_DMACR_WAIT;
        S2MM_WRS2MM_DMACR_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_WRS2MM_DMACR_END;
            else
                next_s2mm_state <= S2MM_WRS2MM_DMACR_WAIT;
        S2MM_WRS2MM_DMACR_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_WRS2MM_LENGTH;
            else
                next_s2mm_state <= S2MM_WRS2MM_DMACR_END;
        S2MM_WRS2MM_LENGTH: next_s2mm_state <= S2MM_WRS2MM_LENGTH_WAIT;
        S2MM_WRS2MM_LENGTH_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_WRS2MM_LENGTH_END;
            else
                next_s2mm_state <= S2MM_WRS2MM_LENGTH_WAIT;
        S2MM_WRS2MM_LENGTH_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_WAIT_IRQ;
            else
                next_s2mm_state <= S2MM_WRS2MM_LENGTH_END;
        S2MM_WAIT_IRQ:
            if (irq_s2mm_in)
                next_s2mm_state <= S2MM_GET_IRQ;
            else
                next_s2mm_state <= S2MM_WAIT_IRQ;
        S2MM_GET_IRQ: next_s2mm_state <= S2MM_GET_IRQ_WAIT;
        S2MM_GET_IRQ_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_GET_IRQ_END;
            else
                next_s2mm_state <= S2MM_GET_IRQ_WAIT;
        S2MM_GET_IRQ_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_CLR_IRQ;
            else
                next_s2mm_state <= S2MM_GET_IRQ_END;
        S2MM_CLR_IRQ: next_s2mm_state <= S2MM_CLR_IRQ_WAIT;
        S2MM_CLR_IRQ_WAIT: 
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_CLR_IRQ_END;
            else
                next_s2mm_state <= S2MM_CLR_IRQ_WAIT;
        S2MM_CLR_IRQ_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_CLR_IRQ_CHECK;
            else
                next_s2mm_state <= S2MM_CLR_IRQ_END;
        S2MM_CLR_IRQ_CHECK:
            if (single_read_data & 32'h4000)
                next_s2mm_state <= S2MM_ERROR;
            else if (!irq_s2mm_in && !s2mm_dma_ready[select_channel])
                next_s2mm_state <= S2MM_SEND_IRQ;
            else
                next_s2mm_state <= S2MM_CLR_IRQ_CHECK;

        S2MM_SEND_IRQ: next_s2mm_state <= S2MM_SEND_IRQ_WAIT;
        S2MM_SEND_IRQ_WAIT:
            if (ipic_ack_s2mm)
                next_s2mm_state <= S2MM_SEND_IRQ_END;
            else
                next_s2mm_state <= S2MM_SEND_IRQ_WAIT;
        S2MM_SEND_IRQ_END:
            if (ipic_done_s2mm)
                next_s2mm_state <= S2MM_DONE;
            else
                next_s2mm_state <= S2MM_SEND_IRQ_END;

        S2MM_DONE: next_s2mm_state <= S2MM_IDLE;
        default: begin
            next_s2mm_state <= S2MM_ERROR;
        end
    endcase
end


always @ (posedge clk)
begin
    if (reset_n == 0)
    begin
        axis_aclken <= 0;
        s2mm_working <= 0;
    end
    else
    begin
        case (next_s2mm_state)
        S2MM_IDLE: begin
            s2mm_done <= 0;
            axis_aclken <= 0;
            axis_tdest_s2mm <= 16'hffff;
            s2mm_working <= 0;
        end

        S2MM_WRADDR: begin
//            desc_inaddr_s2mm <= desc_inaddr;
            desc_outaddr_s2mm <= desc_outaddr;
            desc_cmd_s2mm <= desc_cmd;
            desc_addr_s2mm <= desc_addr;
        
            s2mm_working <= 1;
            axis_tdest_s2mm <= desc_cmd[CMD_CH_BIT_E:CMD_CH_BIT_S];
            //read_addr_s2mm <= read_addr_s2mm_tc;
            write_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h48;
            write_data_s2mm <= desc_outaddr;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_WR;
        end
        S2MM_WRADDR_END: begin
            ipic_start_s2mm <= 0;
        end
        S2MM_RDS2MM_DMACR: begin
            read_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h30;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_RD;
        end
        S2MM_RDS2MM_DMACR_END: begin
            ipic_start_s2mm <= 0;
        end
        S2MM_WRS2MM_DMACR: begin
            write_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h30;
            write_data_s2mm <= single_read_data | 32'b1;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_WR;
        end
        S2MM_WRS2MM_DMACR_END: begin
            ipic_start_s2mm <= 0;
        end
        S2MM_WRS2MM_LENGTH: begin
            write_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h58;
            write_data_s2mm <= desc_cmd_s2mm[CMD_LEN_BIT_E:CMD_LEN_BIT_S];
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_WR;
        end
        S2MM_WRS2MM_LENGTH_END: begin
            ipic_start_s2mm <= 0;
            axis_aclken <= 1;
        end
        S2MM_WAIT_IRQ: begin
        
        end

        S2MM_GET_IRQ: begin
            read_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h34;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_RD;
        end
        S2MM_GET_IRQ_END: begin
            ipic_start_s2mm <= 0;
        end
        S2MM_CLR_IRQ: begin
            write_addr_s2mm <= DMA_S2MM_ADDR_BASE + 32'h34;
            write_data_s2mm <= single_read_data & 32'h7000;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_WR;
        end
        S2MM_CLR_IRQ_END: begin
            ipic_start_s2mm <= 0;
        end
        S2MM_CLR_IRQ_CHECK: begin

        end
        
        S2MM_SEND_IRQ: begin
            write_addr_s2mm <= desc_addr_s2mm + DESC_IRQ_FLAG_POS;
            write_data_s2mm <= 1;
            ipic_start_s2mm <= 1;
            ipic_type_s2mm <= `SINGLE_WR;
        end
        S2MM_SEND_IRQ_END: begin
            ipic_start_s2mm <= 0;
        end
        
        S2MM_DONE: begin
            s2mm_done <= 1;
            s2mm_working <= 0;
        end

     
        default: begin
        end
        endcase
    end
end

    localparam MM2S_IDLE=0, 
                MM2S_WRADDR=1, MM2S_WRADDR_WAIT=2, MM2S_WRADDR_END=3,
                MM2S_RDMM2S_DMACR=4, MM2S_RDMM2S_DMACR_WAIT=5, MM2S_RDMM2S_DMACR_END=6,
                MM2S_WRMM2S_DMACR=7, MM2S_WRMM2S_DMACR_WAIT=8, MM2S_WRMM2S_DMACR_END=9,
                MM2S_WRMM2S_LENGTH=10, MM2S_WRMM2S_LENGTH_WAIT=11, MM2S_WRMM2S_LENGTH_END=12,
                MM2S_WAIT_IRQ=13, MM2S_GET_IRQ=14, MM2S_GET_IRQ_WAIT=15, MM2S_GET_IRQ_END=16, 
                MM2S_CLR_IRQ=17, MM2S_CLR_IRQ_WAIT=18, MM2S_CLR_IRQ_END=19, MM2S_CLR_IRQ_CHECK=20,
                MM2S_SEND_IRQ=21, MM2S_SEND_IRQ_WAIT=22, MM2S_SEND_IRQ_END=23, 
                MM2S_DONE=24,
                MM2S_ERROR=31;

always @ (posedge clk)
begin
    if ( reset_n == 0 )
        curr_mm2s_state <= MM2S_IDLE;
    else
        curr_mm2s_state <= next_mm2s_state;
end

always @ (*)//process_line_starting or ipic_done_mm2s_wire or curr_process_state)
begin
    case (curr_mm2s_state)
        MM2S_IDLE:
            if (mm2s_start)
                next_mm2s_state <= MM2S_WRADDR;
            else
                next_mm2s_state <= MM2S_IDLE;

        /////////////////////////////////
        ///MM2S
        /////////////////////////////////
        MM2S_WRADDR: next_mm2s_state <= MM2S_WRADDR_WAIT;
        MM2S_WRADDR_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_WRADDR_END;
            else
                next_mm2s_state <= MM2S_WRADDR_WAIT;
        MM2S_WRADDR_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_RDMM2S_DMACR;
            else
                next_mm2s_state <= MM2S_WRADDR_END;
        MM2S_RDMM2S_DMACR: next_mm2s_state <= MM2S_RDMM2S_DMACR_WAIT;
        MM2S_RDMM2S_DMACR_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_RDMM2S_DMACR_END;
            else
                next_mm2s_state <= MM2S_RDMM2S_DMACR_WAIT;
        MM2S_RDMM2S_DMACR_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_WRMM2S_DMACR;
            else
                next_mm2s_state <= MM2S_RDMM2S_DMACR_END;
        MM2S_WRMM2S_DMACR: next_mm2s_state <= MM2S_WRMM2S_DMACR_WAIT;
        MM2S_WRMM2S_DMACR_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_WRMM2S_DMACR_END;
            else
                next_mm2s_state <= MM2S_WRMM2S_DMACR_WAIT;
        MM2S_WRMM2S_DMACR_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_WRMM2S_LENGTH;
            else
                next_mm2s_state <= MM2S_WRMM2S_DMACR_END;
        MM2S_WRMM2S_LENGTH: next_mm2s_state <= MM2S_WRMM2S_LENGTH_WAIT;
        MM2S_WRMM2S_LENGTH_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_WRMM2S_LENGTH_END;
            else
                next_mm2s_state <= MM2S_WRMM2S_LENGTH_WAIT;
        MM2S_WRMM2S_LENGTH_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_WAIT_IRQ;
            else
                next_mm2s_state <= MM2S_WRMM2S_LENGTH_END;
        MM2S_WAIT_IRQ:
            if (irq_mm2s_in)
                next_mm2s_state <= MM2S_GET_IRQ;
            else
                next_mm2s_state <= MM2S_WAIT_IRQ;
        MM2S_GET_IRQ: next_mm2s_state <= MM2S_GET_IRQ_WAIT;
        MM2S_GET_IRQ_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_GET_IRQ_END;
            else
                next_mm2s_state <= MM2S_GET_IRQ_WAIT;
        MM2S_GET_IRQ_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_CLR_IRQ;
            else
                next_mm2s_state <= MM2S_GET_IRQ_END;
        MM2S_CLR_IRQ: next_mm2s_state <= MM2S_CLR_IRQ_WAIT;
        MM2S_CLR_IRQ_WAIT:
            if (ipic_ack_mm2s) 
                next_mm2s_state <= MM2S_CLR_IRQ_END;
            else
                next_mm2s_state <= MM2S_CLR_IRQ_WAIT;
        MM2S_CLR_IRQ_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_CLR_IRQ_CHECK;
            else
                next_mm2s_state <= MM2S_CLR_IRQ_END;
        MM2S_CLR_IRQ_CHECK:
            if (single_read_data & 32'h4000)
                next_mm2s_state <= MM2S_ERROR;
            else if (!irq_mm2s_in && !mm2s_dma_valid[select_channel])
                next_mm2s_state <= MM2S_SEND_IRQ;
            else
                next_mm2s_state <= MM2S_CLR_IRQ_CHECK;
        MM2S_SEND_IRQ: next_mm2s_state <= MM2S_SEND_IRQ_WAIT;
        MM2S_SEND_IRQ_WAIT:
            if (ipic_ack_mm2s)
                next_mm2s_state <= MM2S_SEND_IRQ_END;
            else
                next_mm2s_state <= MM2S_SEND_IRQ_WAIT;
        MM2S_SEND_IRQ_END:
            if (ipic_done_mm2s)
                next_mm2s_state <= MM2S_DONE;
            else
                next_mm2s_state <= MM2S_SEND_IRQ_END;        
        MM2S_DONE: next_mm2s_state <= MM2S_IDLE;
        default: begin
            next_mm2s_state <= MM2S_ERROR;
        end
    endcase
end


always @ (posedge clk)
begin
    if (reset_n == 0)
    begin

        axis_tdest_mm2s <= 0;
        mm2s_working <= 0;
    end
    else
    begin
        case (next_mm2s_state)
        MM2S_IDLE: begin
            mm2s_done <= 0;
            axis_tdest_mm2s <= 0;
            mm2s_working <= 0;
        end

        /////////////////////////////////
        ///MM2S
        /////////////////////////////////
        MM2S_WRADDR: begin
            desc_inaddr_mm2s <= desc_inaddr;
//            desc_outaddr_mm2s <= desc_outaddr;
            desc_cmd_mm2s <= desc_cmd;
            desc_addr_mm2s <= desc_addr;
            
            mm2s_working <= 1;
            axis_tdest_mm2s <= desc_cmd[CMD_CH_BIT_E:CMD_CH_BIT_S];
            //read_addr_mm2s <= read_addr_mm2s_tc;
            write_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h18;
            write_data_mm2s <= desc_inaddr;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_WR;
        end
        MM2S_WRADDR_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_RDMM2S_DMACR: begin
            read_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h00;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_RD;
        end
        MM2S_RDMM2S_DMACR_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_WRMM2S_DMACR: begin
            write_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h00;
            write_data_mm2s <= single_read_data | 32'b1;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_WR;
        end
        MM2S_WRMM2S_DMACR_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_WRMM2S_LENGTH: begin
            write_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h28;
            write_data_mm2s <= desc_cmd_mm2s[CMD_LEN_BIT_E:CMD_LEN_BIT_S];
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_WR;
        end
        MM2S_WRMM2S_LENGTH_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_WAIT_IRQ: begin
        
        end

        MM2S_GET_IRQ: begin
            read_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h04;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_RD;
            
//            if (curr_mm2s_state == S2MM_CLR_IRQ_CHECK)//重复检测到irq，在0414的测试中发现的错误，不清楚原因尝试绕过。
//                re_det_irq_flag <= 1;
//            else
//                re_det_irq_flag <= 0;
        end
        MM2S_GET_IRQ_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_CLR_IRQ: begin
            write_addr_mm2s <= DMA_MM2S_ADDR_BASE + 32'h04;
            write_data_mm2s <= single_read_data & 32'h7000;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_WR;
        end
        MM2S_CLR_IRQ_END: begin
            ipic_start_mm2s <= 0;
        end
        MM2S_CLR_IRQ_CHECK: begin
            
        end
        MM2S_SEND_IRQ: begin
            write_addr_mm2s <= desc_addr_mm2s + DESC_IRQ_FLAG_POS;
            write_data_mm2s <= 1;
            ipic_start_mm2s <= 1;
            ipic_type_mm2s <= `SINGLE_WR;
        end
        MM2S_SEND_IRQ_END: begin
            ipic_start_mm2s <= 0;
        end
        
        MM2S_DONE: begin
            mm2s_done <= 1;
            mm2s_working <= 0;
        end

        default: begin
        end
        endcase
    end
end


    reg [1:0] ipic_start_state;
    reg [2:0] ipic_from;
    localparam FROM_DISP=0, FROM_S2MM=1, FROM_MM2S=2;
          
    always @ (posedge clk)
    begin
        if (reset_n == 0) begin
            ipic_start <= 0;
            ipic_type <= 0;
            read_addr <= 0;
            write_addr <= 0;
            ipic_start_state <= 0;      
            ipic_ack_mm2s <= 0;
            ipic_ack_s2mm <= 0;
            ipic_ack_disp <= 0; 
            ipic_done_mm2s <= 0;
            ipic_done_s2mm <= 0;
            ipic_done_disp <= 0;
        end else begin
            case(ipic_start_state)
                0:begin
                
                    ipic_done_mm2s <= 0;
                    ipic_done_s2mm <= 0;
                    ipic_done_disp <= 0;
                            
                    if (ipic_start_mm2s) begin
                        ipic_type <= ipic_type_mm2s;
                        read_addr <= read_addr_mm2s;
                        write_addr <= write_addr_mm2s;
                        write_data <= write_data_mm2s;
                        ipic_start <= 1;
                        ipic_ack_mm2s <= 1;
                        ipic_start_state <= 1; 
                        ipic_from <= FROM_MM2S;
                    end else if (ipic_start_s2mm) begin
                        ipic_type <= ipic_type_s2mm;
                        read_addr <= read_addr_s2mm;
                        write_addr <= write_addr_s2mm;
                        write_data <= write_data_s2mm;
                        ipic_start <= 1;
                        ipic_ack_s2mm <= 1;  
                        ipic_start_state <= 1; 
                        ipic_from <= FROM_S2MM;
                    end else if (ipic_start_disp) begin
                        ipic_type <= ipic_type_disp;
                        write_addr <= write_addr_disp;
                        write_data <= write_data_disp;
                        ipic_start <= 1;
                        ipic_ack_disp <= 1;  
                        ipic_start_state <= 1;
                        ipic_from <= FROM_DISP;                  
                    end
                end
                1: begin
                    ipic_ack_mm2s <= 0;
                    ipic_ack_s2mm <= 0;
                    ipic_ack_disp <= 0;  
                    ipic_start <= 0;
                    
                    if (ipic_done) begin
                        ipic_start_state <= 0;
                        if (ipic_from == FROM_MM2S) 
                            ipic_done_mm2s <= 1;
                        else if (ipic_from == FROM_S2MM) 
                            ipic_done_s2mm <= 1;
                        else if (ipic_from == FROM_DISP)
                            ipic_done_disp <= 1;
                        else begin
                            ipic_done_mm2s <= 0;
                            ipic_done_s2mm <= 0;
                            ipic_done_disp <= 0;
                        end
                    end else begin
                        ipic_start_state <= 1;
                        ipic_done_mm2s <= 0;
                        ipic_done_s2mm <= 0;
                        ipic_done_disp <= 0;
                     end
                end
                default: begin end
            endcase
        end        
    end
    
    
    localparam IPIC_IDLE=0, IPIC_DISPATCH=1, 
         IPIC_SINGLE_RD_WAIT=2, IPIC_SINGLE_RD_RCV_WAIT=3, IPIC_SINGLE_RD_END=4,
         IPIC_SINGLE_WR_WAIT=5, IPIC_SINGLE_WR_WR_WAIT = 6, IPIC_SINGLE_WR_END=7,
         IPIC_ERROR=15;    
         
    //First Stage of IPIC
    always @ (posedge clk)
    begin
         if ( reset_n == 0 )  
             curr_ipic_state <= IPIC_IDLE;
         else
             curr_ipic_state <= next_ipic_state; 
    end
     
    //Second Stage of IPIC
    always @ (curr_ipic_state)
    begin
        case(curr_ipic_state)
            IPIC_IDLE: begin
                if (ipic_start)
                    next_ipic_state <= IPIC_DISPATCH;
                else
                    next_ipic_state <= IPIC_IDLE;                 
            end
            IPIC_DISPATCH: begin
                case(ipic_type)               
                    `SINGLE_RD: next_ipic_state <= IPIC_SINGLE_RD_WAIT;
                    `SINGLE_WR: next_ipic_state <= IPIC_SINGLE_WR_WAIT;
                    default: next_ipic_state <= IPIC_ERROR;
                endcase
            end          
            
            //--------------------------------------------------------
            // Single Read
            //--------------------------------------------------------
            IPIC_SINGLE_RD_WAIT: begin
                if ( bus2ip_mst_cmdack ) 
                    next_ipic_state <= IPIC_SINGLE_RD_RCV_WAIT;     
                else
                    next_ipic_state <= IPIC_SINGLE_RD_WAIT;
            end
            IPIC_SINGLE_RD_RCV_WAIT: begin
                if ( bus2ip_mst_cmplt )
                    next_ipic_state <= IPIC_SINGLE_RD_END;   
                else
                    next_ipic_state <= IPIC_SINGLE_RD_RCV_WAIT;
            end
            IPIC_SINGLE_RD_END: next_ipic_state <= IPIC_IDLE; 
             //--------------------------------------------------------
             // Single Write
             //--------------------------------------------------------
            IPIC_SINGLE_WR_WAIT: begin
                if (bus2ip_mst_cmdack)
                    next_ipic_state <= IPIC_SINGLE_WR_WR_WAIT; 
                else
                    next_ipic_state <= IPIC_SINGLE_WR_WAIT;
            end
            IPIC_SINGLE_WR_WR_WAIT: begin
                if (bus2ip_mst_cmplt)
                    next_ipic_state <= IPIC_SINGLE_WR_END;
                else
                    next_ipic_state <= IPIC_SINGLE_WR_WR_WAIT;
            end
            IPIC_SINGLE_WR_END: next_ipic_state <= IPIC_IDLE;   

            default: next_ipic_state <= IPIC_ERROR;
    
         endcase
     end

    always @ (posedge clk)
    begin
        if ( reset_n == 0 ) begin
            ip2bus_mstrd_req <= 0; 
            ip2bus_mst_lock <= 0;
            ip2bus_mst_reset <= 0;
            ip2bus_mstwr_req <= 0; 

            ip2bus_mst_be <= 4'b1111;

            single_read_data <= 0;
            ipic_done <= 0;       
        end else begin
            case(next_ipic_state) 
                IPIC_IDLE: ipic_done <= 0; 

                //--------------------------------------------------------
                // Single Read
                //--------------------------------------------------------
                IPIC_SINGLE_RD_WAIT: begin
                    ip2bus_mstrd_req <= 1;
                    ip2bus_mstwr_req <= 0;
                    ip2bus_mst_addr <= read_addr;
                    ip2bus_mst_be <= 4'b1111;
                end
                IPIC_SINGLE_RD_RCV_WAIT: ip2bus_mstrd_req <= 0; 

                IPIC_SINGLE_RD_END: begin
                    single_read_data[DATA_WIDTH-1 : 0] <= bus2ip_mstrd_d[DATA_WIDTH-1 : 0];
                    ipic_done <= 1;
                end

                //--------------------------------------------------------
                // Single Write
                //--------------------------------------------------------
                IPIC_SINGLE_WR_WAIT: begin
                    // assumed the data width is 32.
                    // actually the axi_master_lite ip only 
                    // supports 32bit data width. (PG161)
                    ip2bus_mst_be <= 4'b1111; 
                    // init a write request, load addr and data 
                    ip2bus_mstwr_req <= 1; 
                    ip2bus_mstrd_req <= 0; 
                    ip2bus_mst_addr <= write_addr;
                    ip2bus_mstwr_d <= write_data;
                end
                IPIC_SINGLE_WR_WR_WAIT: ip2bus_mstwr_req <= 0; 
                IPIC_SINGLE_WR_END: ipic_done <= 1;     

                default: begin end                                                     
            endcase
        end //end if      
    end         
         
         
endmodule
