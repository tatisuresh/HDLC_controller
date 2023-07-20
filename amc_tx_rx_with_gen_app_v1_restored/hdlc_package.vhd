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
-- V1.1 | F.X.   |06/27/10  |Moving the CRC Polynomial to package file
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package HDLC_PACKAGE is

  constant NumOfChannel: integer := 6;
--  -- CRC-CCITT (x16+x12+x5+1)
  constant FCS_size: integer := 16;
  constant CRC_Polynomial: std_logic_vector(FCS_size downto 0) 
                         := B"1_0001_0000_0010_0001";

  -- CRC-16 (x16+x15+x2+1)
  --constant FCS_size: integer := 16;
  --constant CRC_Polynomial: std_logic_vector(FCS_size downto 0) 
  --                       := B"1_1000_0000_0000_0101";

--  -- CRC-32 (x32+x26+x23+x22+x16+x12+x11+x10+x8+x7+x5+x4+x2+x1+1)
--  constant FCS_size: integer := 32;
--  constant CRC_Polynomial: std_logic_vector(FCS_size downto 0) 
--                         := B"1_0000_0100_1100_0001_0001_1101_1011_0111";  
--CRC TABLE

type CRC_array is array (0 to 255) of std_logic_vector((FCS_size-1) downto 0);
constant CRC_table: CRC_array :=
(x"0000", x"1021", x"2042", x"3063", x"4084", x"50A5", x"60C6", x"70E7", x"8108", x"9129", x"A14A", x"B16B", x"C18C", x"D1AD", x"E1CE", x"F1EF",
x"1231", x"0210", x"3273", x"2252", x"52B5", x"4294", x"72F7", x"62D6", x"9339", x"8318", x"B37B", x"A35A", x"D3BD", x"C39C", x"F3FF", x"E3DE",
x"2462", x"3443", x"0420", x"1401", x"64E6", x"74C7", x"44A4", x"5485", x"A56A", x"B54B", x"8528", x"9509", x"E5EE", x"F5CF", x"C5AC", x"D58D",
x"3653", x"2672", x"1611", x"0630", x"76D7", x"66F6", x"5695", x"46B4", x"B75B", x"A77A", x"9719", x"8738", x"F7DF", x"E7FE", x"D79D", x"C7BC",
x"48C4", x"58E5", x"6886", x"78A7", x"0840", x"1861", x"2802", x"3823", x"C9CC", x"D9ED", x"E98E", x"F9AF", x"8948", x"9969", x"A90A", x"B92B",
x"5AF5", x"4AD4", x"7AB7", x"6A96", x"1A71", x"0A50", x"3A33", x"2A12", x"DBFD", x"CBDC", x"FBBF", x"EB9E", x"9B79", x"8B58", x"BB3B", x"AB1A",
x"6CA6", x"7C87", x"4CE4", x"5CC5", x"2C22", x"3C03", x"0C60", x"1C41", x"EDAE", x"FD8F", x"CDEC", x"DDCD", x"AD2A", x"BD0B", x"8D68", x"9D49",
x"7E97", x"6EB6", x"5ED5", x"4EF4", x"3E13", x"2E32", x"1E51", x"0E70", x"FF9F", x"EFBE", x"DFDD", x"CFFC", x"BF1B", x"AF3A", x"9F59", x"8F78",
x"9188", x"81A9", x"B1CA", x"A1EB", x"D10C", x"C12D", x"F14E", x"E16F", x"1080", x"00A1", x"30C2", x"20E3", x"5004", x"4025", x"7046", x"6067",
x"83B9", x"9398", x"A3FB", x"B3DA", x"C33D", x"D31C", x"E37F", x"F35E", x"02B1", x"1290", x"22F3", x"32D2", x"4235", x"5214", x"6277", x"7256",
x"B5EA", x"A5CB", x"95A8", x"8589", x"F56E", x"E54F", x"D52C", x"C50D", x"34E2", x"24C3", x"14A0", x"0481", x"7466", x"6447", x"5424", x"4405",
x"A7DB", x"B7FA", x"8799", x"97B8", x"E75F", x"F77E", x"C71D", x"D73C", x"26D3", x"36F2", x"0691", x"16B0", x"6657", x"7676", x"4615", x"5634",
x"D94C", x"C96D", x"F90E", x"E92F", x"99C8", x"89E9", x"B98A", x"A9AB", x"5844", x"4865", x"7806", x"6827", x"18C0", x"08E1", x"3882", x"28A3",
x"CB7D", x"DB5C", x"EB3F", x"FB1E", x"8BF9", x"9BD8", x"ABBB", x"BB9A", x"4A75", x"5A54", x"6A37", x"7A16", x"0AF1", x"1AD0", x"2AB3", x"3A92",
x"FD2E", x"ED0F", x"DD6C", x"CD4D", x"BDAA", x"AD8B", x"9DE8", x"8DC9", x"7C26", x"6C07", x"5C64", x"4C45", x"3CA2", x"2C83", x"1CE0", x"0CC1",
x"EF1F", x"FF3E", x"CF5D", x"DF7C", x"AF9B", x"BFBA", x"8FD9", x"9FF8", x"6E17", x"7E36", x"4E55", x"5E74", x"2E93", x"3EB2", x"0ED1", x"1EF0");


end package HDLC_PACKAGE;

