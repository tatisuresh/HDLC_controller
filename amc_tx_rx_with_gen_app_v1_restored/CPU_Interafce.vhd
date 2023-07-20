----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2021 19:06:46
-- Design Name: 
-- Module Name: CPU_Interafce - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith .all;
use work.hdlc_package.all;

entity CPU_Interafce is
  Port (Clk33mhz_in    : in std_logic; -- clock input
        sig_clk33mhz   : in std_logic;
        sig_clk99mhz   : in std_logic;
        Reset_n_in     : in std_logic; -- reset active low input
        Cs_n_in        : in std_logic; --chip select active low
        Data_inout     : inout std_logic_vector(15 downto 0); -- data in out
        Addr_A7A0      : in std_logic_vector(7 downto 0); -- address a6 to a1
        --A0_ble_n_in    : in std_logic;-- address a0
        Bhe_n_in       : in  std_logic;-- Intel high byte enable(16 bit mode)
        Read_ENn_in    : in  std_logic;-- Read enable(in Intel mode)
        Write_ENn_in   : in  std_logic;-- Write enable(in Intel mode)
        Int_n_out      : out std_logic;-- Interrupt output
        --Ready_n_in     : in std_logic;-- Intel bus mode connected to 1
        Ready_n_out    : out std_logic;-- Intel bus mode connected to 1
        -- HDLC Receive Serial Interface
        --RxClk            : in  std_logic; -- Receive Serial Clock
        RxData         : in  std_logic; -- Receive Serial Data
        -- HDLC Transmit Serial Interface
        --TxClk            : in  std_logic; -- Transmit Serial Clock
        TxData         : out std_logic; -- Transmit Serial Data
	     --LED_out        : out std_logic_vector(3 downto 0); -- led for debug only
		  sig_clk160mhz  : in std_logic;
		  pin_124_in     : in std_logic;
		  pin_127_out    : out std_logic;
		  pin_136_out    : out std_logic;
		  sig_clk680khz  : in std_logic;
		  pin_138_out    : out std_logic;
		  pin_98_out     : out std_logic;
		  pin_111_out    : out std_logic
		  
         );
end CPU_Interafce;

architecture Behavioral of CPU_Interafce is

--debug address
constant C_debug_1         :std_logic_vector(7 downto 0):=x"20";--x"02";--R
constant C_debug_2         :std_logic_vector(7 downto 0):=x"24";--x"04";--R
constant C_debug_3         :std_logic_vector(7 downto 0):=x"26";--x"06";--R
constant C_debug_4         :std_logic_vector(7 downto 0):=x"28";--x"08";--R
constant C_debug_5         :std_logic_vector(7 downto 0):=x"2a";--x"0a";--R
constant C_debug_6         :std_logic_vector(7 downto 0):=x"2c";--x"0c";--R
constant C_debug_7         :std_logic_vector(7 downto 0):=x"2e";--x"0c";--R

