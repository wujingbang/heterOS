`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/30 11:34:54
// Design Name: 
// Module Name: i2s_fifo
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


module i2s_fifo # (
    parameter integer DIRECT_CONNECT = 0,
    parameter integer L_EN_BIGEND = 0,
    parameter integer R_EN_SMALLEND = 1
)(
    input wire clk_100mhz,
    input wire aresetn,
    
    input wire rxfifo_en,
    input wire txfifo_en,
        
    output wire [47:0] FIFORX_DATA,
    output wire [13:0] FIFORX_COUNT,
    output wire FIFORX_VALID,
    output wire FIFORX_OVERFLOW,
    output wire FIFORX_UNDERFLOW,
    input wire FIFORX_RD_EN,
    output wire FIFORX_FULL,
    output wire FIFORX_EMPTY,
    
    input wire [47:0] FIFOTX_DATA,
    output wire [13:0] FIFOTX_COUNT,
    input wire FIFOTX_WR_EN,
    output wire FIFOTX_OVERFLOW,
    output wire FIFOTX_UNDERFLOW,
    output wire FIFOTX_FULL,
    output wire FIFOTX_EMPTY,
    //output wire FIFOTX_VALID,
    
    output wire BCLK,
    output wire LRCLK,
    input wire SDATA_I,
    output wire SDATA_O
    );
    
    reg [10:0] clk_cntr;
    (*mark_debug = "true"*)wire [23:0] rx_ldata;
    (*mark_debug = "true"*)wire [23:0] rx_rdata;
    wire rx_valid;
    wire [47:0] rx_l_r_data;
    
    (*mark_debug = "true"*)wire [23:0] tx_ldata;
    (*mark_debug = "true"*)wire [23:0] tx_rdata;
    wire tx_start_l;
    wire tx_start_r;
    wire [47:0] tx_l_r_data;
    
//    assign rx_l_r_data = {rx_ldata[23:0], rx_rdata[23:0]};
//    assign tx_ldata = tx_l_r_data[47:24];
//    assign tx_rdata = tx_l_r_data[23:0];

    
    generate 
        if (DIRECT_CONNECT == 1) begin//直连
            assign rx_l_r_data = {rx_ldata[23:0], rx_rdata[23:0]};
            assign tx_ldata = rx_ldata[23:0];
            assign tx_rdata = rx_rdata[23:0];
        end else begin


//            assign rx_l_r_data[23:0] = rx_rdata[23:0];
//            assign rx_l_r_data[47:24] = 0;//rx_ldata[23:0];
//            assign tx_ldata = tx_l_r_data[23:0];
//            assign tx_rdata = tx_l_r_data[23:0];//注意，这里直接将数据复制到两个声道

            assign rx_l_r_data[23:0] = rx_ldata[23:0];
            assign rx_l_r_data[47:24] = rx_rdata[23:0]; //接受端的左右声道搞反了，所以这里也反过来
            assign tx_rdata = tx_l_r_data[23:0];
            assign tx_ldata = tx_l_r_data[47:24];
            
//            assign rx_l_r_data[23:0] = rx_rdata[23:0];
//            assign rx_l_r_data[47:24] = rx_ldata[23:0]; 
//            assign tx_rdata = tx_l_r_data[23:0];
//            assign tx_ldata = tx_l_r_data[47:24];
        end 
    endgenerate

//    always @ (*)
//    begin
//        if (rx_ldata > rx_rdata) begin
//            rx_l_r_data[23:0] = rx_ldata[23:0];
//            rx_l_r_data[47:24] = 0;
//        end else begin
//            rx_l_r_data[23:0] = rx_rdata[23:0];
//            rx_l_r_data[47:24] = 0;
//        end
//    end
    
    
    wire dbg_rxfifo_wr_en;
    assign dbg_rxfifo_wr_en = rx_valid && rxfifo_en;
    wire dbg_txfifo_rd_en;
    assign dbg_txfifo_rd_en = tx_start_l && txfifo_en;
    
    
    always @ (posedge clk_100mhz) begin
        if (!aresetn) 
            clk_cntr <= 0;
        else
            clk_cntr <= clk_cntr + 1;
    end
    
//  --sclk = 100MHz / 32 = 3.125 MHz
//  sclk_int <= clk_cntr(4);
//  --lrclk = 100MHz / 2048 = 48.828125 KHz
//  lrclk_int <= clk_cntr(10);
    assign BCLK = clk_cntr[4];
    assign LRCLK = clk_cntr[10];
    
    iis_deser iis_rx_inst(
           .CLK_100MHZ(clk_100mhz),
           .SCLK(BCLK),
           .LRCLK(LRCLK),
           .SDATA(SDATA_I),
           .EN(1),
           .LDATA(rx_ldata),
           .RDATA(rx_rdata),
           .VALID(rx_valid)
    );
    
  	iis_ser iis_tx_inst(
           .CLK_100MHZ(clk_100mhz),
           .SCLK(BCLK),
           .LRCLK(LRCLK),
           .SDATA(SDATA_O),
           .EN(1),
           .LDATA(tx_ldata),
           .RDATA(tx_rdata),
           .START_L(tx_start_l),
           .START_R(tx_start_r)
	);
	
    fifo_L_R rxfifo (
      .clk(clk_100mhz),                // input wire clk
      .srst(!aresetn),
      .din(rx_l_r_data),                // input wire [31 : 0] din
      .full(FIFORX_FULL),
      .wr_en(rx_valid && rxfifo_en),            // input wire wr_en
      .rd_en(FIFORX_RD_EN),            // input wire rd_en
      .dout(FIFORX_DATA),              // output wire [31 : 0] dout
      .empty(FIFORX_EMPTY),
      .overflow(FIFORX_OVERFLOW),              // output wire full
      .underflow(FIFORX_UNDERFLOW),            // output wire empty
      .valid(FIFORX_VALID),            // output wire valid
      .data_count(FIFORX_COUNT)
      //.wr_data_count(input_fifo_a1_wrcount),
      //.rd_data_count(input_fifo_a1_rdcount)
    );

    fifo_L_R txfifo (
      .clk(clk_100mhz),                // input wire clk
      .srst(!aresetn),
      .din(FIFOTX_DATA),                // input wire [31 : 0] din
      .full(FIFOTX_FULL),
      .wr_en(FIFOTX_WR_EN),            // input wire wr_en
      .rd_en(tx_start_l && txfifo_en),            // input wire rd_en
      .dout(tx_l_r_data),              // output wire [31 : 0] dout
      .empty(FIFOTX_EMPTY),
      .overflow(FIFOTX_OVERFLOW),              // output wire full
      .underflow(FIFOTX_UNDERFLOW),            // output wire empty
      //.valid(FIFOTX_VALID),            // output wire valid
      .data_count(FIFOTX_COUNT)
      //.wr_data_count(input_fifo_a1_wrcount),
      //.rd_data_count(input_fifo_a1_rdcount)
    );
endmodule
