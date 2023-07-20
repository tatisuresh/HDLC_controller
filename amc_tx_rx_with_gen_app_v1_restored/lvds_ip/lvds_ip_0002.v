//lpm_ff CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" LPM_WIDTH=1 clock data q
//VERSION_BEGIN 18.1 cbx_lpm_ff 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2018  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details.



//synthesis_resources = lut 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  lvds_ip_0002
	( 
	clock,
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [0:0]  data;
	output   [0:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [0:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	ff_dffe;
	wire enable;

	// synopsys translate_off
	initial
		ff_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		if (enable == 1'b1)   ff_dffe <= data;
	assign
		enable = 1'b1,
		q = ff_dffe;
endmodule //lvds_ip_0002
//VALID FILE
