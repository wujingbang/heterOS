-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Apr 15 22:22:07 2024
-- Host        : DESKTOP-QTLF06L running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/work/gitea/heterOS/prj_trace-exp/Meffects_constants_testing_3.srcs/sources_1/bd/effects_loop/ip/effects_loop_xbar_9/effects_loop_xbar_9_sim_netlist.vhdl
-- Design      : effects_loop_xbar_9
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr is
  port (
    \gen_tdest_routing.busy_ns\ : out STD_LOGIC;
    \arb_gnt_r_reg[2]_0\ : out STD_LOGIC;
    m_axis_tready_0_sp_1 : out STD_LOGIC;
    \gen_tdest_routing.busy_ns_0\ : out STD_LOGIC;
    \arb_gnt_r_reg[1]_0\ : out STD_LOGIC;
    \gen_tdest_routing.busy_ns_1\ : out STD_LOGIC;
    \arb_gnt_r_reg[0]_0\ : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \gen_tdest_routing.busy_r_reg[0]\ : in STD_LOGIC;
    s_req_suppress : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_routing.busy_r_reg[0]_0\ : in STD_LOGIC;
    \gen_tdest_routing.busy_r_reg[0]_1\ : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_router.busy_r\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr : entity is "axis_switch_v1_1_19_arb_rr";
end effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr is
  signal arb_busy_ns : STD_LOGIC;
  signal arb_busy_r : STD_LOGIC;
  signal \arb_gnt_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \arb_gnt_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \arb_gnt_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \arb_gnt_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \^arb_gnt_r_reg[0]_0\ : STD_LOGIC;
  signal \^arb_gnt_r_reg[1]_0\ : STD_LOGIC;
  signal \^arb_gnt_r_reg[2]_0\ : STD_LOGIC;
  signal \arb_req_i__2\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal arb_req_rot : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal arb_sel_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \arb_sel_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \arb_sel_r[1]_i_1_n_0\ : STD_LOGIC;
  signal barrel_cntr : STD_LOGIC;
  signal barrel_cntr_ns : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \barrel_cntr_reg_n_0_[0]\ : STD_LOGIC;
  signal \barrel_cntr_reg_n_0_[1]\ : STD_LOGIC;
  signal f_mux_return : STD_LOGIC;
  signal m_axis_tready_0_sn_1 : STD_LOGIC;
  signal \m_axis_tvalid[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal port_priority_ns : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal sel_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal valid_i : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of arb_busy_r_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of arb_busy_r_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of arb_busy_r_i_4 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of arb_busy_r_i_5 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of arb_busy_r_i_6 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \arb_gnt_r[2]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \arb_gnt_r[2]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \arb_gnt_r[2]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \arb_gnt_r[2]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \barrel_cntr[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \barrel_cntr[1]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gen_tdest_routing.busy_r[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gen_tdest_routing.busy_r[0]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gen_tdest_routing.busy_r[0]_i_1__1\ : label is "soft_lutpair5";
begin
  \arb_gnt_r_reg[0]_0\ <= \^arb_gnt_r_reg[0]_0\;
  \arb_gnt_r_reg[1]_0\ <= \^arb_gnt_r_reg[1]_0\;
  \arb_gnt_r_reg[2]_0\ <= \^arb_gnt_r_reg[2]_0\;
  m_axis_tready_0_sp_1 <= m_axis_tready_0_sn_1;
arb_busy_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => valid_i,
      I1 => arb_busy_r,
      I2 => m_axis_tready_0_sn_1,
      O => arb_busy_ns
    );
arb_busy_r_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \arb_req_i__2\(2),
      I1 => \arb_req_i__2\(1),
      I2 => \arb_req_i__2\(0),
      O => valid_i
    );
arb_busy_r_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => m_axis_tready(0),
      I1 => \m_axis_tvalid[0]_INST_0_i_1_n_0\,
      I2 => f_mux_return,
      O => m_axis_tready_0_sn_1
    );
arb_busy_r_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => s_req_suppress(2),
      I1 => s_axis_tvalid(2),
      I2 => \^arb_gnt_r_reg[2]_0\,
      I3 => \gen_tdest_routing.busy_r_reg[0]\,
      O => \arb_req_i__2\(2)
    );
arb_busy_r_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => s_req_suppress(1),
      I1 => s_axis_tvalid(1),
      I2 => \^arb_gnt_r_reg[1]_0\,
      I3 => \gen_tdest_routing.busy_r_reg[0]_0\,
      O => \arb_req_i__2\(1)
    );
arb_busy_r_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => s_req_suppress(0),
      I1 => s_axis_tvalid(0),
      I2 => \^arb_gnt_r_reg[0]_0\,
      I3 => \gen_tdest_routing.busy_r_reg[0]_1\,
      O => \arb_req_i__2\(0)
    );
arb_busy_r_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FAC00AC"
    )
        port map (
      I0 => s_axis_tvalid(1),
      I1 => s_axis_tvalid(0),
      I2 => arb_sel_i(0),
      I3 => arb_sel_i(1),
      I4 => s_axis_tvalid(2),
      O => f_mux_return
    );
arb_busy_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => arb_busy_ns,
      Q => arb_busy_r,
      R => areset_r
    );
\arb_gnt_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040404FF04040400"
    )
        port map (
      I0 => sel_i(1),
      I1 => \arb_gnt_r[2]_i_2_n_0\,
      I2 => sel_i(0),
      I3 => areset_r,
      I4 => aclken,
      I5 => \^arb_gnt_r_reg[0]_0\,
      O => \arb_gnt_r[0]_i_1_n_0\
    );
\arb_gnt_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"404040FF40404000"
    )
        port map (
      I0 => sel_i(1),
      I1 => \arb_gnt_r[2]_i_2_n_0\,
      I2 => sel_i(0),
      I3 => areset_r,
      I4 => aclken,
      I5 => \^arb_gnt_r_reg[1]_0\,
      O => \arb_gnt_r[1]_i_1_n_0\
    );
\arb_gnt_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808FF08080800"
    )
        port map (
      I0 => \arb_gnt_r[2]_i_2_n_0\,
      I1 => sel_i(1),
      I2 => sel_i(0),
      I3 => areset_r,
      I4 => aclken,
      I5 => \^arb_gnt_r_reg[2]_0\,
      O => \arb_gnt_r[2]_i_1_n_0\
    );
\arb_gnt_r[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4500"
    )
        port map (
      I0 => areset_r,
      I1 => m_axis_tready_0_sn_1,
      I2 => arb_busy_r,
      I3 => valid_i,
      O => \arb_gnt_r[2]_i_2_n_0\
    );
