------------------------------------------------------------------------------
--
--  Xilinx, Inc. 2002                 www.xilinx.com
--
--  XAPP 224 - Data Recovery
--
------------------------------------------------------------------------------
--
--  File name :       data_recovery_virtex2_fast.vhd
--
--  Description :     Virtex2 data recovery module, uses two clocks 90 degrees apart to recover data
-- 		      from incoming line data. (which is running slightly faster or slower than these
-- 		      two clocks). More pipelined than basic version.
--
-- 		      Output data bit 0 (sdata(0)) is valid when dv(0) is high
-- 		      Output data bit 1 (sdata(1)) is valid when dv(1) is high
--
-- 		      sample A is captured on : rising clk,    rising clk,   rising clk,   rising clk
-- 		      sample B is captured on : rising clk90,  rising clk,   rising clk,   rising clk
-- 		      sample C is captured on : falling clk,   rising clk90, rising clk,   rising clk
-- 		      sample D is captured on : falling clk90, falling clk,  rising clk90, rising clk
--
--  Date - revision : May 16th 2003 - v 2.2
--
--  Author :          NJS
--
--  Contact : e-mail  hotline@xilinx.com
--            phone   + 1 800 255 7778 
--
--  Disclaimer: LIMITED WARRANTY AND DISCLAMER. These designs are
--              provided to you "as is". Xilinx and its licensors make and you
--              receive no warranties or conditions, express, implied,
--              statutory or otherwise, and Xilinx specifically disclaims any
--              implied warranties of merchantability, non-infringement,or
--              fitness for a particular purpose. Xilinx does not warrant that
--              the functions contained in these designs will meet your
--              requirements, or that the operation of these designs will be
--              uninterrupted or error free, or that defects in the Designs
--              will be corrected. Furthermore, Xilinx does not warrantor
--              make any representations regarding use or the results of the
--              use of the designs in terms of correctness, accuracy,
--              reliability, or otherwise.
--
--              LIMITATION OF LIABILITY. In no event will Xilinx or its
--              licensors be liable for any loss of data, lost profits,cost
--              or procurement of substitute goods or services, or for any
--              special, incidental, consequential, or indirect damages
--              arising from the use or operation of the designs or
--              accompanying documentation, however caused and on any theory
--              of liability. This limitation will apply even if Xilinx
--              has been advised of the possibility of such damage. This
--              limitation shall apply not-withstanding the failure of the
--              essential purpose of any limited remedies herein.
--
--  Copyright © 2002 Xilinx, Inc.
--  All rights reserved
--
------------------------------------------------------------------------------
--
library ieee;
use ieee.std_logic_1164.all;

--pragma translate_off
library unisim ;
use unisim.vcomponents.all ;
--pragma translate_on

entity data_recovery_virtex2_fast is port (
	clk 		: in std_logic;
	clk90 	: in std_logic;
	data 		: in std_logic;
	rst 		: in std_logic;
	sdata 	: out std_logic_vector(1 downto 0) ;
	dv 		: out std_logic_vector(1 downto 0)) ; 
end data_recovery_virtex2_fast;

architecture arch_data_recovery_virtex2_fast of data_recovery_virtex2_fast is
-- FDC primitive
component fdc port (d, c, clr : in std_logic; q : out std_logic); end component;

