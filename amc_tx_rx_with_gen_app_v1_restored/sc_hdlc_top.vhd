-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2008 - 2010 by Lattice Semiconductor Corporation
-- --------------------------------------------------------------------
--
-- Permission:
--
-- Lattice Semiconductor grants permission to use this code for use
-- in synthesis for any Lattice programmable logic product. Other
-- use of this code, including the selling or duplication of any
-- portion is strictly prohibited.
--
-- Disclaimer:
--
-- This VHDL or Verilog source code is intended as a design reference
-- which illustrates how these types of functions can be implemented.
-- It is the user's responsibility to verify their design for
-- consistency and functionality through the use of formal
-- verification methods. Lattice Semiconductor provides no warranty
-- regarding the use or functionality of this code.
--
-- --------------------------------------------------------------------
--
-- Lattice Semiconductor Corporation
-- 5555 NE Moore Court
-- Hillsboro, OR 97214
-- U.S.A
--
-- TEL: 1-800-Lattice (USA and Canada)
-- 503-268-8001 (other locations)
--
-- web: http://www.latticesemi.com/
-- email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
-- Code Revision History :
-- --------------------------------------------------------------------
-- Ver: | Author |Mod. Date |Changes Made:
-- V1.0 | J.S.   |09/01/08  |Initial ver
-- V1.1 | F.X.   |06/27/10  |ABORT, CRC_ERR and OCTET_ERR signal fixing
-- --------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_Unsigned.all;

entity SC_HDLC_top is
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
end SC_HDLC_top;

architecture SC_HDLC_top_a of SC_HDLC_top is

  component HDLC_RECEIVE
  port (
    -- Global Reset
    Reset     : in  std_logic; -- rx reset
    -- HDLC Receive Serial Interface
    RxC       : in  std_logic; -- Receive Serial Clock
    RxD       : in  std_logic; -- Receive Serial Data
    -- HDLC Receive External Memory Interface
    RxOutputData_B0 : out std_logic; -- Receive Data Output Bit 0
    RxOutputData_B1 : out std_logic; -- Receive Data Output Bit 1
    RxOutputData_B2 : out std_logic; -- Receive Data Output Bit 2
    RxOutputData_B3 : out std_logic; -- Receive Data Output Bit 3
    RxOutputData_B4 : out std_logic; -- Receive Data Output Bit 4
    RxOutputData_B5 : out std_logic; -- Receive Data Output Bit 5
    RxOutputData_B6 : out std_logic; -- Receive Data Output Bit 6
    RxOutputData_B7 : out std_logic; -- Receive Data Output Bit 7
    RxDataWrite_n   : out std_logic; -- Receive Data Valid
    RxStatusWrite_n : out std_logic; -- Receive Status Valid
    RxEnable        : in  std_logic  -- Receive Enable
  );
  end component;

  component HDLC_TRANSMIT
  port (
    -- Global Reset
    Reset          : in  std_logic; -- tx reset
    -- HDLC Transmit Serial Interface
    TxC            : in  std_logic; -- Transmit Serial Clock
    TxD            : out std_logic; -- Transmit Serial Data
	 
	 TxDataCRC      : in  std_logic_vector(15 downto 0);
	 TxValidCRC     : in  std_logic;
    -- HDLC Transmit External Memory Interface
    TxInputData_B0 : in  std_logic; -- Transmit Data Input Bit 0
    TxInputData_B1 : in  std_logic; -- Transmit Data Input Bit 1
    TxInputData_B2 : in  std_logic; -- Transmit Data Input Bit 2
    TxInputData_B3 : in  std_logic; -- Transmit Data Input Bit 3
    TxInputData_B4 : in  std_logic; -- Transmit Data Input Bit 4
    TxInputData_B5 : in  std_logic; -- Transmit Data Input Bit 5
    TxInputData_B6 : in  std_logic; -- Transmit Data Input Bit 6
    TxInputData_B7 : in  std_logic; -- Transmit Data Input Bit 7
    TxRead_n       : out std_logic; -- Transmit Data Read
    TxEmpty_n      : in  std_logic; -- Transmit Data Empty
    TxStart        : in  std_logic; -- Transmit Start
    TxAbort        : in  std_logic; -- Transmit Abort
    TxEnable       : in  std_logic  -- Transmit Enable
  );
  end component;

begin

  RX: HDLC_RECEIVE port map(
    -- Global Reset
    Reset           => Rx_Reset,           -- rx reset
    -- HDLC Receive Serial Interface
    RxC             => RxClk,              -- Receive Serial Clock
    RxD             => RxData,             -- Receive Serial Data
    -- HDLC Receive External Memory Interface
    RxOutputData_B0 => RxOutputData(0),
    RxOutputData_B1 => RxOutputData(1),
    RxOutputData_B2 => RxOutputData(2),
    RxOutputData_B3 => RxOutputData(3),
    RxOutputData_B4 => RxOutputData(4),
    RxOutputData_B5 => RxOutputData(5),
    RxOutputData_B6 => RxOutputData(6),
    RxOutputData_B7 => RxOutputData(7),
    RxDataWrite_n   => RxDataWrite_n,   -- Receive Data Valid
    RxStatusWrite_n => RxStatusWrite_n, -- Receive Status Valid
    RxEnable        => '1'
  );

  TX: HDLC_TRANSMIT port map(
    -- Global Reset
    Reset          => Tx_Reset,          -- tx reset
    -- HDLC Transmit Serial Interface
    TxC            => TxClk,          -- Transmit Serial Clock
    TxD            => TxData,         -- Transmit Serial Data
    -- HDLC Transmit External Memory Interface
    TxInputData_B0 => TxInputData(0),
    TxInputData_B1 => TxInputData(1),
    TxInputData_B2 => TxInputData(2),
    TxInputData_B3 => TxInputData(3),
    TxInputData_B4 => TxInputData(4),
    TxInputData_B5 => TxInputData(5),
    TxInputData_B6 => TxInputData(6),
    TxInputData_B7 => TxInputData(7),
	 TxDataCRC      => TxDataCRC,
	 TxValidCRC     => TxValidCRC,
    TxRead_n       => TxRead_n,    -- Transmit Data Read
    TxEmpty_n      => TxEmpty_n,   -- Transmit Data Empty
    TxStart        => TxStart,     -- Transmit Start
    TxAbort        => TxAbort,     -- Transmit Abort
    TxEnable       => '1'
	 --TxEnable       => TxStart
  );

end SC_HDLC_top_a;