\arb_gnt_r[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8880000B888"
    )
        port map (
      I0 => port_priority_ns(1),
      I1 => arb_req_rot(1),
      I2 => port_priority_ns(3),
      I3 => arb_req_rot(2),
      I4 => arb_req_rot(0),
      I5 => port_priority_ns(5),
      O => sel_i(1)
    );
\arb_gnt_r[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8880000B888"
    )
        port map (
      I0 => port_priority_ns(0),
      I1 => arb_req_rot(1),
      I2 => port_priority_ns(2),
      I3 => arb_req_rot(2),
      I4 => arb_req_rot(0),
      I5 => port_priority_ns(4),
      O => sel_i(0)
    );
\arb_gnt_r[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBB3088"
    )
        port map (
      I0 => \arb_req_i__2\(2),
      I1 => \barrel_cntr_reg_n_0_[0]\,
      I2 => \arb_req_i__2\(0),
      I3 => \barrel_cntr_reg_n_0_[1]\,
      I4 => \arb_req_i__2\(1),
      O => arb_req_rot(1)
    );
\arb_gnt_r[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBB3088"
    )
        port map (
      I0 => \arb_req_i__2\(0),
      I1 => \barrel_cntr_reg_n_0_[0]\,
      I2 => \arb_req_i__2\(1),
      I3 => \barrel_cntr_reg_n_0_[1]\,
      I4 => \arb_req_i__2\(2),
      O => arb_req_rot(2)
    );
\arb_gnt_r[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBB3088"
    )
        port map (
      I0 => \arb_req_i__2\(1),
      I1 => \barrel_cntr_reg_n_0_[0]\,
      I2 => \arb_req_i__2\(2),
      I3 => \barrel_cntr_reg_n_0_[1]\,
      I4 => \arb_req_i__2\(0),
      O => arb_req_rot(0)
    );
\arb_gnt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \arb_gnt_r[0]_i_1_n_0\,
      Q => \^arb_gnt_r_reg[0]_0\,
      R => '0'
    );
\arb_gnt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \arb_gnt_r[1]_i_1_n_0\,
      Q => \^arb_gnt_r_reg[1]_0\,
      R => '0'
    );
\arb_gnt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \arb_gnt_r[2]_i_1_n_0\,
      Q => \^arb_gnt_r_reg[2]_0\,
      R => '0'
    );
\arb_sel_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF75FF8A000000"
    )
        port map (
      I0 => aclken,
      I1 => m_axis_tready_0_sn_1,
      I2 => arb_busy_r,
      I3 => valid_i,
      I4 => sel_i(0),
      I5 => arb_sel_i(0),
      O => \arb_sel_r[0]_i_1_n_0\
    );
\arb_sel_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF75FF8A000000"
    )
        port map (
      I0 => aclken,
      I1 => m_axis_tready_0_sn_1,
      I2 => arb_busy_r,
      I3 => valid_i,
      I4 => sel_i(1),
      I5 => arb_sel_i(1),
      O => \arb_sel_r[1]_i_1_n_0\
    );
\arb_sel_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \arb_sel_r[0]_i_1_n_0\,
      Q => arb_sel_i(0),
      R => areset_r
    );
\arb_sel_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \arb_sel_r[1]_i_1_n_0\,
      Q => arb_sel_i(1),
      R => areset_r
    );
\barrel_cntr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \barrel_cntr_reg_n_0_[1]\,
      I1 => \barrel_cntr_reg_n_0_[0]\,
      O => barrel_cntr_ns(0)
    );
\barrel_cntr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAA8A"
    )
        port map (
      I0 => aclken,
      I1 => \^arb_gnt_r_reg[0]_0\,
      I2 => arb_busy_r,
      I3 => \^arb_gnt_r_reg[1]_0\,
      I4 => \^arb_gnt_r_reg[2]_0\,
      O => barrel_cntr
    );
\barrel_cntr[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \barrel_cntr_reg_n_0_[1]\,
      I1 => \barrel_cntr_reg_n_0_[0]\,
      O => barrel_cntr_ns(1)
    );
\barrel_cntr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => barrel_cntr_ns(0),
      Q => \barrel_cntr_reg_n_0_[0]\,
      R => areset_r
    );
\barrel_cntr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => barrel_cntr_ns(1),
      Q => \barrel_cntr_reg_n_0_[1]\,
      R => areset_r
    );
\gen_tdest_routing.busy_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \^arb_gnt_r_reg[2]_0\,
      I1 => \gen_tdest_routing.busy_r_reg[0]\,
      I2 => m_axis_tready_0_sn_1,
      O => \gen_tdest_routing.busy_ns\
    );
\gen_tdest_routing.busy_r[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \^arb_gnt_r_reg[1]_0\,
      I1 => \gen_tdest_routing.busy_r_reg[0]_0\,
      I2 => m_axis_tready_0_sn_1,
      O => \gen_tdest_routing.busy_ns_0\
    );
\gen_tdest_routing.busy_r[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \^arb_gnt_r_reg[0]_0\,
      I1 => \gen_tdest_routing.busy_r_reg[0]_1\,
      I2 => m_axis_tready_0_sn_1,
      O => \gen_tdest_routing.busy_ns_1\
    );
\m_axis_tdata[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(128),
      I1 => s_axis_tdata(0),
      I2 => s_axis_tdata(64),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(0)
    );
\m_axis_tdata[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(138),
      I1 => s_axis_tdata(10),
      I2 => s_axis_tdata(74),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(10)
    );
\m_axis_tdata[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(139),
      I1 => s_axis_tdata(11),
      I2 => s_axis_tdata(75),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(11)
    );
\m_axis_tdata[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(140),
      I1 => s_axis_tdata(12),
      I2 => s_axis_tdata(76),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(12)
    );
\m_axis_tdata[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(141),
      I1 => s_axis_tdata(13),
      I2 => s_axis_tdata(77),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(13)
    );
\m_axis_tdata[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(142),
      I1 => s_axis_tdata(14),
      I2 => s_axis_tdata(78),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(14)
    );
\m_axis_tdata[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(143),
      I1 => s_axis_tdata(15),
      I2 => s_axis_tdata(79),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(15)
    );
\m_axis_tdata[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(144),
      I1 => s_axis_tdata(16),
      I2 => s_axis_tdata(80),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(16)
    );
\m_axis_tdata[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(145),
      I1 => s_axis_tdata(17),
      I2 => s_axis_tdata(81),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(17)
    );
\m_axis_tdata[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(146),
      I1 => s_axis_tdata(18),
      I2 => s_axis_tdata(82),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(18)
    );