signal notclk 		: std_logic;
signal notclk90 	: std_logic;
signal az 		: std_logic_vector(4 downto 0) ;
signal bz 		: std_logic_vector(4 downto 0) ;
signal cz 		: std_logic_vector(4 downto 0) ;
signal dz 		: std_logic_vector(4 downto 0) ;
signal aap, aan 	: std_logic;
signal bbp, bbn 	: std_logic;
signal ccp, ccn 	: std_logic;
signal ddp, ddn 	: std_logic;
signal usea	 	: std_logic;
signal useb	 	: std_logic;
signal usec	 	: std_logic;
signal used	 	: std_logic;
signal usea1, usea2	: std_logic;
signal useb1, useb2 	: std_logic;
signal usec1, usec2 	: std_logic;
signal used1, used2 	: std_logic;
signal useaa 		: std_logic;
signal usebb 		: std_logic;
signal usecc 		: std_logic;
signal usedd 		: std_logic;
signal useaaa 		: std_logic;
signal usebbb 		: std_logic;
signal useccc 		: std_logic;
signal useddd 		: std_logic;
signal sdataa 		: std_logic_vector(1 downto 0);
signal sdatab 		: std_logic_vector(1 downto 0);
signal sdatac 		: std_logic_vector(1 downto 0);
signal sdatad 		: std_logic_vector(1 downto 0);
signal dvalid 		: std_logic_vector(1 downto 0);
signal pipe_ce0 	: std_logic;
signal pipe_ce1 	: std_logic;

attribute RLOC 		: string ;
attribute IOB 		: string ;

attribute RLOC 	of ff_a0 : label is "X0Y0";
attribute IOB 	of ff_a0 : label is "FALSE";
attribute RLOC 	of ff_a1 : label is "X0Y0";
attribute RLOC 	of ff_a2 : label is "X3Y1";
attribute RLOC 	of ff_a3 : label is "X3Y1";

attribute RLOC 	of ff_b0 : label is "X1Y0";
attribute IOB 	of ff_b0 : label is "FALSE";
attribute RLOC 	of ff_b1 : label is "X3Y0";
attribute RLOC 	of ff_b2 : label is "X3Y0";
attribute RLOC 	of ff_b3 : label is "X4Y0";

attribute RLOC 	of ff_c0 : label is "X1Y1";
attribute IOB 	of ff_c0 : label is "FALSE";
attribute RLOC 	of ff_c1 : label is "X2Y1";
attribute RLOC 	of ff_c2 : label is "X4Y0";
attribute RLOC 	of ff_c3 : label is "X4Y1";

attribute RLOC 	of ff_d0 : label is "X0Y1";
attribute IOB 	of ff_d0 : label is "FALSE";
attribute RLOC 	of ff_d1 : label is "X1Y1";
attribute RLOC 	of ff_d2 : label is "X2Y1";
attribute RLOC 	of ff_d3 : label is "X4Y1";

begin

notclk <= not clk ;
notclk90 <= not clk90 ;

process (clk, rst)
begin
if rst = '1' then 
	dvalid <= "00" ; dv <= "00" ;
	az(4) <= '1' ; bz(4) <= '1' ; cz(4) <= '1' ; dz(4) <= '1' ;
	aap <= '0'  ; bbp <= '0' ;  ccp <= '0' ;  ddp <= '0' ;	
	aan <= '0'  ; bbn <= '0' ;  ccn <= '0' ;  ddn <= '0' ;	
	usea1 <= '0'  ; useb1 <= '0'  ; usec1 <= '0'  ; used1 <= '0' ;
	usea2 <= '0'  ; useb2 <= '0'  ; usec2 <= '0'  ; used2 <= '0' ;
	usea <= '0'  ; useb <= '0'  ; usec <= '0'  ; used <= '0' ;
	useaa <= '0' ; usebb <= '0' ; usecc <= '0' ; usedd <= '0' ;
	useaaa <= '0' ; usebbb <= '0' ; useccc <= '0' ; useddd <= '0' ;
	sdataa <= "11" ; sdatab <= "11" ; sdatac <= "11" ; sdatad <= "11" ;
	sdata <= "11" ; pipe_ce0 <= '0' ; pipe_ce1 <= '0' ;
