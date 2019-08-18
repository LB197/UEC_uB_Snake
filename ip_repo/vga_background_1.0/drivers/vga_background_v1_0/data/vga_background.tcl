

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "vga_background" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BG_BASEADDR" "C_S00_AXI_BG_HIGHADDR"
}
