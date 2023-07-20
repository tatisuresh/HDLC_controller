## Generated SDC file "AMC.out.sdc"
## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.

## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

## DATE    "Thu Jan 12 19:25:07 2023"

##
## DEVICE  "10M04SAE144I7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {Clk33mhz_in} -period 3.030 -waveform { 0.000 1.515 } [get_ports {CLK0}]
create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
#create_clock -name {clk_132} -period 7.575 -waveform { 0.000 3.787 } [get_ports {inst1|Clock160MHz}]
create_clock -name {Clock160MHz} -period 6.25 -waveform { 0.000 3.125 } [get_ports {sig_clk160mhz}]


#**************************************************************
# Create Generated Clock
#**************************************************************

#create_generated_clock -name {Clock160MHz} -source {CLK0} -divide_by 2 [get_pins {clk_132}]

set pll_clk [get_clocks "*inst1*|Clock160MHz"]
set pin_clk [get_clocks "*inst1*|Clock99MHz"]
set set_clk [get_clocks "*inst1*|Clock687MHz"]



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/BLS0}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/BLS1}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/CS2}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/OE}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/SCC_RST}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {/WE}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {A[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {CLK0}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {CLK1}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {CLK2}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {D[15]}]
#set_input_delay -add_delay  -clock [get_clocks {Clk33mhz_in}]  2.000 [get_ports {sig_clk33mhz}]


#**************************************************************
# Set Output Delay
#**************************************************************
#set_output_delay -add_delay  -clock [get_clocks {Clk33mhz_in}]  2.000 [get_ports {sig_clk33mhz}]
set_output_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {pin_136_out}]
set_output_delay -add_delay  -clock [get_clocks {clk_132}]  2.000 [get_ports {pin_138_out}]


#**************************************************************
# Set Clock Groups
#**************************************************************

#set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
#set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
#set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
#set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 

set_clock_groups -asynchronous -group [get_clocks {Clock160MHz}] -group [get_clocks {clk_132}]


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_ports Clock160MHz ] -to [get_ports CLK0]
#set_false_path -from [get_ports sig_clk160mhz] -to [get_ports CLK0]
#set_false_path -to [get_ports sig_clk160mhz] -from [get_ports CLK0]
set_false_path -to [get_ports Clock160MHz] -from [get_ports CLK0]

set_false_path -from {CPU_Interafce:inst2|*} -to {CPU_Interafce:inst2|sig_debug_*}


#**************************************************************
# Set Multicycle Path
#**************************************************************

#set_multicycle_path -setup -from [{CPU_Interafce:inst2|sig_Addr_A7A0[*]}] -to [{CPU_Interafce:inst2|Data_inout[*]~reg0}]
set_multicycle_path -setup -to {CPU_Interafce:inst2|Data_inout[*]~en} -from {CPU_Interafce:inst2|sig_Addr_A7A0[*]}
#set_multicycle_path -setup -to {CPU_Interafce:inst2|Data_inout[*]~en} -from {CPU_Interafce:inst2|sig_Bhe_n_in}
#set_multicycle_path -setup -to {CPU_Interafce:inst2|Data_inout[*]~reg0} -from {CPU_Interafce:inst2|sig_Bhe_n_in}
#set_multicycle_path -setup -to {CPU_Interafce:inst2|rxfrma_mem[11][*]} -from {CPU_Interafce:inst2|sig_RxDataWr2_n}

#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************