elsif clk'event and clk = '1' then
	az(4) <= az(3) ;
	bz(4) <= bz(3) ;
	cz(4) <= cz(3) ;
	dz(4) <= dz(3) ; 
	aap <= (az(2) xor az(3)) and not az(2) ;	-- find positive edges
	bbp <= (bz(2) xor bz(3)) and not bz(2) ;
	ccp <= (cz(2) xor cz(3)) and not cz(2) ;
	ddp <= (dz(2) xor dz(3)) and not dz(2) ;
	aan <= (az(2) xor az(3)) and az(2) ;		-- find negative edges
	bbn <= (bz(2) xor bz(3)) and bz(2) ;
	ccn <= (cz(2) xor cz(3)) and cz(2) ;
	ddn <= (dz(2) xor dz(3)) and dz(2) ;
	usea1 <= (bbp and not ccp and not ddp and aap) ;
	usea2 <= (bbn and not ccn and not ddn and aan) ;
	useb1 <= (ccp and not ddp and aap and bbp) ;
	useb2 <= (ccn and not ddn and aan and bbn) ;
	usec1 <= (ddp and aap and bbp and ccp) ;
	usec2 <= (ddn and aan and bbn and ccn) ;
	used1 <= (aap and not bbp and not ccp and not ddp) ;
	used2 <= (aan and not bbn and not ccn and not ddn) ;
	usea <= usea1 or usea2 ;
	useb <= useb1 or useb2 ;
	usec <= usec1 or usec2 ;
	used <= used1 or used2 ;
	if (usea or useb or usec or used) = '1' then
		pipe_ce0 <= '1' ;
		pipe_ce1 <= '1' ;
	else 
		pipe_ce1 <= '0' ;
	end if ;
	useaa <= usea ;
	usebb <= useb ;
	usecc <= usec ;
	usedd <= used ;
	if pipe_ce1 = '1' then 
	    	useaaa <= useaa ;
	    	usebbb <= usebb ;
	    	useccc <= usecc ;
	    	useddd <= usedd ;
	end if ;
	sdataa(0) <= az(4) and useaaa ; sdataa(1) <= az(4) and useddd ;
	sdatab(0) <= bz(4) and usebbb ; sdatab(1) <= '0' ;
	sdatac(0) <= cz(4) and useccc ; sdatac(1) <= '0' ;
	sdatad(0) <= dz(4) and useddd ; sdatad(1) <= dz(4) and useaaa ;
	if pipe_ce0 = '1' then
		sdata <= sdataa or sdatab or sdatac or sdatad ;
	end if ;
	if useddd = '1' and useaa = '1' then 
		dvalid <= "00" ;
	elsif useaaa = '1' and usedd = '1' then
		dvalid <= "11" ;
	else 
		dvalid <= "01" ;
	end if ;
	dv <= dvalid ;
end if ;
end process ;

-- get all the samples into the same time domain 

ff_a0 : fdc port map(d => data,  c => clk, clr => rst, q => az(0));
ff_a1 : fdc port map(d => az(0), c => clk, clr => rst, q => az(1));
ff_a2 : fdc port map(d => az(1), c => clk, clr => rst, q => az(2));
ff_a3 : fdc port map(d => az(2), c => clk, clr => rst, q => az(3));

ff_b0 : fdc port map(d => data,  c => clk90, clr => rst, q => bz(0));
ff_b1 : fdc port map(d => bz(0), c => clk,   clr => rst, q => bz(1));
ff_b2 : fdc port map(d => bz(1), c => clk,   clr => rst, q => bz(2));
ff_b3 : fdc port map(d => bz(2), c => clk,   clr => rst, q => bz(3));	

ff_c0 : fdc port map(d => data,  c => notclk, clr => rst, q => cz(0));
ff_c1 : fdc port map(d => cz(0), c => clk90,  clr => rst, q => cz(1));
ff_c2 : fdc port map(d => cz(1), c => clk,    clr => rst, q => cz(2));
ff_c3 : fdc port map(d => cz(2), c => clk,    clr => rst, q => cz(3));	

ff_d0 : fdc port map(d => data,  c => notclk90, clr => rst, q => dz(0));
ff_d1 : fdc port map(d => dz(0), c => notclk,   clr => rst, q => dz(1));
ff_d2 : fdc port map(d => dz(1), c => clk90,    clr => rst, q => dz(2));
ff_d3 : fdc port map(d => dz(2), c => clk,      clr => rst, q => dz(3));	

end arch_data_recovery_virtex2_fast;
