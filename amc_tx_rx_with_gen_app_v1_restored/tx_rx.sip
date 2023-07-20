set_global_assignment -entity "tx_rx" -library "lib_tx_rx" -name IP_TOOL_NAME "altera_soft_lvds"
set_global_assignment -entity "tx_rx" -library "lib_tx_rx" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "tx_rx" -library "lib_tx_rx" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_tx_rx" -name SPD_FILE [file join $::quartus(sip_path) "tx_rx.spd"]

set_global_assignment -library "lib_tx_rx" -name MISC_FILE [file join $::quartus(sip_path) "tx_rx_sim/tx_rx.vhd"]
