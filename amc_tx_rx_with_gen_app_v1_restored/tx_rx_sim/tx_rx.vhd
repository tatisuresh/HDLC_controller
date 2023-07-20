--altlvds_rx BUFFER_IMPLEMENTATION="RAM" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" COMMON_RX_TX_PLL="ON" CYCLONEII_M4K_COMPATIBILITY="ON" DATA_ALIGN_ROLLOVER=4 DATA_RATE="2.0 Mbps" DESERIALIZATION_FACTOR=8 DEVICE_FAMILY="MAX 10" DPA_INITIAL_PHASE_VALUE=0 DPLL_LOCK_COUNT=0 DPLL_LOCK_WINDOW=0 ENABLE_DPA_ALIGN_TO_RISING_EDGE_ONLY="OFF" ENABLE_DPA_CALIBRATION="ON" ENABLE_DPA_INITIAL_PHASE_SELECTION="OFF" ENABLE_DPA_MODE="OFF" ENABLE_DPA_PLL_CALIBRATION="OFF" ENABLE_SOFT_CDR_MODE="OFF" IMPLEMENT_IN_LES="ON" INCLOCK_BOOST=0 INCLOCK_DATA_ALIGNMENT="EDGE_ALIGNED" INCLOCK_PERIOD=5000 INCLOCK_PHASE_SHIFT=0 INPUT_DATA_RATE=2 NUMBER_OF_CHANNELS=1 OUTCLOCK_RESOURCE="AUTO" PLL_SELF_RESET_ON_LOSS_LOCK="OFF" PORT_RX_CHANNEL_DATA_ALIGN="PORT_UNUSED" PORT_RX_DATA_ALIGN="PORT_USED" REGISTERED_DATA_ALIGN_INPUT="OFF" REGISTERED_OUTPUT="ON" SIM_DPA_IS_NEGATIVE_PPM_DRIFT="OFF" SIM_DPA_NET_PPM_VARIATION=0 SIM_DPA_OUTPUT_CLOCK_PHASE_SHIFT=0 USE_CORECLOCK_INPUT="OFF" USE_DPLL_RAWPERROR="OFF" USE_EXTERNAL_PLL="OFF" USE_NO_PHASE_SHIFT="ON" X_ON_BITSLIP="ON" pll_areset rx_cda_reset rx_channel_data_align rx_data_align rx_data_align_reset rx_in rx_inclock rx_locked rx_out rx_outclock CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 LOW_POWER_MODE="AUTO" ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
--VERSION_BEGIN 18.1 cbx_altaccumulate 2018:09:12:13:04:24:SJ cbx_altclkbuf 2018:09:12:13:04:24:SJ cbx_altddio_in 2018:09:12:13:04:24:SJ cbx_altddio_out 2018:09:12:13:04:24:SJ cbx_altera_syncram_nd_impl 2018:09:12:13:04:24:SJ cbx_altiobuf_bidir 2018:09:12:13:04:24:SJ cbx_altiobuf_in 2018:09:12:13:04:24:SJ cbx_altiobuf_out 2018:09:12:13:04:24:SJ cbx_altlvds_rx 2018:09:12:13:04:24:SJ cbx_altpll 2018:09:12:13:04:24:SJ cbx_altsyncram 2018:09:12:13:04:24:SJ cbx_arriav 2018:09:12:13:04:23:SJ cbx_cyclone 2018:09:12:13:04:24:SJ cbx_cycloneii 2018:09:12:13:04:24:SJ cbx_lpm_add_sub 2018:09:12:13:04:24:SJ cbx_lpm_compare 2018:09:12:13:04:24:SJ cbx_lpm_counter 2018:09:12:13:04:24:SJ cbx_lpm_decode 2018:09:12:13:04:24:SJ cbx_lpm_mux 2018:09:12:13:04:24:SJ cbx_lpm_shiftreg 2018:09:12:13:04:24:SJ cbx_maxii 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_nadder 2018:09:12:13:04:24:SJ cbx_stratix 2018:09:12:13:04:24:SJ cbx_stratixii 2018:09:12:13:04:24:SJ cbx_stratixiii 2018:09:12:13:04:24:SJ cbx_stratixv 2018:09:12:13:04:24:SJ cbx_util_mgl 2018:09:12:13:04:24:SJ  VERSION_END


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




