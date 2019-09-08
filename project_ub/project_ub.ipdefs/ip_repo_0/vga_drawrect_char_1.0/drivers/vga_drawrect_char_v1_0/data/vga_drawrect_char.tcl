

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "vga_drawrect_char" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_CHAR_CTRL_BASEADDR" "C_S_AXI_CHAR_CTRL_HIGHADDR" "C_S_AXI_TEXT_MEM_BASEADDR" "C_S_AXI_TEXT_MEM_HIGHADDR"
}
