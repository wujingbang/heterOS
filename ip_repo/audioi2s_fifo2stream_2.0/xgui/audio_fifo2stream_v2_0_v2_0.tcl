# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "DIRECT_CONNECT" -widget comboBox

}

proc update_PARAM_VALUE.AXIS_TDATA_WIDTH { PARAM_VALUE.AXIS_TDATA_WIDTH } {
	# Procedure called to update AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXIS_TDATA_WIDTH { PARAM_VALUE.AXIS_TDATA_WIDTH } {
	# Procedure called to validate AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to update C_M00_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to validate C_M00_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_CONFIG_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_CONFIG_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_CONFIG_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_CONFIG_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DIRECT_CONNECT { PARAM_VALUE.DIRECT_CONNECT } {
	# Procedure called to update DIRECT_CONNECT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIRECT_CONNECT { PARAM_VALUE.DIRECT_CONNECT } {
	# Procedure called to validate DIRECT_CONNECT
	return true
}

proc update_PARAM_VALUE.TRANSFER_SIZE { PARAM_VALUE.TRANSFER_SIZE } {
	# Procedure called to update TRANSFER_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRANSFER_SIZE { PARAM_VALUE.TRANSFER_SIZE } {
	# Procedure called to validate TRANSFER_SIZE
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CONFIG_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CONFIG_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.AXIS_TDATA_WIDTH { MODELPARAM_VALUE.AXIS_TDATA_WIDTH PARAM_VALUE.AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.TRANSFER_SIZE { MODELPARAM_VALUE.TRANSFER_SIZE PARAM_VALUE.TRANSFER_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRANSFER_SIZE}] ${MODELPARAM_VALUE.TRANSFER_SIZE}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_START_COUNT { MODELPARAM_VALUE.C_M00_AXIS_START_COUNT PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M00_AXIS_START_COUNT}
}

proc update_MODELPARAM_VALUE.DIRECT_CONNECT { MODELPARAM_VALUE.DIRECT_CONNECT PARAM_VALUE.DIRECT_CONNECT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIRECT_CONNECT}] ${MODELPARAM_VALUE.DIRECT_CONNECT}
}