--alt_lvds_ddio_in ADD_LATENCY_REG="TRUE" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" WIDTH=1 aclr clock datain dataout_h dataout_l
--VERSION_BEGIN 18.1 cbx_altaccumulate 2018:09:12:13:04:24:SJ cbx_altclkbuf 2018:09:12:13:04:24:SJ cbx_altddio_in 2018:09:12:13:04:24:SJ cbx_altddio_out 2018:09:12:13:04:24:SJ cbx_altera_syncram_nd_impl 2018:09:12:13:04:24:SJ cbx_altiobuf_bidir 2018:09:12:13:04:24:SJ cbx_altiobuf_in 2018:09:12:13:04:24:SJ cbx_altiobuf_out 2018:09:12:13:04:24:SJ cbx_altlvds_rx 2018:09:12:13:04:24:SJ cbx_altpll 2018:09:12:13:04:24:SJ cbx_altsyncram 2018:09:12:13:04:24:SJ cbx_arriav 2018:09:12:13:04:23:SJ cbx_cyclone 2018:09:12:13:04:24:SJ cbx_cycloneii 2018:09:12:13:04:24:SJ cbx_lpm_add_sub 2018:09:12:13:04:24:SJ cbx_lpm_compare 2018:09:12:13:04:24:SJ cbx_lpm_counter 2018:09:12:13:04:24:SJ cbx_lpm_decode 2018:09:12:13:04:24:SJ cbx_lpm_mux 2018:09:12:13:04:24:SJ cbx_lpm_shiftreg 2018:09:12:13:04:24:SJ cbx_maxii 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_nadder 2018:09:12:13:04:24:SJ cbx_stratix 2018:09:12:13:04:24:SJ cbx_stratixii 2018:09:12:13:04:24:SJ cbx_stratixiii 2018:09:12:13:04:24:SJ cbx_stratixv 2018:09:12:13:04:24:SJ cbx_util_mgl 2018:09:12:13:04:24:SJ  VERSION_END

