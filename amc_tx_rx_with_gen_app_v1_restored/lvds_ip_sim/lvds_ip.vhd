--lpm_ff CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" LPM_WIDTH=1 clock data q
--VERSION_BEGIN 18.1 cbx_lpm_ff 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ  VERSION_END


-- Copyright (C) 2018  Intel Corporation. All rights reserved.
--  Your use of Intel Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Intel Program License 
--  Subscription Agreement, the Intel Quartus Prime License Agreement,
--  the Intel FPGA IP License Agreement, or other applicable license
--  agreement, including, without limitation, that your use is for
--  the sole purpose of programming logic devices manufactured by
--  Intel and sold by Intel or its authorized distributors.  Please
--  refer to the applicable agreement for further details.



--synthesis_resources = lut 1 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  lvds_ip IS 
	 PORT 
	 ( 
		 clock	:	IN  STD_LOGIC;
		 data	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '0');
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0)
	 ); 
 END lvds_ip;

 ARCHITECTURE RTL OF lvds_ip IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	 ff_dffe	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  enable	:	STD_LOGIC;
 BEGIN

	enable <= '1';
	q <= ff_dffe;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
			IF (enable = '1') THEN ff_dffe <= data;
			END IF;
		END IF;
	END PROCESS;

 END RTL; --lvds_ip
--VALID FILE