\m_axis_tdata[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(147),
      I1 => s_axis_tdata(19),
      I2 => s_axis_tdata(83),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(19)
    );
\m_axis_tdata[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(129),
      I1 => s_axis_tdata(1),
      I2 => s_axis_tdata(65),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(1)
    );
\m_axis_tdata[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(148),
      I1 => s_axis_tdata(20),
      I2 => s_axis_tdata(84),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(20)
    );
\m_axis_tdata[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(149),
      I1 => s_axis_tdata(21),
      I2 => s_axis_tdata(85),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(21)
    );
\m_axis_tdata[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(150),
      I1 => s_axis_tdata(22),
      I2 => s_axis_tdata(86),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(22)
    );
\m_axis_tdata[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(151),
      I1 => s_axis_tdata(23),
      I2 => s_axis_tdata(87),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(23)
    );
\m_axis_tdata[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(152),
      I1 => s_axis_tdata(24),
      I2 => s_axis_tdata(88),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(24)
    );
\m_axis_tdata[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(153),
      I1 => s_axis_tdata(25),
      I2 => s_axis_tdata(89),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(25)
    );
\m_axis_tdata[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(154),
      I1 => s_axis_tdata(26),
      I2 => s_axis_tdata(90),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(26)
    );
\m_axis_tdata[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(155),
      I1 => s_axis_tdata(27),
      I2 => s_axis_tdata(91),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(27)
    );
\m_axis_tdata[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(156),
      I1 => s_axis_tdata(28),
      I2 => s_axis_tdata(92),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(28)
    );
\m_axis_tdata[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(157),
      I1 => s_axis_tdata(29),
      I2 => s_axis_tdata(93),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(29)
    );
\m_axis_tdata[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(130),
      I1 => s_axis_tdata(2),
      I2 => s_axis_tdata(66),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(2)
    );
\m_axis_tdata[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(158),
      I1 => s_axis_tdata(30),
      I2 => s_axis_tdata(94),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(30)
    );
\m_axis_tdata[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(159),
      I1 => s_axis_tdata(31),
      I2 => s_axis_tdata(95),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(31)
    );
\m_axis_tdata[32]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(160),
      I1 => s_axis_tdata(32),
      I2 => s_axis_tdata(96),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(32)
    );
\m_axis_tdata[33]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(161),
      I1 => s_axis_tdata(33),
      I2 => s_axis_tdata(97),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(33)
    );
\m_axis_tdata[34]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(162),
      I1 => s_axis_tdata(34),
      I2 => s_axis_tdata(98),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(34)
    );
\m_axis_tdata[35]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(163),
      I1 => s_axis_tdata(35),
      I2 => s_axis_tdata(99),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(35)
    );
\m_axis_tdata[36]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(164),
      I1 => s_axis_tdata(36),
      I2 => s_axis_tdata(100),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(36)
    );
\m_axis_tdata[37]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(165),
      I1 => s_axis_tdata(37),
      I2 => s_axis_tdata(101),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(37)
    );
\m_axis_tdata[38]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(166),
      I1 => s_axis_tdata(38),
      I2 => s_axis_tdata(102),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(38)
    );
\m_axis_tdata[39]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(167),
      I1 => s_axis_tdata(39),
      I2 => s_axis_tdata(103),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(39)
    );
\m_axis_tdata[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(131),
      I1 => s_axis_tdata(3),
      I2 => s_axis_tdata(67),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(3)
    );
\m_axis_tdata[40]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(168),
      I1 => s_axis_tdata(40),
      I2 => s_axis_tdata(104),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(40)
    );
\m_axis_tdata[41]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(169),
      I1 => s_axis_tdata(41),
      I2 => s_axis_tdata(105),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(41)
    );
\m_axis_tdata[42]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(170),
      I1 => s_axis_tdata(42),
      I2 => s_axis_tdata(106),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(42)
    );
\m_axis_tdata[43]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(171),
      I1 => s_axis_tdata(43),
      I2 => s_axis_tdata(107),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(43)
    );
\m_axis_tdata[44]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(172),
      I1 => s_axis_tdata(44),
      I2 => s_axis_tdata(108),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(44)
    );
\m_axis_tdata[45]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(173),
      I1 => s_axis_tdata(45),
      I2 => s_axis_tdata(109),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(45)
    );
\m_axis_tdata[46]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(174),
      I1 => s_axis_tdata(46),
      I2 => s_axis_tdata(110),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(46)
    );
\m_axis_tdata[47]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(175),
      I1 => s_axis_tdata(47),
      I2 => s_axis_tdata(111),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(47)
    );
\m_axis_tdata[48]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(176),
      I1 => s_axis_tdata(48),
      I2 => s_axis_tdata(112),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(48)
    );
\m_axis_tdata[49]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(177),
      I1 => s_axis_tdata(49),
      I2 => s_axis_tdata(113),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(49)
    );
\m_axis_tdata[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(132),
      I1 => s_axis_tdata(4),
      I2 => s_axis_tdata(68),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(4)
    );
\m_axis_tdata[50]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(178),
      I1 => s_axis_tdata(50),
      I2 => s_axis_tdata(114),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(50)
    );
\m_axis_tdata[51]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(179),
      I1 => s_axis_tdata(51),
      I2 => s_axis_tdata(115),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(51)
    );
\m_axis_tdata[52]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(180),
      I1 => s_axis_tdata(52),
      I2 => s_axis_tdata(116),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(52)
    );
\m_axis_tdata[53]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(181),
      I1 => s_axis_tdata(53),
      I2 => s_axis_tdata(117),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(53)
    );
\m_axis_tdata[54]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(182),
      I1 => s_axis_tdata(54),
      I2 => s_axis_tdata(118),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(54)
    );
\m_axis_tdata[55]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(183),
      I1 => s_axis_tdata(55),
      I2 => s_axis_tdata(119),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(55)
    );
\m_axis_tdata[56]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(184),
      I1 => s_axis_tdata(56),
      I2 => s_axis_tdata(120),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(56)
    );
\m_axis_tdata[57]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(185),
      I1 => s_axis_tdata(57),
      I2 => s_axis_tdata(121),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(57)
    );
\m_axis_tdata[58]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(186),
      I1 => s_axis_tdata(58),
      I2 => s_axis_tdata(122),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(58)
    );
\m_axis_tdata[59]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(187),
      I1 => s_axis_tdata(59),
      I2 => s_axis_tdata(123),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(59)
    );
\m_axis_tdata[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(133),
      I1 => s_axis_tdata(5),
      I2 => s_axis_tdata(69),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(5)
    );
\m_axis_tdata[60]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(188),
      I1 => s_axis_tdata(60),
      I2 => s_axis_tdata(124),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(60)
    );