--synthesis_resources = reg 5 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  tx_rx_lvds_ddio_in_r8e IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clock	:	IN  STD_LOGIC;
		 datain	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataout_h	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataout_l	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0)
	 ); 
 END tx_rx_lvds_ddio_in_r8e;

 ARCHITECTURE RTL OF tx_rx_lvds_ddio_in_r8e IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 ATTRIBUTE ALTERA_ATTRIBUTE : string;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF RTL : ARCHITECTURE IS "{-to ddio_h_reg*} PLL_COMPENSATE=ON;ADV_NETLIST_OPT_ALLOWED=""NEVER_ALLOW""";

	 SIGNAL	 dataout_h_reg	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dataout_l_latch	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dataout_l_reg	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 ddio_h_reg	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF ddio_h_reg : SIGNAL IS "LVDS_RX_REGISTER=HIGH;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON";

	 SIGNAL	 ddio_l_reg	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF ddio_l_reg : SIGNAL IS "LVDS_RX_REGISTER=LOW;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON";

 BEGIN

	dataout_h <= dataout_l_reg;
	dataout_l <= dataout_h_reg;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataout_h_reg <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN dataout_h_reg <= ddio_h_reg;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataout_l_latch <= (OTHERS => '0');
		ELSIF (clock = '0' AND clock'event) THEN dataout_l_latch <= ddio_l_reg;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataout_l_reg <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN dataout_l_reg <= dataout_l_latch;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN ddio_h_reg <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN ddio_h_reg <= datain;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN ddio_l_reg <= (OTHERS => '0');
		ELSIF (clock = '0' AND clock'event) THEN ddio_l_reg <= datain;
		END IF;
	END PROCESS;

 END RTL; --tx_rx_lvds_ddio_in_r8e


--dffpipe CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" DELAY=1 WIDTH=1 clock clrn d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
--VERSION_BEGIN 18.1 cbx_mgl 2018:09:12:13:10:36:SJ cbx_stratixii 2018:09:12:13:04:24:SJ cbx_util_mgl 2018:09:12:13:04:24:SJ  VERSION_END

--synthesis_resources = reg 1 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  tx_rx_dffpipe_smf IS 
	 PORT 
	 ( 
		 clock	:	IN  STD_LOGIC := '0';
		 clrn	:	IN  STD_LOGIC := '1';
		 d	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0)
	 ); 
 END tx_rx_dffpipe_smf;

 ARCHITECTURE RTL OF tx_rx_dffpipe_smf IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 ATTRIBUTE ALTERA_ATTRIBUTE : string;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF RTL : ARCHITECTURE IS "AUTO_SHIFT_REGISTER_RECOGNITION=OFF";

	 SIGNAL	 dffe7a	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_h_dffpipe_w_lg_sclr78w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  ena	:	STD_LOGIC;
	 SIGNAL  prn	:	STD_LOGIC;
	 SIGNAL  sclr	:	STD_LOGIC;
 BEGIN

	wire_h_dffpipe_w_lg_sclr78w(0) <= NOT sclr;
	ena <= '1';
	prn <= '1';
	q <= dffe7a;
	sclr <= '0';
	PROCESS (clock, prn, clrn)
	BEGIN
		IF (prn = '0') THEN dffe7a <= (OTHERS => '1');
		ELSIF (clrn = '0') THEN dffe7a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (ena = '1') THEN dffe7a(0) <= (d(0) AND wire_h_dffpipe_w_lg_sclr78w(0));
			END IF;
		END IF;
	END PROCESS;

 END RTL; --tx_rx_dffpipe_smf


--lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX 10" lpm_modulus=8 lpm_port_updown="PORT_UNUSED" lpm_width=3 aclr clock cnt_en q
--VERSION_BEGIN 18.1 cbx_cycloneii 2018:09:12:13:04:24:SJ cbx_lpm_add_sub 2018:09:12:13:04:24:SJ cbx_lpm_compare 2018:09:12:13:04:24:SJ cbx_lpm_counter 2018:09:12:13:04:24:SJ cbx_lpm_decode 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_nadder 2018:09:12:13:04:24:SJ cbx_stratix 2018:09:12:13:04:24:SJ cbx_stratixii 2018:09:12:13:04:24:SJ  VERSION_END

 LIBRARY fiftyfivenm;
 USE fiftyfivenm.all;

--synthesis_resources = lut 3 reg 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  tx_rx_cntr_bgg IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clock	:	IN  STD_LOGIC;
		 cnt_en	:	IN  STD_LOGIC := '1';
		 q	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END tx_rx_cntr_bgg;

 ARCHITECTURE RTL OF tx_rx_cntr_bgg IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_counter_comb_bita_0combout	:	STD_LOGIC;
	 SIGNAL  wire_counter_comb_bita_1combout	:	STD_LOGIC;
	 SIGNAL  wire_counter_comb_bita_2combout	:	STD_LOGIC;
	 SIGNAL  wire_counter_comb_bita_0cout	:	STD_LOGIC;
	 SIGNAL  wire_counter_comb_bita_1cout	:	STD_LOGIC;
	 SIGNAL	 wire_counter_reg_bit_d	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL	 wire_counter_reg_bit_asdata	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL	 counter_reg_bit	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_counter_reg_bit_ena	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL	 wire_counter_reg_bit_sload	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_w_lg_sclr84w85w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_w_lg_sset80w81w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_clk_en89w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_sset82w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_sclr84w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_sset80w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_w_lg_sset82w83w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_w_lg_w_lg_sclr86w87w88w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_w_lg_sclr86w87w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_w_lg_sclr86w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  aclr_actual :	STD_LOGIC;
	 SIGNAL  clk_en	:	STD_LOGIC;
	 SIGNAL  data	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  external_cin :	STD_LOGIC;
	 SIGNAL  s_val :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  safe_q :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  sclr	:	STD_LOGIC;
	 SIGNAL  sload	:	STD_LOGIC;
	 SIGNAL  sset	:	STD_LOGIC;
	 SIGNAL  updown_dir :	STD_LOGIC;
	 COMPONENT  fiftyfivenm_lcell_comb
	 GENERIC 
	 (
		DONT_TOUCH	:	STRING := "off";
		LUT_MASK	:	STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
		SUM_LUTC_INPUT	:	STRING := "datac";
		lpm_type	:	STRING := "fiftyfivenm_lcell_comb"
	 );
	 PORT
	 ( 
		cin	:	IN STD_LOGIC := '0';
		combout	:	OUT STD_LOGIC;
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC := '0';
		datab	:	IN STD_LOGIC := '0';
		datac	:	IN STD_LOGIC := '0';
		datad	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
 BEGIN

	wire_vcc <= '1';
	loop0 : FOR i IN 0 TO 2 GENERATE 
		wire_bitslip_cntr_w_lg_w_lg_sclr84w85w(i) <= wire_bitslip_cntr_w_lg_sclr84w(0) AND wire_bitslip_cntr_w_lg_w_lg_sset82w83w(i);
	END GENERATE loop0;
	loop1 : FOR i IN 0 TO 2 GENERATE 
		wire_bitslip_cntr_w_lg_w_lg_sset80w81w(i) <= wire_bitslip_cntr_w_lg_sset80w(0) AND data(i);
	END GENERATE loop1;
	wire_bitslip_cntr_w_lg_clk_en89w(0) <= clk_en AND wire_bitslip_cntr_w_lg_w_lg_w_lg_sclr86w87w88w(0);
	loop2 : FOR i IN 0 TO 2 GENERATE 
		wire_bitslip_cntr_w_lg_sset82w(i) <= sset AND s_val(i);
	END GENERATE loop2;
	wire_bitslip_cntr_w_lg_sclr84w(0) <= NOT sclr;
	wire_bitslip_cntr_w_lg_sset80w(0) <= NOT sset;
	loop3 : FOR i IN 0 TO 2 GENERATE 
		wire_bitslip_cntr_w_lg_w_lg_sset82w83w(i) <= wire_bitslip_cntr_w_lg_sset82w(i) OR wire_bitslip_cntr_w_lg_w_lg_sset80w81w(i);
	END GENERATE loop3;
	wire_bitslip_cntr_w_lg_w_lg_w_lg_sclr86w87w88w(0) <= wire_bitslip_cntr_w_lg_w_lg_sclr86w87w(0) OR cnt_en;
	wire_bitslip_cntr_w_lg_w_lg_sclr86w87w(0) <= wire_bitslip_cntr_w_lg_sclr86w(0) OR sload;
	wire_bitslip_cntr_w_lg_sclr86w(0) <= sclr OR sset;
	aclr_actual <= aclr;
	clk_en <= '1';
	data <= (OTHERS => '0');
	external_cin <= '1';
	q <= safe_q;
	s_val <= (OTHERS => '1');
	safe_q <= counter_reg_bit;
	sclr <= '0';
	sload <= '0';
	sset <= '0';
	updown_dir <= '1';
	counter_comb_bita_0 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0101101010010000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => external_cin,
		combout => wire_counter_comb_bita_0combout,
		cout => wire_counter_comb_bita_0cout,
		dataa => counter_reg_bit(0),
		datab => updown_dir,
		datad => wire_vcc
	  );
	counter_comb_bita_1 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0101101010010000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_counter_comb_bita_0cout,
		combout => wire_counter_comb_bita_1combout,
		cout => wire_counter_comb_bita_1cout,
		dataa => counter_reg_bit(1),
		datab => updown_dir,
		datad => wire_vcc
	  );
	counter_comb_bita_2 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0101101010010000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_counter_comb_bita_1cout,
		combout => wire_counter_comb_bita_2combout,
		dataa => counter_reg_bit(2),
		datab => updown_dir,
		datad => wire_vcc
	  );
	PROCESS (clock, aclr_actual)
	BEGIN
		IF (aclr_actual = '1') THEN counter_reg_bit(0) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_counter_reg_bit_ena(0) = '1') THEN 
				IF (wire_counter_reg_bit_sload(0) = '1') THEN counter_reg_bit(0) <= wire_counter_reg_bit_asdata(0);
				ELSE counter_reg_bit(0) <= wire_counter_reg_bit_d(0);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr_actual)
	BEGIN
		IF (aclr_actual = '1') THEN counter_reg_bit(1) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_counter_reg_bit_ena(1) = '1') THEN 
				IF (wire_counter_reg_bit_sload(1) = '1') THEN counter_reg_bit(1) <= wire_counter_reg_bit_asdata(1);
				ELSE counter_reg_bit(1) <= wire_counter_reg_bit_d(1);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr_actual)
	BEGIN
		IF (aclr_actual = '1') THEN counter_reg_bit(2) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_counter_reg_bit_ena(2) = '1') THEN 
				IF (wire_counter_reg_bit_sload(2) = '1') THEN counter_reg_bit(2) <= wire_counter_reg_bit_asdata(2);
				ELSE counter_reg_bit(2) <= wire_counter_reg_bit_d(2);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	wire_counter_reg_bit_asdata <= wire_bitslip_cntr_w_lg_w_lg_sclr84w85w;
	wire_counter_reg_bit_d <= ( wire_counter_comb_bita_2combout & wire_counter_comb_bita_1combout & wire_counter_comb_bita_0combout);
	loop4 : FOR i IN 0 TO 2 GENERATE
		wire_counter_reg_bit_ena(i) <= wire_bitslip_cntr_w_lg_clk_en89w(0);
	END GENERATE loop4;
	loop5 : FOR i IN 0 TO 2 GENERATE
		wire_counter_reg_bit_sload(i) <= wire_bitslip_cntr_w_lg_w_lg_sclr86w87w(0);
	END GENERATE loop5;

 END RTL; --tx_rx_cntr_bgg


