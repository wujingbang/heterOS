-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Apr 15 22:23:35 2024
-- Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               F:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_audio_fifo2stream_v2_0_0/effects_loop_audio_fifo2stream_v2_0_0_stub.vhdl
-- Design      : effects_loop_audio_fifo2stream_v2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity effects_loop_audio_fifo2stream_v2_0_0 is
  Port ( 
    clk_100mhz : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    BCLK : out STD_LOGIC;
    LRCLK : out STD_LOGIC;
    SDATA_I : in STD_LOGIC;
    SDATA_O : out STD_LOGIC;
    s_axi_config_aclk : in STD_LOGIC;
    s_axi_config_aresetn : in STD_LOGIC;
    s_axi_config_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_config_awvalid : in STD_LOGIC;
    s_axi_config_awready : out STD_LOGIC;
    s_axi_config_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_config_wvalid : in STD_LOGIC;
    s_axi_config_wready : out STD_LOGIC;
    s_axi_config_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_bvalid : out STD_LOGIC;
    s_axi_config_bready : in STD_LOGIC;
    s_axi_config_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_config_arvalid : in STD_LOGIC;
    s_axi_config_arready : out STD_LOGIC;
    s_axi_config_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_rvalid : out STD_LOGIC;
    s_axi_config_rready : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC
  );

end effects_loop_audio_fifo2stream_v2_0_0;

architecture stub of effects_loop_audio_fifo2stream_v2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100mhz,aresetn,BCLK,LRCLK,SDATA_I,SDATA_O,s_axi_config_aclk,s_axi_config_aresetn,s_axi_config_awaddr[4:0],s_axi_config_awprot[2:0],s_axi_config_awvalid,s_axi_config_awready,s_axi_config_wdata[31:0],s_axi_config_wstrb[3:0],s_axi_config_wvalid,s_axi_config_wready,s_axi_config_bresp[1:0],s_axi_config_bvalid,s_axi_config_bready,s_axi_config_araddr[4:0],s_axi_config_arprot[2:0],s_axi_config_arvalid,s_axi_config_arready,s_axi_config_rdata[31:0],s_axi_config_rresp[1:0],s_axi_config_rvalid,s_axi_config_rready,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tdata[63:0],s00_axis_tlast,s00_axis_tvalid,m00_axis_aclk,m00_axis_aresetn,m00_axis_tvalid,m00_axis_tdata[63:0],m00_axis_tlast,m00_axis_tready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "audio_fifo2stream_v1_0,Vivado 2019.1";
begin
end;