---------------------------------------------
--debug signal
---------------------------------------------
signal sig_debug_1 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_2 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_3 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_4 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_5 :std_logic_vector(15 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_6 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_7 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_8 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_9 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_10 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_11 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_12 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_13 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
signal sig_debug_14 :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R
---------------------------------------------
--GLOBLE ADDRESS
---------------------------------------------
constant C_addrG_CMDR_MODE  :std_logic_vector(7 downto 0):=x"00";--R/W
constant C_addrG_STAR       :std_logic_vector(7 downto 0):=x"02";--R
constant C_addrG_GPDIR      :std_logic_vector(7 downto 0):=x"04";--R/W
constant C_addrG_VER0       :std_logic_vector(7 downto 0):=x"EC";--R
constant C_addrG_VER2       :std_logic_vector(7 downto 0):=x"EE";--R
---------------------------------------------
--CHANNEL A address
---------------------------------------------
constant C_addrA_TX_RX_FIFO :std_logic_vector(7 downto 0):=x"10";--R/W
constant C_addrA_STAR       :std_logic_vector(7 downto 0):=x"12";--R
constant C_addrA_CMDR       :std_logic_vector(7 downto 0):=x"14";--R/W
constant C_addrA_CCR0       :std_logic_vector(7 downto 0):=x"16";--R/W
constant C_addrA_CCR1       :std_logic_vector(7 downto 0):=x"18";--R/W
constant C_addrA_CCR2       :std_logic_vector(7 downto 0):=x"1a";--R/W
constant C_addrA_CCR3       :std_logic_vector(7 downto 0):=x"1c";--R/W
constant C_addrA_BRR        :std_logic_vector(7 downto 0):=x"38";--R/W
constant C_addrA_ISR0       :std_logic_vector(7 downto 0):=x"50";--R
constant C_addrA_ISR2       :std_logic_vector(7 downto 0):=x"52";--R
constant C_addrA_IMR0       :std_logic_vector(7 downto 0):=x"54";--R/W
constant C_addrA_IMR2       :std_logic_vector(7 downto 0):=x"56";--R/W
constant C_addrA_RSTA       :std_logic_vector(7 downto 0):=x"58";--R  
constant C_addrA_RBC        :std_logic_vector(7 downto 0):=x"c6";--R  
---------------------------------------------
--CHANNEL B address
---------------------------------------------
constant C_addrB_TX_RX_FIFO :std_logic_vector(7 downto 0):=x"60";--R
constant C_addrB_STAR       :std_logic_vector(7 downto 0):=x"62";--R
constant C_addrB_CMDR       :std_logic_vector(7 downto 0):=x"64";--R/W
constant C_addrB_CCR0       :std_logic_vector(7 downto 0):=x"66";--R/W
constant C_addrB_CCR1       :std_logic_vector(7 downto 0):=x"68";--R/W
constant C_addrB_CCR2       :std_logic_vector(7 downto 0):=x"6a";--R/W
constant C_addrB_CCR3       :std_logic_vector(7 downto 0):=x"6c";--R/W
constant C_addrB_BRR        :std_logic_vector(7 downto 0):=x"88";--R/W
constant C_addrB_ISR0       :std_logic_vector(7 downto 0):=x"A0";--R
constant C_addrB_ISR2       :std_logic_vector(7 downto 0):=x"A2";--R
constant C_addrB_IMR0       :std_logic_vector(7 downto 0):=x"A4";--R/W
constant C_addrB_IMR2       :std_logic_vector(7 downto 0):=x"A6";--R/W
constant C_addrB_RSTA       :std_logic_vector(7 downto 0):=x"A8";--R
constant C_addrB_RBC        :std_logic_vector(7 downto 0):=x"E0";--R  

---------------------------------------------
signal sig_debug_count :integer range 0 to 15;
---------------------------------------------

---------------------------------------------
--GLOBLE REGISTER READ WRITE ARE BASED ON CPU ACCESS
---------------------------------------------
signal sig_Addr_A7A0    :std_logic_vector(7 downto 0);
signal sig_Write_ENn_in :std_logic;
signal sig_Read_ENn_in  :std_logic;
signal sig_Cs_n_in      :std_logic;
signal sig_Cs_n_in_d    :std_logic;
signal sig_Bhe_n_in     :std_logic;

signal sig_Read_ENn_in2  :std_logic;
signal sig_Cs_n_in2      :std_logic;


signal regG_CMDR    :std_logic_vector(7 downto 0);--addr 0x00 RESET=0x00 R/W
signal regG_MODE    :std_logic_vector(7 downto 0);--addr 0x01 RESET=0x0B R/W
signal regG_STAR    :std_logic_vector(7 downto 0);--addr 0x03 RESET=0x00 R
signal regG_GPDIRL  :std_logic_vector(7 downto 0);--addr 0x04 RESET=0x07 R/W

signal regA_GPISL_L :std_logic_vector(7 downto 0);--addr 0x0A RESET=0x00 R
signal regA_GPISL_H :std_logic_vector(7 downto 0);--addr 0x0B RESET=0x00 R
 
signal regG_VER0    :std_logic_vector(7 downto 0);--addr 0xEC RESET=0x03 R 
signal regG_VER1    :std_logic_vector(7 downto 0);--addr 0xED RESET=0xF0 R 
signal regG_VER2    :std_logic_vector(7 downto 0);--addr 0xEE RESET=0x05 R 
signal regG_VER3    :std_logic_vector(7 downto 0);--addr 0xEF RESET=0x20 R 

---------------------------------------------
--REGISTER FOR CHANNEL 'A'
---------------------------------------------

signal regA_TX_RX_FIFO_L :std_logic_vector(7 downto 0);--addr 0x10
signal regA_TX_RX_FIFO_H :std_logic_vector(7 downto 0);--addr 0x11

signal regA_STARL :std_logic_vector(7 downto 0);--addr 0x12 RESET=0x00 R 
signal regA_STARH :std_logic_vector(7 downto 0);--addr 0x13 RESET=0x10 R 
signal regA_CMDRL :std_logic_vector(7 downto 0);--addr 0x14 RESET=0x00 R/W
signal regA_CMDRH :std_logic_vector(7 downto 0);--addr 0x15 RESET=0x00 R/W
signal regA_CCR0L :std_logic_vector(7 downto 0);--addr 0x16 RESET=0x00 R/W
signal regA_CCR0H :std_logic_vector(7 downto 0);--addr 0x17 RESET=0x00 R/W
signal regA_CCR1L :std_logic_vector(7 downto 0);--addr 0x18 RESET=0x00 R/W
signal regA_CCR1H :std_logic_vector(7 downto 0);--addr 0x19 RESET=0x00 R/W
signal regA_CCR2L :std_logic_vector(7 downto 0);--addr 0x1A RESET=0x00 R/W
signal regA_CCR2H :std_logic_vector(7 downto 0);--addr 0x1B RESET=0x00 R/W
signal regA_CCR3L :std_logic_vector(7 downto 0);--addr 0x1C RESET=0x00 R/W
signal regA_CCR3H :std_logic_vector(7 downto 0);--addr 0x1D RESET=0x00 R/W

signal regA_BRRL  :std_logic_vector(7 downto 0);--addr 0x38 RESET=0x00 R/W
signal regA_BRRH  :std_logic_vector(7 downto 0);--addr 0x39 RESET=0x00 R/W**

signal regA_ISR0  :std_logic_vector(7 downto 0);--addr 0x50 RESET=0x00 R 
signal regA_ISR1  :std_logic_vector(7 downto 0);--addr 0x51 RESET=0x00 R 
signal regA_ISR2  :std_logic_vector(7 downto 0);--addr 0x52 RESET=0x00 R 
          
signal regA_IMR0  :std_logic_vector(7 downto 0);--addr 0x54 RESET=0xFF R/W
signal regA_IMR1  :std_logic_vector(7 downto 0);--addr 0x55 RESET=0xFF R/W
signal regA_IMR2  :std_logic_vector(7 downto 0);--addr 0x56 RESET=0x03 R/W

signal regA_RSTA  :std_logic_vector(7 downto 0);--addr 0x58 RESET=0x00 R
signal regA_RBCL  :std_logic_vector(15 downto 0);--addr 0xC6 RESET=0x00 R
--signal regA_RBCH  :std_logic_vector(7 downto 0);--addr 0xC7 RESET=0x00 R

attribute syn_keep : boolean;

attribute syn_keep of regG_CMDR  : signal is true;
attribute syn_keep of regG_MODE  : signal is true;
attribute syn_keep of regG_STAR  : signal is true;
attribute syn_keep of regG_GPDIRL: signal is true;
attribute syn_keep of regG_VER0  : signal is true;
attribute syn_keep of regG_VER1  : signal is true;
attribute syn_keep of regG_VER2  : signal is true;
attribute syn_keep of regG_VER3  : signal is true;

attribute syn_keep of regA_STARL : signal is true;
attribute syn_keep of regA_STARH : signal is true;
attribute syn_keep of regA_CMDRL : signal is true;
attribute syn_keep of regA_CMDRH : signal is true;
attribute syn_keep of regA_CCR0L : signal is true;
attribute syn_keep of regA_CCR0H : signal is true;
attribute syn_keep of regA_CCR1L : signal is true;
attribute syn_keep of regA_CCR1H : signal is true;
attribute syn_keep of regA_CCR2L : signal is true;
attribute syn_keep of regA_CCR2H : signal is true;
attribute syn_keep of regA_CCR3L : signal is true;
attribute syn_keep of regA_CCR3H : signal is true;
attribute syn_keep of regA_BRRL  : signal is true;
attribute syn_keep of regA_BRRH  : signal is true;
attribute syn_keep of regA_ISR0  : signal is true;
attribute syn_keep of regA_ISR1  : signal is true;
attribute syn_keep of regA_ISR2  : signal is true;  
attribute syn_keep of regA_IMR0  : signal is true;
attribute syn_keep of regA_IMR1  : signal is true;
attribute syn_keep of regA_IMR2  : signal is true;
attribute syn_keep of regA_RSTA  : signal is true;
attribute syn_keep of regA_RBCL  : signal is true;

---------------------------------------------
--REGISTER FOR CHANNEL 'B'
---------------------------------------------
signal regB_TX_RX_FIFO_L :std_logic_vector(7 downto 0);--addr 0x60
signal regB_TX_RX_FIFO_H :std_logic_vector(7 downto 0);--addr 0x61
          
signal regB_STARL :std_logic_vector(7 downto 0);--addr 0x62 RESET=0x00 R   
signal regB_STARH :std_logic_vector(7 downto 0);--addr 0x63 RESET=0x10 R   
signal regB_CMDRL :std_logic_vector(7 downto 0);--addr 0x64 RESET=0x00 R/W 
signal regB_CMDRH :std_logic_vector(7 downto 0);--addr 0x65 RESET=0x00 R/W 
signal regB_CCR0L :std_logic_vector(7 downto 0);--addr 0x66 RESET=0x00 R/W 
signal regB_CCR0H :std_logic_vector(7 downto 0);--addr 0x67 RESET=0x00 R/W 
signal regB_CCR1L :std_logic_vector(7 downto 0);--addr 0x68 RESET=0x00 R/W 
signal regB_CCR1H :std_logic_vector(7 downto 0);--addr 0x69 RESET=0x00 R/W 
signal regB_CCR2L :std_logic_vector(7 downto 0);--addr 0x6A RESET=0x00 R/W 
signal regB_CCR2H :std_logic_vector(7 downto 0);--addr 0x6B RESET=0x00 R/W 
signal regB_CCR3L :std_logic_vector(7 downto 0);--addr 0x6C RESET=0x00 R/W 
signal regB_CCR3H :std_logic_vector(7 downto 0);--addr 0x6D RESET=0x00 R/W 

signal regB_BRRL  :std_logic_vector(7 downto 0);--addr 0x88 RESET=0x00 R/W  
signal regB_BRRH  :std_logic_vector(7 downto 0);--addr 0x89 RESET=0x00 R/W**

signal regB_ISR0  :std_logic_vector(7 downto 0);--addr 0xA0 RESET=0x00 R
signal regB_ISR1  :std_logic_vector(7 downto 0);--addr 0xA1 RESET=0x00 R
signal regB_ISR2  :std_logic_vector(7 downto 0);--addr 0xA2 RESET=0x00 R

signal regB_IMR0  :std_logic_vector(7 downto 0);--addr 0xA4 RESET=0xFF R/W
signal regB_IMR1  :std_logic_vector(7 downto 0);--addr 0xA5 RESET=0xFF R/W
signal regB_IMR2  :std_logic_vector(7 downto 0);--addr 0xA6 RESET=0x03 R/W

signal regB_RSTA  :std_logic_vector(7 downto 0);--addr 0xA8 RESET=0x00 R
signal regB_RBCL  :std_logic_vector(7 downto 0);--addr 0xE0 RESET=0x00 R

---------------------------------------------
---Globle  signal   
---------------------------------------------
signal sig_led_cnt         :std_logic_vector(3 downto 0);
signal sig_clk_cnt         :integer;

---------------------------------------------
---reset  signal   
---------------------------------------------
signal sig_reset           :std_logic;
signal soft_reset1         :std_logic:= '0';
signal soft_reset2         :std_logic:= '0';
signal soft_reset3         :std_logic:= '0';
signal sig_Tx_Reset        :std_logic:= '0';
signal sig_Rx_Reset        :std_logic:= '0';

signal sig_Rx_Reset1       :std_logic:= '0';
signal sig_Tx_Reset1       :std_logic:= '0';

---------------------------------------------
--clock gen signal 
---------------------------------------------
signal sig_aTxClk           :std_logic;
signal sig_aRxClk           :std_logic;
signal sig_aRxData          :std_logic;
signal sig_aRxData1         :std_logic;
signal sig_aRxData2         :std_logic;
signal sig_aRxData3         :std_logic;
signal sig_aRxData4         :std_logic_vector(0 downto 0);
signal sig_aRxData5         :std_logic_vector(0 downto 0);
signal sig_aRxData6         :std_logic;
signal sig_aRxData7         :std_logic;
signal sig_aRxData8         :std_logic;
signal sig_aRxData9         :std_logic;
signal sig_aRxData10        :std_logic;
signal sig_aRxData11        :std_logic;

signal tx_acounter          :integer range 0 to 255;
signal rx_acounter          :integer range 0 to 255;
signal cdr_fifo_rcount      :integer range 0 to 1;

--nriz decoding signal
signal rxd_nrzi             :std_logic;
signal rxd_nrzi_1           :std_logic;
signal cdr_fifo_wr          :std_logic;
signal cdr_fifo_rd          :std_logic;
signal cdr_fifo_rdcnt        :std_logic_vector(8 downto 0);
signal cdr_fifo_wdcnt        :std_logic_vector(8 downto 0);
signal cdr_fifo_rdcnt_1      :std_logic_vector(2 downto 0);
signal cdr_fifo_rdcnt_2      :std_logic_vector(2 downto 0);
signal rdempty               :std_logic;
signal rdfull                :std_logic;
type  cdr_fifo_state is (cdr_fifo1, cdr_fifo2, cdr_fifo3);
signal cdr_fifo_nxstate          :cdr_fifo_state;
---------------------------------------------
---channe; 'A' Tx fifo signal  
---------------------------------------------
signal sig_txafifo_wdata    :std_logic_vector(15 downto 0);
signal sig_txafifo_rdata    :std_logic_vector(7 downto 0);
signal sig_txafifo_rdata1   :std_logic_vector(7 downto 0);
signal sig_txafifo_rdata2   :std_logic_vector(7 downto 0);
signal sig_txafifo_lwenb    :std_logic;
signal sig_txafifo_lwenb1   :std_logic;
signal sig_txafifo_lwenb2   :std_logic;
signal sig_txafifo_lwenb3   :std_logic;
signal sig_txafifo_wenb     :std_logic;

signal sig_txafifo_hwenb    :std_logic;
signal sig_txafifo_hwenb1   :std_logic;
signal sig_txafifo_hwenb2   :std_logic;
signal sig_txafifo_hwenb3   :std_logic;
signal sig_txafifo_renb     :std_logic;
signal sig_txafifo_renb1    :std_logic;
signal sig_txafifo_renb2    :std_logic;
signal sig_txafifo_renb3    :std_logic;
signal sig_txafifo_lrenb    :std_logic;
signal sig_txafifo_hrenb    :std_logic;

signal sig_txafifo_sel      :integer range 0 to 1;
signal sig_txafifo_renb_n   :std_logic;
signal sig_txafifo_lfull    :std_logic;
signal sig_txafifo_hfull    :std_logic;
signal sig_txafifo_lempty   :std_logic;
signal sig_txafifo_hempty   :std_logic;
signal sig_txafifo_wr_ldcnt :std_logic_vector(4 downto 0);
signal sig_txafifo_wr_hdcnt :std_logic_vector(4 downto 0);
signal sig_txafifo_empty_n  :std_logic;
signal sig_txafifo_empty_n1 :std_logic;
signal sig_txafifo_empty_n2 :std_logic;
signal sig_txafifo_empty_n3 :std_logic;
---------------------------------------------
---channe; 'A' Rx fifo signal  
---------------------------------------------
signal sig_rxafifo_wdata    :std_logic_vector(7 downto 0);
signal sig_rxafifo_rdata    :std_logic_vector(15 downto 0);
signal sig_rxafifo_rdata1   :std_logic_vector(15 downto 0);
signal sig_rxafifo_rdata2   :std_logic_vector(15 downto 0);
signal sig_rxafifo_wsel     :integer range 0 to 1;

signal sig_rxafifo_lwenb    :std_logic;
signal sig_rxafifo_hwenb    :std_logic;
signal sig_rxafifo_lrenb    :std_logic:='0';
signal sig_rxafifo_lrenb1   :std_logic:='0';
signal sig_rxafifo_lrenb2   :std_logic:='0';
signal sig_rxafifo_lrenb3   :std_logic:='0';

signal sig_rxafifo_hrenb    :std_logic:='0';
signal sig_rxafifo_lfull    :std_logic;
signal sig_rxafifo_hfull    :std_logic;
signal sig_rxafifo_lempty   :std_logic;
signal sig_rxafifo_hempty   :std_logic;
signal sig_rpf_int          :std_logic;
signal sig_rme_int          :std_logic;
signal sig_xpr_int          :std_logic;
signal sig_rxdata_flag      :std_logic;

signal sig_rpf_int1          :std_logic;
signal sig_rme_int1          :std_logic;
signal sig_xpr_int1          :std_logic;

signal sig_rpf_int2          :std_logic;
signal sig_rme_int2          :std_logic;
signal sig_xpr_int2          :std_logic;

signal sig_inta_count       :std_logic_vector(11 downto 0); 
signal sig_rxafifo_lcnt     :std_logic_vector(4 downto 0);
signal sig_rxafifo_hcnt     :std_logic_vector(4 downto 0);

signal sig_rxabyte_cnt      :integer range 0 to 63;
signal sig_rxabyte_cnt3     :integer range 0 to 63;
signal sig_rxabyte_cnt5     :std_logic_vector(15 downto 0);
signal sig_rxamemrd_cnt     :integer range 0 to 63;
signal sig_rxamemrd_cntnxt  :integer range 0 to 63;

---------------------------------------------
---state machine signal 
---------------------------------------------
type  rxaclk_state is (rxaclk1, rxaclk2, rxaclk3, rxaclk4, rxaclk5);
signal rxaclk_nxstate          :rxaclk_state;

type  intra_state is (sta_intr1, sta_intr2, sta_intr3, sta_intr4, sta_intr5);
signal intra_nxstate   :intra_state; 

type  intstatus_state is (sta_intstatus1, sta_intstatus2, sta_intstatus3, sta_intstatus4, sta_intstatus5,
     sta_intstatus6, sta_intstatus7);
signal intstatus_anxt   :intstatus_state;

type  tx_allinta_st is (st_allinta1, st_allinta2, st_allinta3, st_allinta4, st_allinta5);
signal tx_allinta_nxt   :tx_allinta_st;

type  rxfrma_st is (sta_rxfrm1, sta_rxfrm2, sta_rxfrm3, sta_rxfrm4, sta_rxfrm5, sta_rxfrm6, sta_rxfrm7);
signal rxfrma_nxt   :rxfrma_st;

type  rx2frma_st is (sta_rx2frm1, sta_rx2frm2, sta_rx2frm3, sta_rx2frm4, sta_rx2frm5);
signal rx2frma_nxt   :rx2frma_st;

type mema_array is array (0 to 63) of std_logic_vector(7 downto 0);
signal rxfrma_mem  :mema_array;
signal rxfrma_mem2 :mema_array;

type  cpubus_type is (cpubus_nxt1, cpubus_nxt2, cpubus_nxt3, cpubus_nxt4, cpubus_nxt5);
signal cpubus_nxt   :cpubus_type;

---------------------------------------------
--- tx fifo debug signal
---------------------------------------------
type txfifomem_array is array (0 to 255) of std_logic_vector(7 downto 0);
signal txfifo_degubmem    :txfifomem_array;
signal txfifo_debug_cnt   :integer range 0 to 255;
signal txfifo_debug_cnt1  :integer range 0 to 255;
signal sig_rmc_width_cont :integer range 0 to 15;

type   debug_state is (debug0, debug1, debug2, debug3);
signal debug_nxstate      :debug_state;
signal sig_txfifo_debug   :std_logic_vector(7 downto 0);

signal sig_rmc1           :std_logic;
signal sig_rmc2           :std_logic;
signal sig_rcm_count      :std_logic_vector(7 downto 0);
signal sig_rxfrm_mux      :std_logic;
signal sig_tmp_0          :std_logic;
---------------------------------------------
--- crc calculation signal
---------------------------------------------
signal TxValidCRC         :std_logic;
signal TxDataCRC          :std_logic_vector(15 downto 0);
signal rx_crc             :std_logic_vector(15 downto 0);
---------------------------------------------
---serial tx and rx signal  
---------------------------------------------
signal sig_TxStart               : std_logic;
signal sig_TxStart_d             : std_logic;
signal sig_Txfrm_alls_int        : std_logic;
signal sig_TxAbort               : std_logic;
signal sig_RxDataWr_n            : std_logic;
signal sig_RxDataWr1_n           : std_logic;
signal sig_RxDataWr2_n           : std_logic;
signal sig_RxDataWr3_n           : std_logic;
signal sig_RxDataWr4_n           : std_logic;
signal sig_RxStatusWr_n          : std_logic;
signal sig_RxStatusWr1_n         : std_logic;
signal sig_RxStatusWr2_n         : std_logic;
signal sig_RxStatusWr3_n         : std_logic;
signal sig_RxStatusWr4_n         : std_logic;
signal sig_rmc_delay             : std_logic;
signal sig_rmc_delay1            : std_logic;

signal xpr_int_debug             : std_logic;

signal debug_int_flag            : std_logic;
signal debug_int_flag2           : std_logic;

signal rx_outclock               : std_logic;
signal rx_locked                 : std_logic;
signal rx_out                    : std_logic_vector(7 downto 0);
signal sig_synth                 : std_logic_vector(15 downto 0);
signal debug_regA_RSTA           : std_logic_vector(7 downto 0);

signal sig_sfifo_rst             : std_logic;
signal sig_sfifo_rst_cnt         :integer range 0 to 25000;

attribute syn_keep of sig_aRxData5 : signal is true;
attribute syn_keep of sig_aRxData6 : signal is true;
attribute syn_keep of sig_aRxData7 : signal is true;
attribute syn_keep of sig_aRxData8 : signal is true; 
attribute syn_keep of sig_rxabyte_cnt5 : signal is true;
attribute syn_keep of sig_rxamemrd_cnt : signal is true;
attribute syn_keep of sig_rxamemrd_cntnxt : signal is true;
---------------------------------------------
---fifo inst   
---------------------------------------------
component tx_fifo IS
	port
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
	);