--lpm_mux CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX 10" LPM_SIZE=8 LPM_WIDTH=1 LPM_WIDTHS=3 data result sel
--VERSION_BEGIN 18.1 cbx_lpm_mux 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ  VERSION_END

--synthesis_resources = lut 5 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  tx_rx_mux_5nd IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 sel	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0')
	 ); 
 END tx_rx_mux_5nd;

 ARCHITECTURE RTL OF tx_rx_mux_5nd IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_h_mux5a_w_lg_w_lg_w_sel_node_range105w178w179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_result141w155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_result162w172w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_sel_node_range105w180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_data135w_range149w150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_data136w_range166w167w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range145w146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range145w165w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_result141w156w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_result162w173w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_sel_node_range105w178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range143w147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range145w148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_data135w_range153w154w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_data136w_range170w171w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range143w144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_lg_w_w_sel137w_range143w164w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  result_node :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  sel_ffs_wire :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  sel_node :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  w_data106w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  w_data135w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  w_data136w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  w_result107w :	STD_LOGIC;
	 SIGNAL  w_result133w :	STD_LOGIC;
	 SIGNAL  w_result134w :	STD_LOGIC;
	 SIGNAL  w_result141w :	STD_LOGIC;
	 SIGNAL  w_result162w :	STD_LOGIC;
	 SIGNAL  w_sel137w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_sel_node_range105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data135w_range149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data135w_range142w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data135w_range153w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data136w_range166w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data136w_range163w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_data136w_range170w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_sel137w_range143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_w_w_sel137w_range145w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_h_mux5a_w_lg_w_lg_w_sel_node_range105w178w179w(0) <= wire_h_mux5a_w_lg_w_sel_node_range105w178w(0) AND w_result133w;
	wire_h_mux5a_w_lg_w_result141w155w(0) <= w_result141w AND wire_h_mux5a_w_lg_w_w_data135w_range153w154w(0);
	wire_h_mux5a_w_lg_w_result162w172w(0) <= w_result162w AND wire_h_mux5a_w_lg_w_w_data136w_range170w171w(0);
	wire_h_mux5a_w_lg_w_sel_node_range105w180w(0) <= wire_h_mux5a_w_sel_node_range105w(0) AND w_result134w;
	wire_h_mux5a_w_lg_w_w_data135w_range149w150w(0) <= wire_h_mux5a_w_w_data135w_range149w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range145w148w(0);
	wire_h_mux5a_w_lg_w_w_data136w_range166w167w(0) <= wire_h_mux5a_w_w_data136w_range166w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range145w148w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range145w146w(0) <= wire_h_mux5a_w_w_sel137w_range145w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range143w144w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range145w165w(0) <= wire_h_mux5a_w_w_sel137w_range145w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range143w164w(0);
	wire_h_mux5a_w_lg_w_result141w156w(0) <= NOT w_result141w;
	wire_h_mux5a_w_lg_w_result162w173w(0) <= NOT w_result162w;
	wire_h_mux5a_w_lg_w_sel_node_range105w178w(0) <= NOT wire_h_mux5a_w_sel_node_range105w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range143w147w(0) <= NOT wire_h_mux5a_w_w_sel137w_range143w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range145w148w(0) <= NOT wire_h_mux5a_w_w_sel137w_range145w(0);
	wire_h_mux5a_w_lg_w_w_data135w_range153w154w(0) <= wire_h_mux5a_w_w_data135w_range153w(0) OR wire_h_mux5a_w_lg_w_w_sel137w_range143w147w(0);
	wire_h_mux5a_w_lg_w_w_data136w_range170w171w(0) <= wire_h_mux5a_w_w_data136w_range170w(0) OR wire_h_mux5a_w_lg_w_w_sel137w_range143w147w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range143w144w(0) <= wire_h_mux5a_w_w_sel137w_range143w(0) OR wire_h_mux5a_w_w_data135w_range142w(0);
	wire_h_mux5a_w_lg_w_w_sel137w_range143w164w(0) <= wire_h_mux5a_w_w_sel137w_range143w(0) OR wire_h_mux5a_w_w_data136w_range163w(0);
	result <= result_node;
	result_node(0) <= ( w_result107w);
	sel_ffs_wire <= ( sel(2 DOWNTO 0));
	sel_node <= ( sel_ffs_wire(2) & sel(1 DOWNTO 0));
	w_data106w <= ( data(7 DOWNTO 0));
	w_data135w <= w_data106w(3 DOWNTO 0);
	w_data136w <= w_data106w(7 DOWNTO 4);
	w_result107w <= (wire_h_mux5a_w_lg_w_sel_node_range105w180w(0) OR wire_h_mux5a_w_lg_w_lg_w_sel_node_range105w178w179w(0));
	w_result133w <= (((w_data135w(1) AND w_sel137w(0)) AND wire_h_mux5a_w_lg_w_result141w156w(0)) OR wire_h_mux5a_w_lg_w_result141w155w(0));
	w_result134w <= (((w_data136w(1) AND w_sel137w(0)) AND wire_h_mux5a_w_lg_w_result162w173w(0)) OR wire_h_mux5a_w_lg_w_result162w172w(0));
	w_result141w <= ((wire_h_mux5a_w_lg_w_w_data135w_range149w150w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range143w147w(0)) OR wire_h_mux5a_w_lg_w_w_sel137w_range145w146w(0));
	w_result162w <= ((wire_h_mux5a_w_lg_w_w_data136w_range166w167w(0) AND wire_h_mux5a_w_lg_w_w_sel137w_range143w147w(0)) OR wire_h_mux5a_w_lg_w_w_sel137w_range145w165w(0));
	w_sel137w <= sel_node(1 DOWNTO 0);
	wire_h_mux5a_w_sel_node_range105w(0) <= sel_node(2);
	wire_h_mux5a_w_w_data135w_range149w(0) <= w_data135w(0);
	wire_h_mux5a_w_w_data135w_range142w(0) <= w_data135w(2);
	wire_h_mux5a_w_w_data135w_range153w(0) <= w_data135w(3);
	wire_h_mux5a_w_w_data136w_range166w(0) <= w_data136w(0);
	wire_h_mux5a_w_w_data136w_range163w(0) <= w_data136w(2);
	wire_h_mux5a_w_w_data136w_range170w(0) <= w_data136w(3);
	wire_h_mux5a_w_w_sel137w_range143w(0) <= w_sel137w(0);
	wire_h_mux5a_w_w_sel137w_range145w(0) <= w_sel137w(1);

 END RTL; --tx_rx_mux_5nd

 LIBRARY fiftyfivenm;
 USE fiftyfivenm.all;