\m_axis_tdata[61]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(189),
      I1 => s_axis_tdata(61),
      I2 => s_axis_tdata(125),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(61)
    );
\m_axis_tdata[62]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(190),
      I1 => s_axis_tdata(62),
      I2 => s_axis_tdata(126),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(62)
    );
\m_axis_tdata[63]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(191),
      I1 => s_axis_tdata(63),
      I2 => s_axis_tdata(127),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(63)
    );
\m_axis_tdata[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(134),
      I1 => s_axis_tdata(6),
      I2 => s_axis_tdata(70),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(6)
    );
\m_axis_tdata[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(135),
      I1 => s_axis_tdata(7),
      I2 => s_axis_tdata(71),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(7)
    );
\m_axis_tdata[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(136),
      I1 => s_axis_tdata(8),
      I2 => s_axis_tdata(72),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(8)
    );
\m_axis_tdata[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tdata(137),
      I1 => s_axis_tdata(9),
      I2 => s_axis_tdata(73),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tdata(9)
    );
\m_axis_tlast[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tlast(2),
      I1 => s_axis_tlast(0),
      I2 => s_axis_tlast(1),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tlast(0)
    );
\m_axis_tstrb[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(16),
      I1 => s_axis_tstrb(0),
      I2 => s_axis_tstrb(8),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(0)
    );
\m_axis_tstrb[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(17),
      I1 => s_axis_tstrb(1),
      I2 => s_axis_tstrb(9),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(1)
    );
\m_axis_tstrb[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(18),
      I1 => s_axis_tstrb(2),
      I2 => s_axis_tstrb(10),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(2)
    );
\m_axis_tstrb[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(19),
      I1 => s_axis_tstrb(3),
      I2 => s_axis_tstrb(11),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(3)
    );
\m_axis_tstrb[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(20),
      I1 => s_axis_tstrb(4),
      I2 => s_axis_tstrb(12),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(4)
    );
\m_axis_tstrb[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(21),
      I1 => s_axis_tstrb(5),
      I2 => s_axis_tstrb(13),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(5)
    );
\m_axis_tstrb[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(22),
      I1 => s_axis_tstrb(6),
      I2 => s_axis_tstrb(14),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(6)
    );
\m_axis_tstrb[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AAF0CC"
    )
        port map (
      I0 => s_axis_tstrb(23),
      I1 => s_axis_tstrb(7),
      I2 => s_axis_tstrb(15),
      I3 => arb_sel_i(0),
      I4 => arb_sel_i(1),
      O => m_axis_tstrb(7)
    );
\m_axis_tvalid[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3B380B0800000000"
    )
        port map (
      I0 => s_axis_tvalid(2),
      I1 => arb_sel_i(1),
      I2 => arb_sel_i(0),
      I3 => s_axis_tvalid(0),
      I4 => s_axis_tvalid(1),
      I5 => \m_axis_tvalid[0]_INST_0_i_1_n_0\,
      O => m_axis_tvalid(0)
    );
\m_axis_tvalid[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^arb_gnt_r_reg[2]_0\,
      I1 => \gen_tdest_router.busy_r\(2),
      I2 => \^arb_gnt_r_reg[1]_0\,
      I3 => \gen_tdest_router.busy_r\(1),
      I4 => \gen_tdest_router.busy_r\(0),
      I5 => \^arb_gnt_r_reg[0]_0\,
      O => \m_axis_tvalid[0]_INST_0_i_1_n_0\
    );
\port_priority_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(0),
      Q => port_priority_ns(4),
      R => areset_r
    );
\port_priority_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(1),
      Q => port_priority_ns(5),
      R => areset_r
    );
\port_priority_r_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(2),
      Q => port_priority_ns(0),
      S => areset_r
    );
\port_priority_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(3),
      Q => port_priority_ns(1),
      R => areset_r
    );
\port_priority_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(4),
      Q => port_priority_ns(2),
      R => areset_r
    );
\port_priority_r_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => barrel_cntr,
      D => port_priority_ns(5),
      Q => port_priority_ns(3),
      S => areset_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder is
  port (
    s_axis_tready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_router.busy_r\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    arb_gnt_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    p_0_out : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder : entity is "axis_switch_v1_1_19_axisc_arb_responder";
end effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder is
  signal \busy_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \busy_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \busy_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \^gen_tdest_router.busy_r\ : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  \gen_tdest_router.busy_r\(2 downto 0) <= \^gen_tdest_router.busy_r\(2 downto 0);
\busy_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000A0E0A"
    )
        port map (
      I0 => \^gen_tdest_router.busy_r\(0),
      I1 => arb_gnt_i(0),
      I2 => areset_r,
      I3 => aclken,
      I4 => p_0_out,
      O => \busy_r[0]_i_1_n_0\
    );
\busy_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000A0E0A"
    )
        port map (
      I0 => \^gen_tdest_router.busy_r\(1),
      I1 => arb_gnt_i(1),
      I2 => areset_r,
      I3 => aclken,
      I4 => p_0_out,
      O => \busy_r[1]_i_1_n_0\
    );
\busy_r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000A0E0A"
    )
        port map (
      I0 => \^gen_tdest_router.busy_r\(2),
      I1 => arb_gnt_i(2),
      I2 => areset_r,
      I3 => aclken,
      I4 => p_0_out,
      O => \busy_r[2]_i_1_n_0\
    );
\busy_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \busy_r[0]_i_1_n_0\,
      Q => \^gen_tdest_router.busy_r\(0),
      R => '0'
    );
\busy_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \busy_r[1]_i_1_n_0\,
      Q => \^gen_tdest_router.busy_r\(1),
      R => '0'
    );
\busy_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \busy_r[2]_i_1_n_0\,
      Q => \^gen_tdest_router.busy_r\(2),
      R => '0'
    );
\s_axis_tready[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => s_axis_tvalid(0),
      I1 => m_axis_tready(0),
      I2 => \^gen_tdest_router.busy_r\(0),
      I3 => arb_gnt_i(0),
      O => s_axis_tready(0)
    );
\s_axis_tready[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => s_axis_tvalid(1),
      I1 => m_axis_tready(0),
      I2 => \^gen_tdest_router.busy_r\(1),
      I3 => arb_gnt_i(1),
      O => s_axis_tready(1)
    );