end component;

component Rxa_fifo
	port
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
	);
end component;

---------------------------------------------
---HDLC TX AND RX  
---------------------------------------------
component SC_HDLC_top is
  port (
    -- Global Reset
    Tx_Reset         : in  std_logic; -- tx reset
    Rx_Reset         : in  std_logic; -- rx reset

    -- HDLC Receive Serial Interface
    RxClk            : in  std_logic; -- Receive Serial Clock
    RxData           : in  std_logic; -- Receive Serial Data
    -- HDLC Receive External Memory Interface
    RxOutputData     : out std_logic_vector(7 downto 0);
    RxDataWrite_n    : out std_logic;
    RxStatusWrite_n  : out std_logic;

    -- HDLC Transmit Serial Interface
    TxClk            : in  std_logic; -- Transmit Serial Clock
    TxData           : out std_logic; -- Transmit Serial Data
    -- HDLC Transmit External Memory Interface
    TxInputData      : in  std_logic_vector(7 downto 0);
	 TxDataCRC        : in  std_logic_vector(15 downto 0);
	 TxValidCRC       : in  std_logic;
    TxRead_n         : out std_logic;
    TxEmpty_n        : in  std_logic;
    TxStart          : in  std_logic;
    TxAbort          : in  std_logic
  );
end component;

component lvds_ip is
	port (
		data  : in  std_logic := '0'; --  data.data
		clock : in  std_logic := '0'; -- clock.clock
		q     : out std_logic         --     q.q
	);
end component lvds_ip;

COMPONENT cdr_fifo
	PORT
	(
		aclr		   : IN STD_LOGIC  := '0';
		data		   : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		rdclk		   : IN STD_LOGIC ;
		rdreq		   : IN STD_LOGIC ;
		wrclk		   : IN STD_LOGIC ;
		wrreq		   : IN STD_LOGIC ;
		q		      : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
		rdempty		: OUT STD_LOGIC ;
		rdfull		: OUT STD_LOGIC ;
		rdusedw		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
		wrusedw		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
	);
	END COMPONENT;
	
--COMPONENT data_recovery_virtex2_fast 
-- port (
--	clk 		: in std_logic;
--	clk90 	: in std_logic;
--	data 		: in std_logic;
--	rst 		: in std_logic;
--	sdata 	: out std_logic_vector(1 downto 0) ;
--	dv 		: out std_logic_vector(1 downto 0)
--	) ; 
--end component;
	
begin

--------------------------------------------------------
---combination design
--------------------------------------------------------
soft_rst_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
    soft_reset1   <= regG_CMDR(0);	
	 soft_reset2   <= soft_reset1;	
  end if;
end process;  

--soft_rst_proc:process(sig_clk160mhz)
--begin
--  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
--    if(regG_CMDR(0) = '1' and Cs_n_in = '1')then
--      soft_reset1   <= '1';
--	 else
--      soft_reset1   <= '0';
--    end if;
--	 
--	 soft_reset2   <= soft_reset1;	
--  end if;
--end process;

--------------------------------------------------------
---reset logic
--------------------------------------------------------
	--sig_reset  <= (not Reset_n_in);
	sig_reset    <= ((not Reset_n_in) or soft_reset2);	 

  
--------------------------------------------------------
----serial clock generation 2mhz
----------------------------------------------------------
--  sig_synth(0) <= sig_rpf_int; 
--  sig_synth(1) <= sig_rme_int; 
--  sig_synth(2) <= sig_TxStart; 
--  sig_synth(3) <= regA_CMDRL(2); 
--  sig_synth(4) <= rdfull; 
--  sig_synth(5) <= sig_aRxData5(0); 
--  sig_synth(6) <= regA_ISR1(4); 
--  sig_synth(7) <= sig_txafifo_empty_n; 
--  sig_synth(8) <= regA_ISR0(2); 
--  sig_synth(9) <= sig_xpr_int1; 
--  sig_synth(10) <= sig_rpf_int1; 
--  sig_synth(11) <= sig_rme_int1; 
--  
--synth_proc:process(sig_clk160mhz)
--begin
--  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
--      if(sig_reset = '1')then
--		   pin_98_out <= '0';
--		elsif(sig_synth = x"0111")then
--	   	pin_98_out <= '1';
--		end if;
--  end if;
--end process;  

--	sig_aRxClk  <= pin_124_in ;
	sig_aTxClk  <= sig_clk99mhz ;
	--sig_aRxClk  <= sig_clk99mhz ;
	
	pin_138_out <= rxd_nrzi ;
	pin_127_out <= sig_aRxData5(0) ; 

	--pin_136_out <= sig_sfifo_rst ;
--	pin_111_out <= rdempty ;
-- pin_136_out <= rdfull ; 
----------------------------------------------------------------------------
--------- serial rx clock and data recovery with oversampling
---------------------------------------------------------------------------- 		
lvds_ip_inst : component lvds_ip
		port map (
			data  => RxData,  --  data.data
			clock => sig_clk160mhz, -- clock.clock
			q     => sig_aRxData      --     q.q
		);
	
dcfifo_component : cdr_fifo
	PORT MAP (
	   aclr    => sig_sfifo_rst, 
		data    => sig_aRxData4,
		wrclk   => sig_clk160mhz,
		wrreq   => cdr_fifo_wr,
	   rdclk   => sig_aRxClk,
		rdreq   => cdr_fifo_rd,
		q       => sig_aRxData5,
		rdempty => rdempty,
		rdfull  => rdfull,
		rdusedw => cdr_fifo_rdcnt,
		wrusedw => cdr_fifo_wdcnt
	);
	

rxa_clock_recovery1:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
    if(sig_reset = '1')then
		  sig_aRxData1   <= '1';
		  sig_aRxData2   <= '1';
		  pin_111_out    <= '0';
        pin_136_out    <= '0';
	 else
		  sig_aRxData1   <= sig_aRxData;
		  sig_aRxData2   <= sig_aRxData1;
		  pin_111_out    <= rdempty ;
 	     pin_136_out    <= rdfull ; 
					
    end if;
  end if;
end process;

sig_aRxData3 <=  '0' when sig_reset = '1' else
    (sig_aRxData1 and  (not sig_aRxData2)) or (sig_aRxData2 and  (not sig_aRxData1)); --rising edge and falling edge