--synthesis_resources = fiftyfivenm_pll 1 lut 13 reg 39 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  tx_rx IS 
	 PORT 
	 ( 
		 pll_areset	:	IN  STD_LOGIC := '0';
		 rx_cda_reset	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '0');
		 rx_channel_data_align	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '0');
		 rx_data_align	:	IN  STD_LOGIC := '0';
		 rx_data_align_reset	:	IN  STD_LOGIC := '0';
		 rx_in	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 rx_inclock	:	IN  STD_LOGIC;
		 rx_locked	:	OUT  STD_LOGIC;
		 rx_out	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 rx_outclock	:	OUT  STD_LOGIC
	 ); 
 END tx_rx;

 ARCHITECTURE RTL OF tx_rx IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 ATTRIBUTE ALTERA_ATTRIBUTE : string;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF RTL : ARCHITECTURE IS "AUTO_SHIFT_REGISTER_RECOGNITION=OFF;SUPPRESS_DA_RULE_INTERNAL=C104;{-to lvds_rx_pll} AUTO_MERGE_PLLS=ON";

	 SIGNAL  wire_ddio_in_dataout_h	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_ddio_in_dataout_l	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 cda_h_shiftreg3a	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 cda_l_shiftreg4a	:	STD_LOGIC_VECTOR(3 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 h_shiftreg2a	:	STD_LOGIC_VECTOR(3 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 int_bitslip_reg	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_int_bitslip_reg_w_lg_q9w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 int_da_reset_reg0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 int_da_reset_reg1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 int_sync_reg0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 int_sync_reg1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 l_shiftreg1a	:	STD_LOGIC_VECTOR(3 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pll_lock_sync	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF pll_lock_sync : SIGNAL IS "SUPPRESS_DA_RULE_INTERNAL=D103";

	 SIGNAL	 rx_reg	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_h_dffpipe_clrn	:	STD_LOGIC;
	 SIGNAL  wire_h_dffpipe_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_l_dffpipe_clrn	:	STD_LOGIC;
	 SIGNAL  wire_l_dffpipe_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bitslip_cntr_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_h_mux5a_result	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_l_mux6a_data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_l_mux6a_result	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lvds_rx_pll_clk	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_lvds_rx_pll_fbout	:	STD_LOGIC;
	 SIGNAL  wire_lvds_rx_pll_inclk	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_lvds_rx_pll_locked	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_reset11w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  bitslip :	STD_LOGIC;
	 SIGNAL  bitslip_en :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  ddio_dataout_h :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  ddio_dataout_h_int :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  ddio_dataout_l :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  ddio_dataout_l_int :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  fast_clock :	STD_LOGIC;
	 SIGNAL  int_bitslip :	STD_LOGIC;
	 SIGNAL  rx_out_wire :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  slow_clock :	STD_LOGIC;
	 SIGNAL  w_reset :	STD_LOGIC;
	 COMPONENT  tx_rx_lvds_ddio_in_r8e
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clock	:	IN  STD_LOGIC;
		datain	:	IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
		dataout_h	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		dataout_l	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  tx_rx_dffpipe_smf
	 PORT
	 ( 
		clock	:	IN  STD_LOGIC := '0';
		clrn	:	IN  STD_LOGIC := '1';
		d	:	IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  tx_rx_cntr_bgg
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clock	:	IN  STD_LOGIC;
		cnt_en	:	IN  STD_LOGIC := '1';
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  tx_rx_mux_5nd
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		sel	:	IN  STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
	 COMPONENT  fiftyfivenm_pll
	 GENERIC 
	 (
		CLK0_DIVIDE_BY	:	NATURAL := 1;
		CLK0_MULTIPLY_BY	:	NATURAL := 0;
		CLK0_PHASE_SHIFT	:	STRING := "UNUSED";
		CLK1_DIVIDE_BY	:	NATURAL := 1;
		CLK1_MULTIPLY_BY	:	NATURAL := 0;
		CLK1_PHASE_SHIFT	:	STRING := "UNUSED";
		INCLK0_INPUT_FREQUENCY	:	NATURAL := 0;
		OPERATION_MODE	:	STRING := "normal";
		self_reset_on_loss_lock	:	STRING := "off"
	 );
	 PORT
	 ( 
		areset	:	IN  STD_LOGIC := '0';
		clk	:	OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		fbin	:	IN  STD_LOGIC := '0';
		fbout	:	OUT  STD_LOGIC;
		inclk	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
		locked	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	wire_w_lg_w_reset11w(0) <= NOT w_reset;
	bitslip <= (wire_int_bitslip_reg_w_lg_q9w(0) AND int_bitslip);
	bitslip_en <= wire_bitslip_cntr_q;
	ddio_dataout_h <= wire_h_dffpipe_q;
	ddio_dataout_h_int <= wire_ddio_in_dataout_h;
	ddio_dataout_l <= wire_l_dffpipe_q;
	ddio_dataout_l_int <= wire_ddio_in_dataout_l;
	fast_clock <= wire_lvds_rx_pll_clk(0);
	int_bitslip <= int_sync_reg1;
	rx_locked <= (wire_lvds_rx_pll_locked AND pll_lock_sync);
	rx_out <= rx_reg;
	rx_out_wire <= ( l_shiftreg1a(3) & h_shiftreg2a(3) & l_shiftreg1a(2) & h_shiftreg2a(2) & l_shiftreg1a(1) & h_shiftreg2a(1) & l_shiftreg1a(0) & h_shiftreg2a(0));
	rx_outclock <= slow_clock;
	slow_clock <= wire_lvds_rx_pll_clk(1);
	w_reset <= pll_areset;
	ddio_in :  tx_rx_lvds_ddio_in_r8e
	  PORT MAP ( 
		aclr => w_reset,
		clock => fast_clock,
		datain => rx_in,
		dataout_h => wire_ddio_in_dataout_h,
		dataout_l => wire_ddio_in_dataout_l
	  );
	PROCESS (fast_clock, w_reset)
	BEGIN
		IF (w_reset = '1') THEN cda_h_shiftreg3a <= (OTHERS => '0');
		ELSIF (fast_clock = '1' AND fast_clock'event) THEN cda_h_shiftreg3a <= ( cda_h_shiftreg3a(1 DOWNTO 0) & ddio_dataout_h(0));
		END IF;
	END PROCESS;
	PROCESS (fast_clock, w_reset)
	BEGIN
		IF (w_reset = '1') THEN cda_l_shiftreg4a <= (OTHERS => '0');
		ELSIF (fast_clock = '1' AND fast_clock'event) THEN cda_l_shiftreg4a <= ( cda_l_shiftreg4a(2 DOWNTO 0) & ddio_dataout_l(0));
		END IF;
	END PROCESS;
	PROCESS (fast_clock, w_reset)
	BEGIN
		IF (w_reset = '1') THEN h_shiftreg2a <= (OTHERS => '0');
		ELSIF (fast_clock = '1' AND fast_clock'event) THEN h_shiftreg2a <= ( h_shiftreg2a(2 DOWNTO 0) & wire_l_mux6a_result);
		END IF;
	END PROCESS;
	PROCESS (fast_clock)
	BEGIN
		IF (fast_clock = '1' AND fast_clock'event) THEN int_bitslip_reg <= int_bitslip;
		END IF;
	END PROCESS;
	wire_int_bitslip_reg_w_lg_q9w(0) <= NOT int_bitslip_reg;
	PROCESS (fast_clock)
	BEGIN
		IF (fast_clock = '1' AND fast_clock'event) THEN int_da_reset_reg0 <= rx_data_align_reset;
		END IF;
	END PROCESS;
	PROCESS (fast_clock)
	BEGIN
		IF (fast_clock = '1' AND fast_clock'event) THEN int_da_reset_reg1 <= int_da_reset_reg0;
		END IF;
	END PROCESS;
	PROCESS (fast_clock)
	BEGIN
		IF (fast_clock = '1' AND fast_clock'event) THEN int_sync_reg0 <= rx_data_align;
		END IF;
	END PROCESS;
	PROCESS (fast_clock)
	BEGIN
		IF (fast_clock = '1' AND fast_clock'event) THEN int_sync_reg1 <= int_sync_reg0;
		END IF;
	END PROCESS;
	PROCESS (fast_clock, w_reset)
	BEGIN
		IF (w_reset = '1') THEN l_shiftreg1a <= (OTHERS => '0');
		ELSIF (fast_clock = '1' AND fast_clock'event) THEN l_shiftreg1a <= ( l_shiftreg1a(2 DOWNTO 0) & wire_h_mux5a_result);
		END IF;
	END PROCESS;
	PROCESS (wire_lvds_rx_pll_locked, pll_areset)
	BEGIN
		IF (pll_areset = '1') THEN pll_lock_sync <= '0';
		ELSIF (wire_lvds_rx_pll_locked = '1' AND wire_lvds_rx_pll_locked'event) THEN pll_lock_sync <= '1';
		END IF;
	END PROCESS;
	PROCESS (slow_clock, w_reset)
	BEGIN
		IF (w_reset = '1') THEN rx_reg <= (OTHERS => '0');
		ELSIF (slow_clock = '1' AND slow_clock'event) THEN rx_reg <= rx_out_wire;
		END IF;
	END PROCESS;
	wire_h_dffpipe_clrn <= wire_w_lg_w_reset11w(0);
	h_dffpipe :  tx_rx_dffpipe_smf
	  PORT MAP ( 
		clock => fast_clock,
		clrn => wire_h_dffpipe_clrn,
		d => ddio_dataout_h_int,
		q => wire_h_dffpipe_q
	  );
	wire_l_dffpipe_clrn <= wire_w_lg_w_reset11w(0);
	l_dffpipe :  tx_rx_dffpipe_smf
	  PORT MAP ( 
		clock => fast_clock,
		clrn => wire_l_dffpipe_clrn,
		d => ddio_dataout_l_int,
		q => wire_l_dffpipe_q
	  );
	bitslip_cntr :  tx_rx_cntr_bgg
	  PORT MAP ( 
		aclr => int_da_reset_reg1,
		clock => fast_clock,
		cnt_en => bitslip,
		q => wire_bitslip_cntr_q
	  );
	wire_h_mux5a_data <= ( cda_l_shiftreg4a(3) & cda_h_shiftreg3a(2) & cda_l_shiftreg4a(2) & cda_h_shiftreg3a(1) & cda_l_shiftreg4a(1) & cda_h_shiftreg3a(0) & cda_l_shiftreg4a(0) & ddio_dataout_h(0));
	h_mux5a :  tx_rx_mux_5nd
	  PORT MAP ( 
		data => wire_h_mux5a_data,
		result => wire_h_mux5a_result,
		sel => bitslip_en
	  );
	wire_l_mux6a_data <= ( cda_h_shiftreg3a(2) & cda_l_shiftreg4a(2) & cda_h_shiftreg3a(1) & cda_l_shiftreg4a(1) & cda_h_shiftreg3a(0) & cda_l_shiftreg4a(0) & ddio_dataout_h(0) & ddio_dataout_l(0));
	l_mux6a :  tx_rx_mux_5nd
	  PORT MAP ( 
		data => wire_l_mux6a_data,
		result => wire_l_mux6a_result,
		sel => bitslip_en
	  );
	wire_lvds_rx_pll_inclk <= ( "0" & rx_inclock);
	lvds_rx_pll :  fiftyfivenm_pll
	  GENERIC MAP (
		CLK0_DIVIDE_BY => 1,
		CLK0_MULTIPLY_BY => 1,
		CLK0_PHASE_SHIFT => "-1250",
		CLK1_DIVIDE_BY => 4,
		CLK1_MULTIPLY_BY => 1,
		CLK1_PHASE_SHIFT => "-1250",
		INCLK0_INPUT_FREQUENCY => 5000,
		OPERATION_MODE => "source_synchronous",
		self_reset_on_loss_lock => "off"
	  )
	  PORT MAP ( 
		areset => pll_areset,
		clk => wire_lvds_rx_pll_clk,
		fbin => wire_lvds_rx_pll_fbout,
		fbout => wire_lvds_rx_pll_fbout,
		inclk => wire_lvds_rx_pll_inclk,
		locked => wire_lvds_rx_pll_locked
	  );

 END RTL; --tx_rx
--VALID FILE