\s_axis_tready[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => s_axis_tvalid(2),
      I1 => m_axis_tready(0),
      I2 => \^gen_tdest_router.busy_r\(2),
      I3 => arb_gnt_i(2),
      O => s_axis_tready(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder is
  port (
    \gen_tdest_routing.busy_r_reg[0]_0\ : out STD_LOGIC;
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    \gen_tdest_routing.busy_ns\ : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder : entity is "axis_switch_v1_1_19_axisc_decoder";
end effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder is
begin
\gen_tdest_routing.busy_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => \gen_tdest_routing.busy_ns\,
      Q => \gen_tdest_routing.busy_r_reg[0]_0\,
      R => areset_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0 is
  port (
    \gen_tdest_routing.busy_r_reg[0]_0\ : out STD_LOGIC;
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    \gen_tdest_routing.busy_ns\ : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0 : entity is "axis_switch_v1_1_19_axisc_decoder";
end effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0 is
begin
\gen_tdest_routing.busy_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => \gen_tdest_routing.busy_ns\,
      Q => \gen_tdest_routing.busy_r_reg[0]_0\,
      R => areset_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1 is
  port (
    \gen_tdest_routing.busy_r_reg[0]_0\ : out STD_LOGIC;
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    \gen_tdest_routing.busy_ns\ : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1 : entity is "axis_switch_v1_1_19_axisc_decoder";
end effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1 is
begin
\gen_tdest_routing.busy_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => \gen_tdest_routing.busy_ns\,
      Q => \gen_tdest_routing.busy_r_reg[0]_0\,
      R => areset_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter is
  port (
    \gen_tdest_routing.busy_ns\ : out STD_LOGIC;
    arb_gnt_i : out STD_LOGIC_VECTOR ( 2 downto 0 );
    p_0_out : out STD_LOGIC;
    \gen_tdest_routing.busy_ns_0\ : out STD_LOGIC;
    \gen_tdest_routing.busy_ns_1\ : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \gen_tdest_routing.busy_r_reg[0]\ : in STD_LOGIC;
    s_req_suppress : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_routing.busy_r_reg[0]_0\ : in STD_LOGIC;
    \gen_tdest_routing.busy_r_reg[0]_1\ : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_router.busy_r\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter : entity is "axis_switch_v1_1_19_axis_switch_arbiter";
end effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter is
begin
\gen_mi_arb[0].gen_arb_algorithm.gen_round_robin.inst_arb_rr_0\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_arb_rr
     port map (
      aclk => aclk,
      aclken => aclken,
      \arb_gnt_r_reg[0]_0\ => arb_gnt_i(0),
      \arb_gnt_r_reg[1]_0\ => arb_gnt_i(1),
      \arb_gnt_r_reg[2]_0\ => arb_gnt_i(2),
      areset_r => areset_r,
      \gen_tdest_router.busy_r\(2 downto 0) => \gen_tdest_router.busy_r\(2 downto 0),
      \gen_tdest_routing.busy_ns\ => \gen_tdest_routing.busy_ns\,
      \gen_tdest_routing.busy_ns_0\ => \gen_tdest_routing.busy_ns_0\,
      \gen_tdest_routing.busy_ns_1\ => \gen_tdest_routing.busy_ns_1\,
      \gen_tdest_routing.busy_r_reg[0]\ => \gen_tdest_routing.busy_r_reg[0]\,
      \gen_tdest_routing.busy_r_reg[0]_0\ => \gen_tdest_routing.busy_r_reg[0]_0\,
      \gen_tdest_routing.busy_r_reg[0]_1\ => \gen_tdest_routing.busy_r_reg[0]_1\,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tlast(0) => m_axis_tlast(0),
      m_axis_tready(0) => m_axis_tready(0),
      m_axis_tready_0_sp_1 => p_0_out,
      m_axis_tstrb(7 downto 0) => m_axis_tstrb(7 downto 0),
      m_axis_tvalid(0) => m_axis_tvalid(0),
      s_axis_tdata(191 downto 0) => s_axis_tdata(191 downto 0),
      s_axis_tlast(2 downto 0) => s_axis_tlast(2 downto 0),
      s_axis_tstrb(23 downto 0) => s_axis_tstrb(23 downto 0),
      s_axis_tvalid(2 downto 0) => s_axis_tvalid(2 downto 0),
      s_req_suppress(2 downto 0) => s_req_suppress(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux is
  port (
    s_axis_tready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_tdest_router.busy_r\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    arb_gnt_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    areset_r : in STD_LOGIC;
    aclken : in STD_LOGIC;
    p_0_out : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux : entity is "axis_switch_v1_1_19_axisc_transfer_mux";
end effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux is
begin
\gen_tdest_router.axisc_arb_responder\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axisc_arb_responder
     port map (
      aclk => aclk,
      aclken => aclken,
      arb_gnt_i(2 downto 0) => arb_gnt_i(2 downto 0),
      areset_r => areset_r,
      \gen_tdest_router.busy_r\(2 downto 0) => \gen_tdest_router.busy_r\(2 downto 0),
      m_axis_tready(0) => m_axis_tready(0),
      p_0_out => p_0_out,
      s_axis_tready(2 downto 0) => s_axis_tready(2 downto 0),
      s_axis_tvalid(2 downto 0) => s_axis_tvalid(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    arb_req : out STD_LOGIC_VECTOR ( 2 downto 0 );
    arb_done : out STD_LOGIC_VECTOR ( 0 to 0 );
    arb_gnt : in STD_LOGIC_VECTOR ( 2 downto 0 );
    arb_sel : in STD_LOGIC_VECTOR ( 1 downto 0 );
    arb_last : out STD_LOGIC_VECTOR ( 2 downto 0 );
    arb_id : out STD_LOGIC_VECTOR ( 2 downto 0 );
    arb_dest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    arb_user : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_ctrl_aclk : in STD_LOGIC;
    s_axi_ctrl_aresetn : in STD_LOGIC;
    s_axi_ctrl_awvalid : in STD_LOGIC;
    s_axi_ctrl_awready : out STD_LOGIC;
    s_axi_ctrl_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_ctrl_wvalid : in STD_LOGIC;
    s_axi_ctrl_wready : out STD_LOGIC;
    s_axi_ctrl_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_bvalid : out STD_LOGIC;
    s_axi_ctrl_bready : in STD_LOGIC;
    s_axi_ctrl_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ctrl_arvalid : in STD_LOGIC;
    s_axi_ctrl_arready : out STD_LOGIC;
    s_axi_ctrl_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_ctrl_rvalid : out STD_LOGIC;
    s_axi_ctrl_rready : in STD_LOGIC;
    s_axi_ctrl_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ctrl_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute C_ARB_ALGORITHM : integer;
  attribute C_ARB_ALGORITHM of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_ARB_ON_MAX_XFERS : integer;
  attribute C_ARB_ON_MAX_XFERS of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_ARB_ON_NUM_CYCLES : integer;
  attribute C_ARB_ON_NUM_CYCLES of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_ARB_ON_TLAST : integer;
  attribute C_ARB_ON_TLAST of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_AXIS_SIGNAL_SET : integer;
  attribute C_AXIS_SIGNAL_SET of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 23;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_DECODER_REG : integer;
  attribute C_DECODER_REG of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "zynq";
  attribute C_INCLUDE_ARBITER : integer;
  attribute C_INCLUDE_ARBITER of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_LOG_SI_SLOTS : integer;
  attribute C_LOG_SI_SLOTS of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 2;
  attribute C_M_AXIS_BASETDEST_ARRAY : string;
  attribute C_M_AXIS_BASETDEST_ARRAY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "1'b0";
  attribute C_M_AXIS_CONNECTIVITY_ARRAY : string;
  attribute C_M_AXIS_CONNECTIVITY_ARRAY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "3'b111";
  attribute C_M_AXIS_HIGHTDEST_ARRAY : string;
  attribute C_M_AXIS_HIGHTDEST_ARRAY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "1'b0";
  attribute C_NUM_MI_SLOTS : integer;
  attribute C_NUM_MI_SLOTS of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute C_NUM_SI_SLOTS : integer;
  attribute C_NUM_SI_SLOTS of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 3;
  attribute C_OUTPUT_REG : integer;
  attribute C_OUTPUT_REG of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_ROUTING_MODE : integer;
  attribute C_ROUTING_MODE of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 7;
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 32;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "yes";
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 1;
  attribute LP_CTRL_REG_WIDTH : integer;
  attribute LP_CTRL_REG_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 20;
  attribute LP_MERGEDOWN_MUX : integer;
  attribute LP_MERGEDOWN_MUX of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 0;
  attribute LP_NUM_SYNCHRONIZER_STAGES : integer;
  attribute LP_NUM_SYNCHRONIZER_STAGES of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "axis_switch_v1_1_19_axis_switch";
  attribute P_DECODER_CONNECTIVITY_ARRAY : string;
  attribute P_DECODER_CONNECTIVITY_ARRAY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "3'b111";
  attribute P_SINGLE_SLAVE_CONNECTIVITY_ARRAY : string;
  attribute P_SINGLE_SLAVE_CONNECTIVITY_ARRAY of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is "1'b0";
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch : entity is 73;
end effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch;

architecture STRUCTURE of effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal arb_gnt_i : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal areset_r : STD_LOGIC;
  signal \gen_decoder[0].axisc_decoder_0_n_0\ : STD_LOGIC;
  signal \gen_decoder[1].axisc_decoder_0_n_0\ : STD_LOGIC;
  signal \gen_decoder[2].axisc_decoder_0_n_0\ : STD_LOGIC;
  signal \gen_tdest_router.busy_r\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \gen_tdest_routing.busy_ns\ : STD_LOGIC;
  signal \gen_tdest_routing.busy_ns_0\ : STD_LOGIC;
  signal \gen_tdest_routing.busy_ns_1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_out : STD_LOGIC;
begin
  arb_dest(2) <= \<const0>\;
  arb_dest(1) <= \<const0>\;
  arb_dest(0) <= \<const0>\;
  arb_done(0) <= \<const0>\;
  arb_id(2) <= \<const0>\;
  arb_id(1) <= \<const0>\;
  arb_id(0) <= \<const0>\;
  arb_last(2) <= \<const0>\;
  arb_last(1) <= \<const0>\;
  arb_last(0) <= \<const0>\;
  arb_req(2) <= \<const0>\;
  arb_req(1) <= \<const0>\;
  arb_req(0) <= \<const0>\;
  arb_user(2) <= \<const0>\;
  arb_user(1) <= \<const0>\;
  arb_user(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(7) <= \<const1>\;
  m_axis_tkeep(6) <= \<const1>\;
  m_axis_tkeep(5) <= \<const1>\;
  m_axis_tkeep(4) <= \<const1>\;
  m_axis_tkeep(3) <= \<const1>\;
  m_axis_tkeep(2) <= \<const1>\;
  m_axis_tkeep(1) <= \<const1>\;
  m_axis_tkeep(0) <= \<const1>\;
  m_axis_tuser(0) <= \<const0>\;
  s_axi_ctrl_arready <= \<const0>\;
  s_axi_ctrl_awready <= \<const0>\;
  s_axi_ctrl_bresp(1) <= \<const0>\;
  s_axi_ctrl_bresp(0) <= \<const0>\;
  s_axi_ctrl_bvalid <= \<const0>\;
  s_axi_ctrl_rdata(31) <= \<const0>\;
  s_axi_ctrl_rdata(30) <= \<const0>\;
  s_axi_ctrl_rdata(29) <= \<const0>\;
  s_axi_ctrl_rdata(28) <= \<const0>\;
  s_axi_ctrl_rdata(27) <= \<const0>\;
  s_axi_ctrl_rdata(26) <= \<const0>\;
  s_axi_ctrl_rdata(25) <= \<const0>\;
  s_axi_ctrl_rdata(24) <= \<const0>\;
  s_axi_ctrl_rdata(23) <= \<const0>\;
  s_axi_ctrl_rdata(22) <= \<const0>\;
  s_axi_ctrl_rdata(21) <= \<const0>\;
  s_axi_ctrl_rdata(20) <= \<const0>\;
  s_axi_ctrl_rdata(19) <= \<const0>\;
  s_axi_ctrl_rdata(18) <= \<const0>\;
  s_axi_ctrl_rdata(17) <= \<const0>\;
  s_axi_ctrl_rdata(16) <= \<const0>\;
  s_axi_ctrl_rdata(15) <= \<const0>\;
  s_axi_ctrl_rdata(14) <= \<const0>\;
  s_axi_ctrl_rdata(13) <= \<const0>\;
  s_axi_ctrl_rdata(12) <= \<const0>\;
  s_axi_ctrl_rdata(11) <= \<const0>\;
  s_axi_ctrl_rdata(10) <= \<const0>\;
  s_axi_ctrl_rdata(9) <= \<const0>\;
  s_axi_ctrl_rdata(8) <= \<const0>\;
  s_axi_ctrl_rdata(7) <= \<const0>\;
  s_axi_ctrl_rdata(6) <= \<const0>\;
  s_axi_ctrl_rdata(5) <= \<const0>\;
  s_axi_ctrl_rdata(4) <= \<const0>\;
  s_axi_ctrl_rdata(3) <= \<const0>\;
  s_axi_ctrl_rdata(2) <= \<const0>\;
  s_axi_ctrl_rdata(1) <= \<const0>\;
  s_axi_ctrl_rdata(0) <= \<const0>\;
  s_axi_ctrl_rresp(1) <= \<const0>\;
  s_axi_ctrl_rresp(0) <= \<const0>\;
  s_axi_ctrl_rvalid <= \<const0>\;
  s_axi_ctrl_wready <= \<const0>\;
  s_decode_err(2) <= \<const0>\;
  s_decode_err(1) <= \<const0>\;
  s_decode_err(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
areset_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => p_0_in
    );
areset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in,
      Q => areset_r,
      R => '0'
    );
\gen_decoder[0].axisc_decoder_0\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder
     port map (
      aclk => aclk,
      aclken => aclken,
      areset_r => areset_r,
      \gen_tdest_routing.busy_ns\ => \gen_tdest_routing.busy_ns\,
      \gen_tdest_routing.busy_r_reg[0]_0\ => \gen_decoder[0].axisc_decoder_0_n_0\
    );
\gen_decoder[1].axisc_decoder_0\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_0
     port map (
      aclk => aclk,
      aclken => aclken,
      areset_r => areset_r,
      \gen_tdest_routing.busy_ns\ => \gen_tdest_routing.busy_ns_0\,
      \gen_tdest_routing.busy_r_reg[0]_0\ => \gen_decoder[1].axisc_decoder_0_n_0\
    );
\gen_decoder[2].axisc_decoder_0\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axisc_decoder_1
     port map (
      aclk => aclk,
      aclken => aclken,
      areset_r => areset_r,
      \gen_tdest_routing.busy_ns\ => \gen_tdest_routing.busy_ns_1\,
      \gen_tdest_routing.busy_r_reg[0]_0\ => \gen_decoder[2].axisc_decoder_0_n_0\
    );
\gen_int_arbiter.gen_arbiter.axis_switch_v1_1_19_axis_switch_arbiter\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch_arbiter
     port map (
      aclk => aclk,
      aclken => aclken,
      arb_gnt_i(2 downto 0) => arb_gnt_i(2 downto 0),
      areset_r => areset_r,
      \gen_tdest_router.busy_r\(2 downto 0) => \gen_tdest_router.busy_r\(2 downto 0),
      \gen_tdest_routing.busy_ns\ => \gen_tdest_routing.busy_ns_1\,
      \gen_tdest_routing.busy_ns_0\ => \gen_tdest_routing.busy_ns_0\,
      \gen_tdest_routing.busy_ns_1\ => \gen_tdest_routing.busy_ns\,
      \gen_tdest_routing.busy_r_reg[0]\ => \gen_decoder[2].axisc_decoder_0_n_0\,
      \gen_tdest_routing.busy_r_reg[0]_0\ => \gen_decoder[1].axisc_decoder_0_n_0\,
      \gen_tdest_routing.busy_r_reg[0]_1\ => \gen_decoder[0].axisc_decoder_0_n_0\,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tlast(0) => m_axis_tlast(0),
      m_axis_tready(0) => m_axis_tready(0),
      m_axis_tstrb(7 downto 0) => m_axis_tstrb(7 downto 0),
      m_axis_tvalid(0) => m_axis_tvalid(0),
      p_0_out => p_0_out,
      s_axis_tdata(191 downto 0) => s_axis_tdata(191 downto 0),
      s_axis_tlast(2 downto 0) => s_axis_tlast(2 downto 0),
      s_axis_tstrb(23 downto 0) => s_axis_tstrb(23 downto 0),
      s_axis_tvalid(2 downto 0) => s_axis_tvalid(2 downto 0),
      s_req_suppress(2 downto 0) => s_req_suppress(2 downto 0)
    );
\gen_transfer_mux[0].axisc_transfer_mux_0\: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axisc_transfer_mux
     port map (
      aclk => aclk,
      aclken => aclken,
      arb_gnt_i(2 downto 0) => arb_gnt_i(2 downto 0),
      areset_r => areset_r,
      \gen_tdest_router.busy_r\(2 downto 0) => \gen_tdest_router.busy_r\(2 downto 0),
      m_axis_tready(0) => m_axis_tready(0),
      p_0_out => p_0_out,
      s_axis_tready(2 downto 0) => s_axis_tready(2 downto 0),
      s_axis_tvalid(2 downto 0) => s_axis_tvalid(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity effects_loop_xbar_9 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of effects_loop_xbar_9 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of effects_loop_xbar_9 : entity is "effects_loop_xbar_9,axis_switch_v1_1_19_axis_switch,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of effects_loop_xbar_9 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of effects_loop_xbar_9 : entity is "axis_switch_v1_1_19_axis_switch,Vivado 2019.1";
end effects_loop_xbar_9;

architecture STRUCTURE of effects_loop_xbar_9 is
  signal NLW_inst_s_axi_ctrl_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_ctrl_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_ctrl_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_arb_dest_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_arb_done_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_arb_id_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_arb_last_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_arb_req_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_arb_user_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_ctrl_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_axi_ctrl_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_s_axi_ctrl_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ARB_ALGORITHM : integer;
  attribute C_ARB_ALGORITHM of inst : label is 0;
  attribute C_ARB_ON_MAX_XFERS : integer;
  attribute C_ARB_ON_MAX_XFERS of inst : label is 1;
  attribute C_ARB_ON_NUM_CYCLES : integer;
  attribute C_ARB_ON_NUM_CYCLES of inst : label is 0;
  attribute C_ARB_ON_TLAST : integer;
  attribute C_ARB_ON_TLAST of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : integer;
  attribute C_AXIS_SIGNAL_SET of inst : label is 23;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of inst : label is 0;
  attribute C_DECODER_REG : integer;
  attribute C_DECODER_REG of inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_INCLUDE_ARBITER : integer;
  attribute C_INCLUDE_ARBITER of inst : label is 1;
  attribute C_LOG_SI_SLOTS : integer;
  attribute C_LOG_SI_SLOTS of inst : label is 2;
  attribute C_M_AXIS_BASETDEST_ARRAY : string;
  attribute C_M_AXIS_BASETDEST_ARRAY of inst : label is "1'b0";
  attribute C_M_AXIS_CONNECTIVITY_ARRAY : string;
  attribute C_M_AXIS_CONNECTIVITY_ARRAY of inst : label is "3'b111";
  attribute C_M_AXIS_HIGHTDEST_ARRAY : string;
  attribute C_M_AXIS_HIGHTDEST_ARRAY of inst : label is "1'b0";
  attribute C_NUM_MI_SLOTS : integer;
  attribute C_NUM_MI_SLOTS of inst : label is 1;
  attribute C_NUM_SI_SLOTS : integer;
  attribute C_NUM_SI_SLOTS of inst : label is 3;
  attribute C_OUTPUT_REG : integer;
  attribute C_OUTPUT_REG of inst : label is 0;
  attribute C_ROUTING_MODE : integer;
  attribute C_ROUTING_MODE of inst : label is 0;
  attribute C_S_AXI_CTRL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CTRL_ADDR_WIDTH of inst : label is 7;
  attribute C_S_AXI_CTRL_DATA_WIDTH : integer;
  attribute C_S_AXI_CTRL_DATA_WIDTH of inst : label is 32;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute LP_CTRL_REG_WIDTH : integer;
  attribute LP_CTRL_REG_WIDTH of inst : label is 20;
  attribute LP_MERGEDOWN_MUX : integer;
  attribute LP_MERGEDOWN_MUX of inst : label is 0;
  attribute LP_NUM_SYNCHRONIZER_STAGES : integer;
  attribute LP_NUM_SYNCHRONIZER_STAGES of inst : label is 4;
  attribute P_DECODER_CONNECTIVITY_ARRAY : string;
  attribute P_DECODER_CONNECTIVITY_ARRAY of inst : label is "3'b111";
  attribute P_SINGLE_SLAVE_CONNECTIVITY_ARRAY : string;
  attribute P_SINGLE_SLAVE_CONNECTIVITY_ARRAY of inst : label is "1'b0";
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of inst : label is 73;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLKIF CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLKIF, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF M00_AXIS:M01_AXIS:M02_AXIS:M03_AXIS:M04_AXIS:M05_AXIS:M06_AXIS:M07_AXIS:M08_AXIS:M09_AXIS:M10_AXIS:M11_AXIS:M12_AXIS:M13_AXIS:M14_AXIS:M15_AXIS:S00_AXIS:S01_AXIS:S02_AXIS:S03_AXIS:S04_AXIS:S05_AXIS:S06_AXIS:S07_AXIS:S08_AXIS:S09_AXIS:S10_AXIS:S11_AXIS:S12_AXIS:S13_AXIS:S14_AXIS:S15_AXIS, ASSOCIATED_RESET aresetn, INSERT_VIP 0, ASSOCIATED_CLKEN aclken";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RSTIF RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_PARAMETER of m_axis_tlast : signal is "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA [63:0] [63:0], xilinx.com:interface:axis:1.0 S01_AXIS TDATA [63:0] [127:64], xilinx.com:interface:axis:1.0 S02_AXIS TDATA [63:0] [191:128]";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TLAST [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TLAST [0:0] [2:2]";
  attribute X_INTERFACE_PARAMETER of s_axis_tlast : signal is "XIL_INTERFACENAME S00_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME S01_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME S02_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN effects_loop_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TREADY [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TREADY [0:0] [2:2]";
  attribute X_INTERFACE_INFO of s_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB [7:0] [7:0], xilinx.com:interface:axis:1.0 S01_AXIS TSTRB [7:0] [15:8], xilinx.com:interface:axis:1.0 S02_AXIS TSTRB [7:0] [23:16]";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TVALID [0:0] [1:1], xilinx.com:interface:axis:1.0 S02_AXIS TVALID [0:0] [2:2]";
begin
inst: entity work.effects_loop_xbar_9_axis_switch_v1_1_19_axis_switch
     port map (
      aclk => aclk,
      aclken => '1',
      arb_dest(2 downto 0) => NLW_inst_arb_dest_UNCONNECTED(2 downto 0),
      arb_done(0) => NLW_inst_arb_done_UNCONNECTED(0),
      arb_gnt(2 downto 0) => B"000",
      arb_id(2 downto 0) => NLW_inst_arb_id_UNCONNECTED(2 downto 0),
      arb_last(2 downto 0) => NLW_inst_arb_last_UNCONNECTED(2 downto 0),
      arb_req(2 downto 0) => NLW_inst_arb_req_UNCONNECTED(2 downto 0),
      arb_sel(1 downto 0) => B"00",
      arb_user(2 downto 0) => NLW_inst_arb_user_UNCONNECTED(2 downto 0),
      aresetn => aresetn,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(7 downto 0) => NLW_inst_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast(0) => m_axis_tlast(0),
      m_axis_tready(0) => m_axis_tready(0),
      m_axis_tstrb(7 downto 0) => m_axis_tstrb(7 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid(0) => m_axis_tvalid(0),
      s_axi_ctrl_aclk => '0',
      s_axi_ctrl_araddr(6 downto 0) => B"0000000",
      s_axi_ctrl_aresetn => '0',
      s_axi_ctrl_arready => NLW_inst_s_axi_ctrl_arready_UNCONNECTED,
      s_axi_ctrl_arvalid => '0',
      s_axi_ctrl_awaddr(6 downto 0) => B"0000000",
      s_axi_ctrl_awready => NLW_inst_s_axi_ctrl_awready_UNCONNECTED,
      s_axi_ctrl_awvalid => '0',
      s_axi_ctrl_bready => '0',
      s_axi_ctrl_bresp(1 downto 0) => NLW_inst_s_axi_ctrl_bresp_UNCONNECTED(1 downto 0),
      s_axi_ctrl_bvalid => NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED,
      s_axi_ctrl_rdata(31 downto 0) => NLW_inst_s_axi_ctrl_rdata_UNCONNECTED(31 downto 0),
      s_axi_ctrl_rready => '0',
      s_axi_ctrl_rresp(1 downto 0) => NLW_inst_s_axi_ctrl_rresp_UNCONNECTED(1 downto 0),
      s_axi_ctrl_rvalid => NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED,
      s_axi_ctrl_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_ctrl_wready => NLW_inst_s_axi_ctrl_wready_UNCONNECTED,
      s_axi_ctrl_wvalid => '0',
      s_axis_tdata(191 downto 0) => s_axis_tdata(191 downto 0),
      s_axis_tdest(2 downto 0) => B"000",
      s_axis_tid(2 downto 0) => B"000",
      s_axis_tkeep(23 downto 0) => B"111111111111111111111111",
      s_axis_tlast(2 downto 0) => s_axis_tlast(2 downto 0),
      s_axis_tready(2 downto 0) => s_axis_tready(2 downto 0),
      s_axis_tstrb(23 downto 0) => s_axis_tstrb(23 downto 0),
      s_axis_tuser(2 downto 0) => B"000",
      s_axis_tvalid(2 downto 0) => s_axis_tvalid(2 downto 0),
      s_decode_err(2 downto 0) => s_decode_err(2 downto 0),
      s_req_suppress(2 downto 0) => s_req_suppress(2 downto 0)
    );
end STRUCTURE;