rxa_clock_recovery:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
    if(sig_reset = '1')then
		 rx_acounter       <=  0;
		 sig_aRxData4      <= (others =>'1');
		 cdr_fifo_wr       <= '0';
		 sig_sfifo_rst_cnt <= 0; 
		 sig_sfifo_rst     <= '1';
		 sig_aRxClk        <= '0';

	 else 
	      if(sig_aRxData3 = '1')then
			  rx_acounter     <= 0;	
		   --elsif(cdr_fifo_wdcnt <= "111100000")then	  
          elsif(rx_acounter = 191 )then
		  	  --elsif(rx_acounter = 189 )then
		       rx_acounter     <= 0;			  
			  else	
		       rx_acounter     <= rx_acounter + 1;
           end if;
			  
--		   elsif(cdr_fifo_wdcnt > "111100000")then	  
--         --elsif(rx_acounter = 191 )then
--		  	  if(rx_acounter = 188 )then
--		       rx_acounter     <= 0;			  
--			  else	
--		       rx_acounter     <= rx_acounter + 1;
--           end if;			  
--         end if;
			
			if(rx_acounter = 90 )then
			--if(rx_acounter = 25 )then
            sig_aRxData4(0)  <= sig_aRxData2;
				sig_aRxData9     <= sig_aRxData2;
			   cdr_fifo_wr      <= '1';	
			else
			   cdr_fifo_wr      <= '0';	
         end if;
			
			if( (sig_sfifo_rst_cnt = 25000) )then
			   sig_sfifo_rst_cnt <= 0;
				sig_sfifo_rst     <= '1';
			
			elsif(sig_aRxData3 = '1')then
			   sig_sfifo_rst_cnt <=  0;
				sig_sfifo_rst     <= '0';				
			else
		   	sig_sfifo_rst_cnt <= sig_sfifo_rst_cnt + 1;
				sig_sfifo_rst     <='0';
			end if;
			
			if(rx_acounter <= 95 )then
			   sig_aRxClk <= '0';
			else
			   sig_aRxClk <= '1';
			end if;
					
    end if;
  end if;
end process;	

