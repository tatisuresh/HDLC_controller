set_global_assignment -entity "lvds_ip" -library "lib_lvds_ip" -name IP_TOOL_NAME "altera_soft_lvds"
set_global_assignment -entity "lvds_ip" -library "lib_lvds_ip" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "lvds_ip" -library "lib_lvds_ip" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_lvds_ip" -name SPD_FILE [file join $::quartus(sip_path) "lvds_ip.spd"]

set_global_assignment -library "lib_lvds_ip" -name MISC_FILE [file join $::quartus(sip_path) "lvds_ip_sim/lvds_ip.vhd"]