rxa_cdc3:process(sig_aRxClk) --cdr fifo read count
begin
  if(sig_aRxClk'event and sig_aRxClk = '1')then 
     --if(sig_reset = '1')then
	  if(rdempty = '1')then
        cdr_fifo_rd      <= '0';
		  cdr_fifo_rcount  <=  0;
		  cdr_fifo_nxstate <= cdr_fifo1;
     else
		  case cdr_fifo_nxstate is
		  when  cdr_fifo1 => 
		  if(cdr_fifo_rdcnt = "111100000")then
			  cdr_fifo_rd      <= '1';
			  cdr_fifo_nxstate <= cdr_fifo2;
		  else
			  cdr_fifo_rd      <= '0';
			  cdr_fifo_nxstate <= cdr_fifo1;	  
		  end if;
		  
		  when  cdr_fifo2 => 
		     cdr_fifo_nxstate <= cdr_fifo2;
			  cdr_fifo_rd      <= '1';

		  
		  when others =>
           cdr_fifo_rd      <= '0';
		     cdr_fifo_rcount  <=  0;
		     cdr_fifo_nxstate <= cdr_fifo1;		     
		  end case;
		  
	  end if;			 
   end if;	  
end process;				 

rxa_cdc2:process(sig_aRxClk) --cdr fifo read
begin
  if(sig_aRxClk'event and sig_aRxClk = '1')then 
     if(sig_reset = '1')then
        rxd_nrzi       <= '1';
		  sig_aRxData6   <= '1';
		  sig_aRxData7   <= '1';
		  sig_aRxData8   <= '1';
     else
--	  		sig_aRxData10  <= sig_aRxData9;	
--		   sig_aRxData11  <= sig_aRxData10;	
--			sig_aRxData6   <= sig_aRxData11;
		   sig_aRxData6  <= sig_aRxData5(0);			
			--sig_aRxData6  <= sig_aRxData2;
		   sig_aRxData7  <= sig_aRxData6;
		   sig_aRxData8  <= sig_aRxData7;			
         rxd_nrzi      <= sig_aRxData8 xnor sig_aRxData7;		

	  end if;			 
   end if;	  
end process; 
	 
----------------------------------------------------------------------------------
---- serial rx clock
----------------------------------------------------------------------------------

	
------------------------------------------------------------------------------
---- serial rx clock
------------------------------------------------------------------------------

  
--------------------------------------------------------
---delay process
--------------------------------------------------------	
delay:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
    if(sig_reset = '1')then	
       sig_Addr_A7A0     <= (others => '0'); 
		 sig_Write_ENn_in  <= '1';
		 sig_Read_ENn_in   <= '1';
		 sig_Cs_n_in       <= '1';
		 sig_Bhe_n_in      <= '1'; 
	
       sig_Read_ENn_in2	 <= '1';
		 sig_Cs_n_in2      <= '1';
		 
		 sig_Tx_Reset      <= '1';--tx reset
		 sig_Rx_Reset      <= '1';--rx reset
		 cpubus_nxt        <= cpubus_nxt1;
	 else	
	 
	 	 sig_Addr_A7A0     <= Addr_A7A0 ;	
 		 sig_Write_ENn_in  <= Write_ENn_in;
		 sig_Read_ENn_in   <= Read_ENn_in;
		 sig_Cs_n_in       <= Cs_n_in;
		 sig_Bhe_n_in      <= Bhe_n_in; 
		 
		 sig_Rx_Reset1      <= regA_CMDRH(0) or debug_int_flag;--RX RESET		 
		 --sig_Tx_Reset1      <= regA_CMDRL(4) ;--TX RESET

		 sig_Rx_Reset      <= sig_Rx_Reset1 ;--RX RESET		 
		 --sig_Tx_Reset      <= sig_Tx_Reset1 ;--TX RESET			 
		 
	 end if;
end if;
end process;
---------------------------------------------
---Register write process
---------------------------------------------
address_dec:process(sig_clk160mhz)			
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
	    ----debug only	  	  
       Data_inout  <=(others => 'Z'); 
       --GLOBLE REG
       regG_VER0  <= (others => '0');--x"03" ;--R**
       regG_VER1  <= (others => '0');--x"F0" ;--R
       regG_VER2  <= (others => '0');--x"05" ;--R
       regG_VER3  <= (others => '0');--x"20" ;--R

       regG_CMDR <= (others => '0');--R/W 
       regG_MODE <= x"0b";--R/W     
	    regG_GPDIRL <= x"07";--R/W    
       regA_CMDRL <= (others => '0');--R/W 
       regA_CMDRH <= (others => '0');--R/W 
       regA_CCR0L <= (others => '0');--R/W 
       regA_CCR0H <= (others => '0');--R/W 
       regA_CCR1L <= (others => '0');--R/W 
       regA_CCR1H <= (others => '0');--R/W 
       regA_CCR2L <= (others => '0');--R/W 
       regA_CCR2H <= (others => '0');--R/W 
       regA_CCR3L <= (others => '0');--R/W 
       regA_CCR3H <= (others => '0');--R/W       
       regA_BRRL  <= (others => '0');--R/W  
       regA_BRRH  <= (others => '0');--R/W**                                          
       regA_IMR0  <= x"FF";--R/W  
       regA_IMR1  <= x"FF";--R/W  
       regA_IMR2  <= x"03";--R/W                    
       
--       sig_txafifo_hwenb <= '0'; --txfifo write enb for channel 'a'
       sig_rxafifo_lrenb <= '0';
       --sig_rxafifo_hrenb <= '0';
		  
       
     elsif(sig_Cs_n_in = '0')then--chip select  
	  
       if(sig_Write_ENn_in = '0' and sig_Read_ENn_in = '1')then--for write			 
       case sig_Addr_A7A0(7 downto 1) is 
		 
		 ---------------debug write reg----------------
		  when C_debug_1(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            sig_debug_1 <= Data_inout(7 downto 0);
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            sig_debug_2 <= Data_inout(15 downto 8);
			 else
            sig_debug_1 <= Data_inout(7 downto 0);
            sig_debug_2 <= Data_inout(15 downto 8);
          end if;		
			
		  when C_debug_2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            sig_debug_3 <= Data_inout(7 downto 0);
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            sig_debug_4 <= Data_inout(15 downto 8);
			 else
            sig_debug_3  <= Data_inout(7 downto 0);
            sig_debug_4  <= Data_inout(15 downto 8);
          end if;		
		 
------------------------------------------end--------------
		 	 	 
		  when C_addrG_CMDR_MODE(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regG_CMDR(0) <= Data_inout(0);
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regG_MODE <= (Data_inout(15 downto 8) and x"7b");
			 elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
            regG_CMDR(0) <= Data_inout(0);
            regG_MODE    <= (Data_inout(15 downto 8) and x"7b");
          end if;	 
		 
          when C_addrA_TX_RX_FIFO(7 downto 1) =>
             sig_txafifo_wdata  <= Data_inout;

          
          when C_addrA_CMDR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            --regA_CMDRL <= (Data_inout(7 downto 0) and x"fe");
				regA_CMDRL <= Data_inout(7 downto 0) ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            --regA_CMDRH <= (Data_inout(15 downto 8) and x"c9");
				regA_CMDRH <= Data_inout(15 downto 8) ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
            --regA_CMDRL <= (Data_inout(7 downto 0) and x"fe");
            --regA_CMDRH <= (Data_inout(15 downto 8) and x"c9");
				regA_CMDRL <= Data_inout(7 downto 0) ;
				regA_CMDRH <= Data_inout(15 downto 8) ;
          end if;
          
          when C_addrA_CCR0(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_CCR0L <= (Data_inout(7 downto 0) and x"df");
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_CCR0H <= (Data_inout(15 downto 8) and x"f0");
			 else
            regA_CCR0L <= (Data_inout(7 downto 0) and x"df");
            regA_CCR0H <= (Data_inout(15 downto 8) and x"f0");
          end if;
          
          when C_addrA_CCR1(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_CCR1L <= (Data_inout(7 downto 0) and x"fe");
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_CCR1H <= (Data_inout(15 downto 8) and x"5f");
			 else
            regA_CCR1L <= (Data_inout(7 downto 0) and x"fe");
            regA_CCR1H <= (Data_inout(15 downto 8) and x"5f");
          end if;           

          when C_addrA_CCR2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_CCR2L <= Data_inout(7 downto 0);
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_CCR2H <= (Data_inout(15 downto 8) and x"fb");
			 else
            regA_CCR2L <= Data_inout(7 downto 0);
            regA_CCR2H <= (Data_inout(15 downto 8) and x"fb");
          end if;
          
          when C_addrA_CCR3(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_CCR3L <= (Data_inout(7 downto 0) and x"f9");
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_CCR3H <= (Data_inout(15 downto 8) and x"73");
			 else
            regA_CCR3L <= (Data_inout(7 downto 0) and x"f9");
            regA_CCR3H <= (Data_inout(15 downto 8) and x"73");
          end if;

          when C_addrA_BRR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_BRRL <= (Data_inout(7 downto 0) and x"3f");
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_BRRH <= (Data_inout(15 downto 8) and x"0f");
			 else
            regA_BRRL <= (Data_inout(7 downto 0) and x"3f");
            regA_BRRH <= (Data_inout(15 downto 8) and x"0f");
          end if;
          
          when C_addrA_IMR0(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_IMR0 <= Data_inout(7 downto 0);
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            regA_IMR1 <= (Data_inout(15 downto 8)or x"01");
			 else
            regA_IMR0 <= Data_inout(7 downto 0);
            regA_IMR1 <= (Data_inout(15 downto 8)or x"01");            
          end if; 
                                                          
          when C_addrA_IMR2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            regA_IMR2 <= (Data_inout(7 downto 0) and x"03");
          --elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            --regA_IMR3 <= Data_inout(15 downto 8);
          else
            regA_IMR2 <= (Data_inout(7 downto 0) and x"03");
            --regA_IMR3 <= Data_inout(15 downto 8);
          end if;
             
          when others =>
            Ready_n_out        <= '1';
          null;   
       end case; 
---------------------------------------------
---Register read
---------------------------------------------       
     elsif(sig_Write_ENn_in = '1' and sig_Read_ENn_in = '0')then--for read********
	  
       case sig_Addr_A7A0(7 downto 1) is 
		 
-----------------debug reg read---------------	 
		  when C_debug_1(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_1 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_2 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_1 ;
            Data_inout(15 downto 8) <= sig_debug_2  ;
          end if;
			 
		  when C_debug_2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_3 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_4 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_3 ;
            Data_inout(15 downto 8) <= sig_debug_4  ;
          end if;		
			
		  when C_debug_3(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_5(7 downto 0) ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_5(15 downto 8) ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_5(7 downto 0) ;
            Data_inout(15 downto 8) <= sig_debug_5(15 downto 8)  ;
          end if;

		 when C_debug_4(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_7 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_8 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_7 ;
            Data_inout(15 downto 8) <= sig_debug_8 ;
          end if;	 

		 when C_debug_5(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_9 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_10 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_9 ;
            Data_inout(15 downto 8) <= sig_debug_10 ;
          end if;		
	
		 when C_debug_6(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_11 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_12 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_11 ;
            Data_inout(15 downto 8) <= sig_debug_12 ;
          end if;	

		 when C_debug_7(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= sig_debug_13 ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= sig_debug_14 ;
			 else
            Data_inout(7 downto 0)  <= sig_debug_13 ;
            Data_inout(15 downto 8) <= sig_debug_14 ;
          end if;				 
			 			 		 
-------------------end debug read----------------------
		 
		  when C_addrG_CMDR_MODE(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0) <= regG_CMDR ;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
            Data_inout(15 downto 8) <= regG_MODE ;
			 elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
            Data_inout(7 downto 0)  <= regG_CMDR ;
            Data_inout(15 downto 8) <= regG_MODE ;
          end if;
		 
          when C_addrG_STAR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=x"00";
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regG_STAR;
          else
              Data_inout(7 downto 0)  <=x"00";
              Data_inout(15 downto 8) <=regG_STAR;                    
          end if;
			 
          when C_addrG_GPDIR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regG_GPDIRL;
          else
              Data_inout(7 downto 0)  <=regG_GPDIRL;
              Data_inout(15 downto 8) <=x"FF";                    
          end if;			 
			 
         when C_addrA_TX_RX_FIFO(7 downto 1) =>
            sig_rxafifo_lrenb       <= '1';
				Data_inout              <=sig_rxafifo_rdata2;

         when C_addrG_VER0(7 downto 1) =>
         if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
           Data_inout(7 downto 0)  <=regG_VER0;
         elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
           Data_inout(15 downto 8) <=regG_VER1;
			elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
           Data_inout(7 downto 0)  <=regG_VER0;
           Data_inout(15 downto 8) <=regG_VER1;
         end if;
         
         when C_addrG_VER2(7 downto 1) =>
         if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
           Data_inout(7 downto 0)  <=regG_VER2;
         elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
           Data_inout(15 downto 8) <=regG_VER3;
			else
           Data_inout(7 downto 0)  <=regG_VER2;
           Data_inout(15 downto 8) <=regG_VER3;           
         end if;
         
         when C_addrA_STAR(7 downto 1) =>
         if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
             Data_inout(7 downto 0)  <=regA_STARL;
         elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
             Data_inout(15 downto 8) <=regA_STARH;
			else
             Data_inout(7 downto 0)  <=regA_STARL;
             Data_inout(15 downto 8) <=regA_STARH;             
         end if;
           
         when C_addrA_CMDR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_CMDRL;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_CMDRH;
			 else
              Data_inout(7 downto 0)  <=regA_CMDRL;
              Data_inout(15 downto 8) <=regA_CMDRH;              
          end if; 
           
          when C_addrA_CCR0(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_CCR0L;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_CCR0H;
			 else
              Data_inout(7 downto 0)  <=regA_CCR0L;
              Data_inout(15 downto 8) <=regA_CCR0H;                               
          end if;
           
          when C_addrA_CCR1(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_CCR1L;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_CCR1H;
			 else
              Data_inout(7 downto 0)  <=regA_CCR1L;
              Data_inout(15 downto 8) <=regA_CCR1H;              

          end if;
           
          when C_addrA_CCR2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_CCR2L;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_CCR2H;
			 else
              Data_inout(7 downto 0)  <=regA_CCR2L;
              Data_inout(15 downto 8) <=regA_CCR2H;
          end if;
           
          when C_addrA_CCR3(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_CCR3L;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_CCR3H;
			 else
              Data_inout(7 downto 0)  <=regA_CCR3L;
              Data_inout(15 downto 8) <=regA_CCR3H;
          end if;      
           
          when C_addrA_BRR(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_BRRL;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_BRRH;
			 else
              Data_inout(7 downto 0)  <=regA_BRRL;
              Data_inout(15 downto 8) <=regA_BRRH;
          end if;
           
          when C_addrA_ISR0(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_ISR0;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_ISR1;
			 --elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
			 else
              Data_inout(7 downto 0)  <=regA_ISR0;
              Data_inout(15 downto 8) <=regA_ISR1;
          end if;
           
          when C_addrA_ISR2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_ISR2;
          --elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
             --Data_inout(15 downto 8) <=regA_ISR3;
          else
            Data_inout(7 downto 0)  <=regA_ISR2;
            Data_inout(15 downto 8) <=x"00";
          end if;
           
          when C_addrA_IMR0(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_IMR0;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=regA_IMR1;
			 else
              Data_inout(7 downto 0)  <=regA_IMR0;
              Data_inout(15 downto 8) <=regA_IMR1;                    
          end if;
           
          when C_addrA_IMR2(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_IMR2;
           --elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              --Data_inout(15 downto 8) <=regA_IMR3;
		  	 else	  
              Data_inout(7 downto 0)  <=regA_IMR2;
              Data_inout(15 downto 8) <=x"00";
          end if;
           
          when C_addrA_RSTA(7 downto 1) =>
          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_RSTA;
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
              Data_inout(15 downto 8) <=x"00";
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
              Data_inout(7 downto 0)  <=regA_RSTA;
              Data_inout(15 downto 8) <=x"00";                    
          end if;

          when C_addrA_RBC(7 downto 1) =>   --rx byte count added on 28/03/22 sushil
--          if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
--              Data_inout(7 downto 0)  <=regA_RBCL;
--          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
--              Data_inout(15 downto 8) <=regA_RBCH;
          if(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
              Data_inout(15 downto 0)  <=regA_RBCL;
              --Data_inout(15 downto 8) <=regA_RBCH;                    
          end if;
			 
          when others =>  
             null;  
       end case;		 
       end if;     
		 
     else
       Data_inout         <=(others => 'Z');  
       sig_rxafifo_lrenb  <= '0';
		 
		 --reset value
		 regG_VER0  <=x"83" ;--R**
       regG_VER1  <=x"F0" ;--R
       regG_VER2  <=x"05" ;--R
		 regG_VER3  <=x"30" ;--R
       
       --self clearing register--
		 --regA_CMDRL(2) <= regA_CMDRL(3); --tx done
		 
       if(sig_txafifo_empty_n1 = '0')then --START of tx
		 --if(tx_allinta_nxt = st_allinta6)then --START of tx
          regA_CMDRL(3) <= '0';
			 regA_CMDRL(2) <= '0';
       end if; 

--       if(sig_Tx_Reset = '1')then --TX RESET
--		    regA_CMDRL(4) <= '0';
--       end if;	
		 
		 if(sig_Rx_Reset = '1')then --RX RESET
		   regA_CMDRH(0) <= '0' ;
		 end if;

       if(sig_Rx_Reset = '1' or regA_CMDRH(7) = '1' )then		 
       --if(sig_Rx_Reset = '1' or rx2frma_nxt = sta_rx2frm4 )then
		 --if(sig_Rx_Reset = '1' or rx2frma_nxt = sta_rx2frm1 or rx2frma_nxt = sta_rx2frm2  )then
		 --if( rxfrma_nxt = sta_rxfrm7 or rxfrma_nxt = sta_rxfrm9)then
			 regA_CMDRH(7) <= '0' ; 
       end if;	
		 
    end if;
end if;	  
end process;

---------------------------------------------
---regA_STARL and regA_STARH register update
---------------------------------------------
status_reg_wr:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
	  --if(sig_Tx_Reset = '1')then
        regA_STARL <= (others => '0');--R  
        regA_STARH <= x"10";--R
     --elsif(sig_txafifo_lfull = '1' or regA_CMDRL(2) = '1')then
	  elsif(regA_CMDRL(2) = '1')then
        regA_STARL(1) <= '0';       --fifo will not accept any more data
		  regA_STARL(0) <= '0'; 
		  regA_STARH(5) <= '0';
     --elsif(sig_txafifo_lempty = '1')then
	  elsif(regA_CMDRL(2) = '0' )then
	  --elsif(sig_txafifo_wr_ldcnt <= "01110")then
        regA_STARL(1) <= '1'; 
		  regA_STARL(0) <= '1';	
		  regA_STARH(5) <= '1';	 
	  else	  
	     regA_STARL(1) <= '0'; 
     end if;
  end if;
end process;  

---------------------------------------------
---channel 'A' tx and rx fifo write enb
---------------------------------------------
fifoA_wr:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
	   sig_txafifo_wenb   <= '0';
	   sig_txafifo_lwenb  <= '0';
      sig_txafifo_lwenb1 <= '0';
      sig_txafifo_lwenb2 <= '0';
		sig_txafifo_lwenb3 <= '0';
		 
		sig_txafifo_hwenb  <= '0';
		sig_txafifo_hwenb1 <= '0';
		sig_txafifo_hwenb2 <= '0';
		sig_txafifo_hwenb3 <= '0';
       
      sig_rxafifo_lrenb1 <= '0';
		sig_rxafifo_lrenb2 <= '0';
		sig_rxafifo_lrenb3 <= '0';
		sig_rxafifo_rdata1  <= (others => '0');
		sig_rxafifo_rdata2  <= (others => '0');
		sig_debug_9         <= (others => '0');
		sig_debug_10        <= (others => '0');
		 
     else
	    if(sig_Addr_A7A0 = C_addrA_TX_RX_FIFO and sig_Write_ENn_in = '0' 
		    and sig_Read_ENn_in = '1' and sig_Cs_n_in = '0')then--txafifo write enb
		 	  
			  sig_txafifo_wenb  <= '1';
			  
			 if(sig_Bhe_n_in = '1' and sig_Addr_A7A0(0) = '0')then
			     sig_txafifo_lwenb  <= '1';
				  sig_txafifo_hwenb  <= '0';
          elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '1')then
			 	  sig_txafifo_lwenb  <= '0';
			     sig_txafifo_hwenb  <= '1';
			 --else
			 elsif(sig_Bhe_n_in = '0' and sig_Addr_A7A0(0) = '0')then
			 	  sig_txafifo_lwenb  <= '1';
			     sig_txafifo_hwenb  <= '1'; 
			 else
			 	  sig_txafifo_lwenb  <= '0';
			     sig_txafifo_hwenb  <= '0';			 
          end if;
			  
		 else	 
			 	  sig_txafifo_lwenb  <= '0';
			     sig_txafifo_hwenb  <= '0';
				  sig_txafifo_wenb   <= '0';
		 end if;
		 
		 --tx fifo wenb
		 sig_txafifo_lwenb1 <= sig_txafifo_lwenb;       
       sig_txafifo_lwenb2 <= sig_txafifo_lwenb1;
		 
		 sig_txafifo_hwenb1 <= sig_txafifo_hwenb;       
       sig_txafifo_hwenb2 <= sig_txafifo_hwenb1;
		 
		 if(sig_txafifo_lwenb2 = '0' and sig_txafifo_lwenb1 = '1')then
		 	 sig_txafifo_lwenb3 <= '1';
		 else
		    sig_txafifo_lwenb3 <= '0';
		 end if;	 
		 
		 if(sig_txafifo_hwenb2 = '0' and sig_txafifo_hwenb1 = '1')then
		 	 sig_txafifo_hwenb3 <= '1';
		 else
		    sig_txafifo_hwenb3 <= '0';
		 end if;	
		 
		 if(sig_txafifo_lwenb2 = '0' and sig_txafifo_lwenb1 = '1')then
          sig_debug_9        <= sig_txafifo_wdata(7 downto 0) ;
          sig_debug_10       <= sig_txafifo_wdata(15 downto 8);
		 end if;
		 
	    --rx fifo read enb   		 
		 sig_rxafifo_rdata1  <= sig_rxafifo_rdata;
		 sig_rxafifo_rdata2  <= sig_rxafifo_rdata1;
			
       sig_rxafifo_lrenb1 <= sig_rxafifo_lrenb;
       sig_rxafifo_lrenb2 <= sig_rxafifo_lrenb1;
		 
       if(sig_rxafifo_lrenb2 = '0' and sig_rxafifo_lrenb1 = '1')then
		    sig_rxafifo_lrenb3 <= '1';
       else
		    sig_rxafifo_lrenb3 <= '0';
       end if;		
		 
     end if;
  end if;
end process;  


--sig_debug_9        <= sig_txafifo_wdata(7 downto 0) when (sig_txafifo_lwenb3 = '1');
--sig_debug_10       <= sig_txafifo_wdata(15 downto 8)when (sig_txafifo_lwenb3 = '1');

---------------------------------------------
---start serial transmittion
--CMDRL reg bit 3 for start tx = '1'
---------------------------------------------   
start_tx_reg_wr:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
        sig_TxStart   <= '0';
		  sig_TxStart_d <= '0';
        sig_TxAbort   <= '0';
     elsif(regA_CMDRL(3) = '1')then--rising edge of start  
        sig_TxStart   <= '1'; 
        sig_TxStart_d <= sig_TxStart;		  
     else
        sig_TxStart   <= '0';  
		  sig_TxStart_d <= '0'; 
     end if;
  end if;
end process;

---------------------------------------------
---clock domain crossing process
---------------------------------------------   
cdc_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
        sig_RxStatusWr1_n <= '1';
        sig_RxStatusWr2_n <= '1';
		  sig_RxStatusWr3_n <= '1';
        sig_RxStatusWr4_n <= '1';
		  
        sig_RxDataWr1_n   <= '1';
        sig_RxDataWr2_n   <= '1';
		  sig_RxDataWr3_n   <= '1';
		  sig_RxDataWr4_n   <= '1';

     else
        sig_RxStatusWr1_n <= sig_RxStatusWr_n;
        sig_RxStatusWr2_n <= sig_RxStatusWr1_n; 
		  sig_RxStatusWr3_n <= sig_RxStatusWr2_n;
        sig_RxStatusWr4_n <= sig_RxStatusWr3_n; 
		  
        sig_RxDataWr1_n   <= sig_RxDataWr_n;
        sig_RxDataWr2_n   <= sig_RxDataWr1_n;   
        sig_RxDataWr3_n   <= sig_RxDataWr2_n;	
		  sig_RxDataWr4_n   <= sig_RxDataWr3_n;
		  
     end if;
  end if;
end process;     
         
---------------------------------------------
---edge dectector
---------------------------------------------   
edge_dect_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
        sig_txafifo_empty_n  <= '0';
		  sig_txafifo_empty_n1 <= '0';
		  sig_txafifo_empty_n2 <= '0';
		  sig_txafifo_empty_n3 <= '0';
        sig_txafifo_renb     <= '1';
        sig_txafifo_renb1    <= '1';
        sig_txafifo_renb2    <= '1';
     else
        
        if(sig_txafifo_lempty = '1' and sig_txafifo_hempty = '1')then
           sig_txafifo_empty_n <= '0';
        else
           sig_txafifo_empty_n <= '1';
        end if;
		  
		  sig_txafifo_empty_n1 <= sig_txafifo_empty_n;
		  sig_txafifo_empty_n2 <= sig_txafifo_empty_n1;
		  --sig_txafifo_empty_n3 <= sig_txafifo_empty_n2;
				  
        sig_txafifo_renb     <= sig_txafifo_renb_n;
        sig_txafifo_renb1    <= sig_txafifo_renb;
        sig_txafifo_renb2    <= sig_txafifo_renb1;       
     end if;
  end if;
end process; 

---------------------------------------------
---tx fifo read enb
--------------------------------------------- 
txfifo_renb_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then
	  --if(sig_Rx_Reset = '1')then
	  --if(sig_Tx_Reset = '1')then
	     sig_txafifo_sel   <= 0;
	  elsif(sig_txafifo_renb2 = '1' and sig_txafifo_renb1 = '0')then --falling edge	 
	     sig_txafifo_sel   <= sig_txafifo_sel + 1; 	 
     --elsif(sig_RxStatusWr2_n = '1' and sig_RxStatusWr1_n = '0')then 
	  elsif(sig_TxStart = '1' and sig_TxStart_d = '0')then 
	  	  sig_txafifo_sel   <= 0;
	  end if;
  end if;
end process;  
	  
sig_txafifo_renb3 <= (sig_txafifo_renb2 and (not sig_txafifo_renb1));--falling edge

sig_txafifo_lrenb <= sig_txafifo_renb3  when (sig_txafifo_sel = 0)else
                      '0';
sig_txafifo_hrenb <= sig_txafifo_renb3  when (sig_txafifo_sel = 1)else
                      '0'; 
sig_txafifo_rdata <= sig_txafifo_rdata1 when (sig_txafifo_sel = 1)else
                     sig_txafifo_rdata2;
							
		
---------------------------------------------
---debug controller
---------------------------------------------
debug_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then 
			sig_debug_14        <= (others => '0');
			debug_regA_RSTA     <= (others => '0');
			debug_int_flag2     <= '0';
			txfifo_debug_cnt    <= 0;
			txfifo_debug_cnt1   <= 0;	
			sig_rmc1            <= '0';
			sig_rmc2            <= '0';			
			debug_nxstate       <= debug0;
		else		

			
			sig_debug_14(0)    <= debug_int_flag;
		   sig_debug_14(1)    <= debug_int_flag2;
--		   sig_debug_14(2)    <= sig_aRxClk;

		 
--			sig_rmc1           <= regA_CMDRH(7);
--			sig_rmc2           <= sig_rmc1;
			
			-------rmc count
--			if(sig_rmc2 = '0' and sig_rmc1 = '1')then
--			   sig_rcm_count  <= sig_rcm_count + '1';
--			end if;
--			 sig_debug_13     <= sig_rcm_count(7 downto 0);
			 
			-------rpf count		
         
			if(sig_RxStatusWr4_n = '1' and sig_RxStatusWr3_n = '0')then
		  	   sig_debug_11     <= sig_debug_11 + '1';
			end if;
		   
			-------rme count
			if(sig_rme_int = '1')then
		      sig_debug_12     <= sig_debug_12 + '1'; 
			end if;
			
			-------rx received frame
		   case debug_nxstate is 
			when debug0 =>			
			  txfifo_debug_cnt    <= 0;
			  txfifo_debug_cnt1   <= 0;			
			  debug_nxstate       <= debug1;
			  sig_txfifo_debug    <= (others => '0');
			  debug_regA_RSTA     <= (others => '0');
			  
			when debug1 =>			
			    if(sig_RxDataWr3_n = '1' and sig_RxDataWr2_n = '0')then
				    txfifo_degubmem(txfifo_debug_cnt) <= sig_rxafifo_wdata;
					 txfifo_debug_cnt                  <= txfifo_debug_cnt + 1;
					 debug_nxstate                     <= debug1;
				 elsif(sig_RxStatusWr3_n = '1' and sig_RxStatusWr2_n = '0')then
					 debug_nxstate                     <= debug2;
					 --txfifo_degubmem(txfifo_debug_cnt) <= sig_rxafifo_wdata;
					 --txfifo_debug_cnt                  <= txfifo_debug_cnt + 1;
					 if(sig_rxafifo_wdata(2 downto 0) = "000")then
				     debug_regA_RSTA(5)                <= '1'; --rx checksum valid
			        debug_regA_RSTA(7)                <= '1'; --rx valid frame  
					 end if; 
				 else
				    debug_nxstate       <= debug1;
				 end if;
				 
			when debug2 =>	
					 debug_nxstate                     <= debug3;
					 txfifo_degubmem(txfifo_debug_cnt) <= debug_regA_RSTA;
					 txfifo_debug_cnt                  <= txfifo_debug_cnt + 1;
					 
			when debug3 =>	
			   if(txfifo_debug_cnt1 <= txfifo_debug_cnt)then
			       sig_txfifo_debug       <= txfifo_degubmem(txfifo_debug_cnt1);
				    txfifo_debug_cnt1      <= txfifo_debug_cnt1 + 1;
				 	 if(debug_regA_RSTA /= x"a0")then
				      debug_int_flag2      <= '1';
				    end if;
				else
                debug_nxstate       <= debug0;
					 txfifo_debug_cnt    <= 0;
			       txfifo_debug_cnt1   <= 0;	
					 debug_int_flag2     <= '0';
					 
				end if; 
				
		   when others => 
             null;
				 
         end case;			
  
	   end if;
 end if;
end process; 					
  --sig_debug_8  <= sig_txfifo_debug(15 downto 8);
  sig_debug_7  <= sig_txfifo_debug(7 downto 0);
---------------------------------------------
---serial rx fifo write controller
---------------------------------------------  
rxfifo_wr_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_Rx_Reset = '1')then 
	  --if(sig_reset = '1')then
	 	  --regA_RSTA           <= (others => '0'); 
		  regA_RBCL           <= (others => '0');
		  --regA_RBCH           <= (others => '0');
		  sig_debug_5         <= (others => '0');
		  --sig_sfifo_rst       <= '1';
	     sig_rxafifo_wsel    <= 0;
		  sig_rxabyte_cnt     <= 0;
		  sig_rxabyte_cnt3    <= 0;
		  sig_rxabyte_cnt5    <= (others => '0');
		  sig_rxamemrd_cnt    <= 0; 
		  sig_rmc_width_cont  <= 0;
		  sig_rxamemrd_cntnxt <= 1;
		  sig_rxafifo_lwenb   <= '0';
        sig_rxafifo_hwenb   <= '0';
		  sig_rxdata_flag     <= '0';
		  debug_int_flag      <= '0';
		  sig_rpf_int         <= '0';
		  sig_rme_int         <= '0';
		  sig_rxfrm_mux       <= '0';
		  rxfrma_nxt          <= sta_rxfrm1;
		  rx2frma_nxt         <= sta_rx2frm1;
	  else	 
		 
		  case rxfrma_nxt is 
		  when sta_rxfrm1 => 
		   if(sig_RxStatusWr3_n = '1' and sig_RxStatusWr2_n = '0')then
		      rxfrma_nxt               <= sta_rxfrm2;
            sig_rxafifo_lwenb        <='0';	
				sig_rxabyte_cnt3			 <= 0;
				sig_rxamemrd_cnt         <= 0;
				sig_rxamemrd_cntnxt      <= 1;
				sig_rxfrm_mux            <='0';  --mux selectY
				sig_rpf_int              <= '0';
			   sig_rpf_int              <='0';
				sig_rxabyte_cnt          <= 0;
				sig_rxabyte_cnt5         <= (others => '0');
				debug_int_flag           <= '0';
			else
		      rxfrma_nxt               <= sta_rxfrm1;
            sig_rxafifo_lwenb        <='0';	
				sig_rxabyte_cnt3			 <= 0;
				sig_rxamemrd_cnt         <= 0;
				sig_rxamemrd_cntnxt      <= 1;
				sig_rxfrm_mux            <='0';  --mux selectY
				sig_rpf_int              <= '0';
			   sig_rpf_int              <='0';
				sig_rxabyte_cnt          <= 0;
				sig_rxabyte_cnt5         <= (others => '0');
				debug_int_flag           <= '0';
		   end if;	
		  
		  when sta_rxfrm2 => 
		  	 sig_rxfrm_mux       <= '0';
			 sig_rme_int         <= '0';
          sig_rpf_int         <= '0';
		
				
		  --elsif(sig_RxDataWr3_n = '1' and sig_RxDataWr2_n = '0')then--valid rx data
        if(sig_RxDataWr3_n = '1' and sig_RxDataWr2_n = '0')then--valid rx data		  
				sig_rxabyte_cnt              <= sig_rxabyte_cnt + 1;
				sig_rxabyte_cnt5             <= sig_rxabyte_cnt5 + '1';
				rxfrma_mem(sig_rxabyte_cnt)  <= sig_rxafifo_wdata;
				
				--if(sig_rxabyte_cnt = 31)then
				if(sig_rxabyte_cnt = 32)then
			    	rxfrma_nxt               <= sta_rxfrm4;
				else
					rxfrma_nxt               <= sta_rxfrm2;	
				end if;
				
		  --if(sig_RxStatusWr3_n = '1' and sig_RxStatusWr2_n = '0')then --valid rx status
		  elsif(sig_RxStatusWr3_n = '1' and sig_RxStatusWr2_n = '0')then --valid rx status
		      rxfrma_nxt        <= sta_rxfrm3;
				sig_rxabyte_cnt   <= sig_rxabyte_cnt - 2; --added on 09/06/22
				regA_RBCL         <= (sig_rxabyte_cnt5 - '1');
				--regA_RBCL         <= conv_std_logic_vector((sig_rxabyte_cnt - 1), 8);
				regA_RSTA(5)      <= (not sig_rxafifo_wdata(0)); --rx checksum valid
			   regA_RSTA(7)      <= (not sig_rxafifo_wdata(0)); --rx valid frame
				

		   else
		  		rxfrma_nxt                  <= sta_rxfrm2;
		   end if;
------------------state 2---------------------------------------		  
		  when sta_rxfrm3 => 
		  		rxfrma_mem(sig_rxabyte_cnt) <= regA_RSTA;
				sig_rxabyte_cnt5            <= (others => '0');
				if(regA_RSTA /= x"a0")then
				   debug_int_flag           <= '1';
					rxfrma_nxt               <= sta_rxfrm1;
				else
					rxfrma_nxt               <= sta_rxfrm5;				
				end if;
------------------state 3---------------------------------------				
		  when sta_rxfrm4 => 
		  if( sig_rxabyte_cnt3 <= 15)then
				sig_debug_5(7 downto 0)  <= rxfrma_mem(sig_rxamemrd_cnt);
				sig_debug_5(15 downto 8) <= rxfrma_mem(sig_rxamemrd_cntnxt);
				sig_rxamemrd_cnt         <= sig_rxamemrd_cnt + 2;
				sig_rxamemrd_cntnxt      <= sig_rxamemrd_cntnxt + 2;
				sig_rxabyte_cnt3         <= sig_rxabyte_cnt3 + 1;
				sig_rxafifo_lwenb        <= '1';
				rxfrma_nxt               <= sta_rxfrm4;
						
		  else
            rxfrma_nxt               <= sta_rxfrm2;
            sig_rxafifo_lwenb        <='0';	
				sig_rxabyte_cnt3			 <= 0;
				sig_rxamemrd_cnt         <= 0;
				sig_rxamemrd_cntnxt      <= 1;
				sig_rxfrm_mux            <='1';  --mux selectY
			   sig_rpf_int              <='1';
				--sig_rxabyte_cnt          <= 0;
				sig_rxabyte_cnt          <= 1;
				rxfrma_mem(0)            <= rxfrma_mem(32);
        end if;
------------------state 4---------------------------------------		  
		  when sta_rxfrm5 =>
		  --if( sig_rxamemrd_cnt <= sig_rxabyte_cnt)then
		  if( sig_rxamemrd_cnt <= sig_rxabyte_cnt)then
				sig_debug_5(7 downto 0)  <= rxfrma_mem(sig_rxamemrd_cnt);
				sig_debug_5(15 downto 8) <= rxfrma_mem(sig_rxamemrd_cntnxt);
				sig_rxafifo_lwenb        <= '1';
				sig_rxamemrd_cnt         <= sig_rxamemrd_cnt + 2;
				sig_rxamemrd_cntnxt      <= sig_rxamemrd_cntnxt + 2;
		  		rxfrma_nxt               <= sta_rxfrm5;
        else
		  		sig_rxafifo_lwenb        <='0';	
				sig_rxabyte_cnt          <= 0;
				sig_rxamemrd_cnt         <= 0;
				sig_rxamemrd_cntnxt      <= 1;
				sig_rme_int              <='1';
			   sig_rxfrm_mux            <='1';  --mux select
				rxfrma_nxt               <= sta_rxfrm2;
        end if;
				
		  when others => 
		      rxfrma_nxt                <= sta_rxfrm1;
		  end case;	
		  
------------------------------------------------------------	
		  case rx2frma_nxt is 
		  when sta_rx2frm1 =>
		    if(sig_rxfrm_mux = '1' and sig_rpf_int ='1')then  --rpf int clear
		      rx2frma_nxt      <= sta_rx2frm2;
			 elsif(sig_rxfrm_mux = '1' and sig_rme_int ='1')then --rme int clear
		      rx2frma_nxt      <= sta_rx2frm3;
		    else
		  	   rx2frma_nxt      <= sta_rx2frm1;
		    end if;
		  
		  when sta_rx2frm2 => 
		  		 rx2frma_nxt               <= sta_rx2frm1;

		  when sta_rx2frm3 => 
		  		 rx2frma_nxt               <= sta_rx2frm1;

-------------------------------------------------------	  
		  
		  when others => 
            rx2frma_nxt        <= sta_rx2frm1;
		  end case;
	  end if;	  
  end if;
end process;
  
---------------------------------------------
---Interrupt controller proc1
---------------------------------------------  
globle_intrstatus_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
      if(sig_reset = '1')then 
	     regG_STAR <= (others => '0');
	   elsif(regA_ISR0 > x"00")then	 
	     regG_STAR(3) <= '1'; 
	   elsif(regA_ISR1 > x"00")then	 
	     regG_STAR(4) <= '1';
	   elsif(regA_ISR2 > x"00")then	 
	     regG_STAR(5) <= '1';
		else
        regG_STAR(5 downto 3) <= "000";		
	  end if;
  end if;
end process;



--process(sig_clk160mhz)
--begin
	--if(sig_clk160mhz'event and sig_clk160mhz ='1')then
		--if(sig_reset ='1')then
		--rd_flag <= '0';
		--elsif(sig_tmp_0 = '0') then
		--int_flag <= '1';
		--elsif (sig_Read_ENn_in = '0' and sig_Cs_n_in = '0') then
		--rd-flag <= '1';
		--int_flag <= '0';
		--end if;
		--end if;
--end process

--pin_98_out <= rd_flag or int_flag;

---------------------------------------------
---Interrupt controller proc2
--------------------------------------------- 
intr_status_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then 
		  regA_ISR0              <= (others => '0');
		  regA_ISR1              <= (others => '0');
		  regA_ISR2              <= (others => '0');
		  sig_rpf_int1           <= '0';
		  sig_rme_int1           <= '0';
		  sig_xpr_int1           <= '0';
		  
		  sig_rpf_int2           <= '0';
		  sig_rme_int2           <= '0';
		  sig_xpr_int2           <= '0';		  
		  
		  intstatus_anxt         <= sta_intstatus1;
	  else
---------------------------------------------
--- int status updated
---------------------------------------------
        if(sig_rpf_int = '1')then
		    sig_rpf_int1           <= '1';
		  elsif(sig_rpf_int2 = '1')then	
		 	 sig_rpf_int1           <= '0'; 
		  end if;
		  
		  if(sig_rme_int = '1')then
		    sig_rme_int1           <= '1';
		  elsif(sig_rme_int2 = '1')then
		    sig_rme_int1           <= '0';
		  end if;
		  
		  if(sig_xpr_int = '1')then
		    sig_xpr_int1           <= '1'; 
		  elsif(sig_xpr_int2 = '1')then
		    sig_xpr_int1           <= '0'; 
		  end if;
		  
     case intstatus_anxt is
     when sta_intstatus1 =>
			  
			if(sig_xpr_int1 = '1' and sig_tmp_0 = '1')then
			    regA_ISR1(4)     <=  '1';--xpr interrupt	
				 intstatus_anxt   <=  sta_intstatus2;
			elsif(sig_rpf_int1 = '1' and sig_tmp_0 = '1')then
			    regA_ISR0(3)     <=  '1';--xpr interrupt 
				 intstatus_anxt   <=  sta_intstatus3;	
			elsif(sig_rme_int1 = '1' and sig_tmp_0 = '1')then
			    regA_ISR0(2)     <=  '1';--xpr interrupt	
				 intstatus_anxt   <=  sta_intstatus4;			 							 	  
		   else
			    intstatus_anxt   <= sta_intstatus1;	
		   end if;
			  
			  
     when sta_intstatus2 =>
		  if( (sig_Addr_A7A0(7 downto 1) = C_addrA_ISR0(7 downto 1)) 
				     and sig_Write_ENn_in = '1' and sig_Read_ENn_in = '0'  and sig_Cs_n_in = '0')then
			  intstatus_anxt   <= sta_intstatus5;	
			  sig_xpr_int2     <= '1';  
		  else
		  	  
			  intstatus_anxt   <= sta_intstatus2;
        end if;
		  
     when sta_intstatus3 =>
		  if( (sig_Addr_A7A0(7 downto 1) = C_addrA_ISR0(7 downto 1)) 
				     and sig_Write_ENn_in = '1' and sig_Read_ENn_in = '0'  and sig_Cs_n_in = '0')then
			  intstatus_anxt   <= sta_intstatus5;
		     sig_rpf_int2     <= '1';	  
		  else
		  	  
			  intstatus_anxt   <= sta_intstatus3;
        end if;
		  
     when sta_intstatus4 =>
		  if( (sig_Addr_A7A0(7 downto 1) = C_addrA_ISR0(7 downto 1)) 
				     and sig_Write_ENn_in = '1' and sig_Read_ENn_in = '0'  and sig_Cs_n_in = '0')then
			  intstatus_anxt   <= sta_intstatus5;
		     sig_rme_int2     <= '1';	  
		  else
		  	  
			  intstatus_anxt   <= sta_intstatus4;
			end if;
			
     when sta_intstatus5 =>
	     if(sig_Cs_n_in = '1' and sig_Read_ENn_in = '1')then
			  intstatus_anxt         <= sta_intstatus6;		  			  
		  else
		  	  intstatus_anxt         <= sta_intstatus5;
		  end if;

     when sta_intstatus6 =>
			  intstatus_anxt        <= sta_intstatus7;
			  
     when sta_intstatus7 =>
		     regA_ISR0             <= (others => '0');
		     regA_ISR1             <= (others => '0');
			  sig_rpf_int2          <= '0';
		     sig_rme_int2          <= '0';
		     sig_xpr_int2          <= '0';
			  intstatus_anxt        <= sta_intstatus1;			  
			  
	  when others =>
			intstatus_anxt           <= sta_intstatus1;               				
     end case;	           
	        	
		end if;
  end if;
end process;

---------------------------------------------
---xpr Interrupt generation
--------------------------------------------- 
xpr_intrgen_proc:process(sig_clk160mhz)
begin
  if(sig_clk160mhz'event and sig_clk160mhz = '1')then
     if(sig_reset = '1')then 
		  	xpr_int_debug           <= '0';
			sig_xpr_int             <= '0';
			tx_allinta_nxt          <= st_allinta1;
	  else	  
			case tx_allinta_nxt is --xpr interrrupt
			when st_allinta1 => 
					if(regA_CMDRL(3) ='1')then --start of frame xf
					   sig_xpr_int              <= '0';
						tx_allinta_nxt           <= st_allinta2;
						xpr_int_debug            <= '1';
					else
					   sig_xpr_int              <= '0';
						tx_allinta_nxt           <= st_allinta1;
						xpr_int_debug            <= '0';
					end if;
					
			when st_allinta2 => 
					--if(regA_CMDRL(2) ='1')then -- end of frame xme
					if(regA_CMDRL(2) ='1' and sig_txafifo_wr_ldcnt <= "01110")then -- end of frame xme
					   tx_allinta_nxt           <= st_allinta3;
						sig_xpr_int              <= '0';	
						--sig_xpr_int              <= '1';
						xpr_int_debug            <= '0';
						
				   --elsif(regA_CMDRL(2) ='0' and sig_txafifo_wr_ldcnt <= "01100")then --12 bytes
					elsif(regA_CMDRL(2) ='0' and sig_txafifo_wr_ldcnt <= "01110")then --12 bytes
					   tx_allinta_nxt           <= st_allinta4;
						sig_xpr_int              <= '1';
						xpr_int_debug            <= '0';
				
					else
						tx_allinta_nxt           <= st_allinta2;
						sig_xpr_int              <= '0';
					end if;
					
		when st_allinta3 => 
				--if(regA_CMDRL(2) ='0')then
				if(regA_CMDRL(2) ='0' and regA_CMDRL(3) ='0')then
					tx_allinta_nxt           <= st_allinta1;
					sig_xpr_int              <= '1';	
					--sig_xpr_int              <= '0';	
				else
					tx_allinta_nxt           <= st_allinta3;
					sig_xpr_int              <= '0';
				end if;	
				
		when st_allinta4 => 
		      if(sig_txafifo_wr_ldcnt > "01110")then
				--if(sig_txafifo_wenb = '1')then
					tx_allinta_nxt           <= st_allinta5;
					sig_xpr_int              <= '0';
				elsif(regA_CMDRL(2) ='1')then
					tx_allinta_nxt           <= st_allinta3;
					sig_xpr_int              <= '0';
		      else
					tx_allinta_nxt           <= st_allinta4;
					sig_xpr_int              <= '0';
				end if;
				
		when st_allinta5 => 
				--if(regA_CMDRL(2) = '1')then
				--if(regA_CMDRL(2) = '1' and sig_txafifo_wr_ldcnt <= "01110")then
				if( sig_txafifo_wr_ldcnt <= "01110")then
				   tx_allinta_nxt           <= st_allinta2;
					sig_xpr_int              <= '0';
					--sig_xpr_int              <= '1';
				else
					tx_allinta_nxt           <= st_allinta5;
					sig_xpr_int              <= '0';
			   end if;
					
        when others =>
				sig_xpr_int              <= '0';
				tx_allinta_nxt           <= st_allinta1;               				
		  end case;
		end if;  
  end if;
end process;		  
---------------------------------------------
---Interrupt controller proc3
---------------------------------------------   
intr_contrl_proc:process(sig_clk160mhz)
begin
if(sig_clk160mhz'event and sig_clk160mhz = '1')then
    if(sig_reset = '1')then
		 --Int_n_out     <= '1'; 
		 sig_tmp_0     <= '1';		 
	 elsif(regG_MODE(0) = '1')then	
		 --Int_n_out     <= '1';
		 sig_tmp_0     <= '1'; 
    else	

		 if(intstatus_anxt = sta_intstatus2 or intstatus_anxt = sta_intstatus3 or intstatus_anxt = sta_intstatus4 )then
			  sig_tmp_0      <= '0'; 
        else
			  sig_tmp_0      <= '1';
     	 end if;	
	 end if;	  
end if;
end process;	
		Int_n_out          <= '1' when sig_reset = '1' else
		                       sig_tmp_0;
 
---------------------------------------------
---channel 'A' tx fifo port map
--------------------------------------------- 
tx_afifol:tx_fifo port map
	(
		clock   => sig_clk160mhz,
		wrreq   => sig_txafifo_lwenb3, 
	   sclr    => sig_reset,
		data    => sig_debug_9,		
		rdreq   => sig_txafifo_lrenb,
		full    => sig_txafifo_lfull,
		q       => sig_txafifo_rdata1,
		empty   => sig_txafifo_lempty,
		usedw   => sig_txafifo_wr_ldcnt
		
	);

tx_afifoh:tx_fifo port map 
	(
		clock   => sig_clk160mhz,
		wrreq   => sig_txafifo_hwenb3,
		sclr    => sig_reset,
		data    => sig_debug_10,
		rdreq   => sig_txafifo_hrenb,
		full    => sig_txafifo_hfull,
		q       => sig_txafifo_rdata2,
		empty   => sig_txafifo_hempty,
		usedw   => sig_txafifo_wr_hdcnt
		
	);           
 
---------------------------------------------
---channel 'A' rx fifo port map
---------------------------------------------
      
rx_afifol:Rxa_fifo port map    
  	(
		clock		=> sig_clk160mhz,
		--data		=> sig_rxafifo_wdata,
		data		=> sig_debug_5(7 downto 0),
		rdreq		=> sig_rxafifo_lrenb3,
		--sclr		=> sig_reset,
		sclr		=> sig_Rx_Reset,
		wrreq		=> sig_rxafifo_lwenb,
		empty		=> sig_rxafifo_lempty,
		full		=> sig_rxafifo_lfull,
		q		   => sig_rxafifo_rdata(7 downto 0),
		usedw		=> sig_rxafifo_lcnt
	);
	
rx_afifoh:Rxa_fifo port map    
  	(
		clock		=> sig_clk160mhz,
		--data		=> sig_rxafifo_wdata,
	   data		=> sig_debug_5(15 downto 8),
	   rdreq		=> sig_rxafifo_lrenb3,
		--sclr		=> sig_reset,
		sclr		=> sig_Rx_Reset,
		wrreq		=> sig_rxafifo_lwenb,
		empty		=> sig_rxafifo_hempty,
		full		=> sig_rxafifo_hfull,
		q		   => sig_rxafifo_rdata(15 downto 8),
		usedw		=> sig_rxafifo_hcnt
	);	
  
---------------------------------------------
---tx and rx port map
---------------------------------------------      
 x1:SC_HDLC_top port map 
         (
          -- Global Reset
			 Tx_Reset         => sig_reset, -- tx reset
          Rx_Reset         => sig_reset, -- rx reset
			 
			 --Tx_Reset         => sig_Tx_Reset, -- tx reset
          --Rx_Reset         => sig_Rx_Reset, -- rx reset
			 
          --Reset          => sig_reset, -- Master reset   
          -- HDLC Receive Serial Interface
          RxClk            => sig_aRxClk,  -- Receive Serial Clock-RxData
          RxData           => rxd_nrzi,--RxData,--sig_RxData, -- Receive Serial Data
          -- HDLC Receive External Memory Interface
          RxOutputData     => sig_rxafifo_wdata,
          RxDataWrite_n    => sig_RxDataWr_n,
          RxStatusWrite_n  => sig_RxStatusWr_n,
      
          -- HDLC Transmit Serial Interface
          TxClk            => sig_aTxClk, -- Transmit Serial Clock
          TxData           => TxData, -- Transmit Serial Data
          -- HDLC Transmit External Memory Interface
          TxInputData      => sig_txafifo_rdata,--8 bit data for tx
          TxRead_n         => sig_txafifo_renb_n,--fifo read enb for tx
			 TxDataCRC        => TxDataCRC,
	       TxValidCRC       => TxValidCRC,
          TxEmpty_n        => sig_txafifo_empty_n,--tx fifo is empty
          TxStart          => sig_TxStart,
          TxAbort          => sig_TxAbort
        );

end Behavioral;
 