
`timescale 1 ns / 1 ps

	module vga_background_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI_BG
		parameter integer C_S00_AXI_BG_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_BG_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		input wire clk_40M,
		input wire rst_40M,
		output wire [11:0] hcount,
        output wire [11:0] vcount,
        output wire hblnk,
        output wire vblnk,
        output wire vsync,
        output wire hsync,
        output wire [3:0] red,
        output wire [3:0] grn,
        output wire [3:0] blu,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI_BG
		input wire  s00_axi_bg_aclk,
		input wire  s00_axi_bg_aresetn,
		input wire [C_S00_AXI_BG_ADDR_WIDTH-1 : 0] s00_axi_bg_awaddr,
		input wire [2 : 0] s00_axi_bg_awprot,
		input wire  s00_axi_bg_awvalid,
		output wire  s00_axi_bg_awready,
		input wire [C_S00_AXI_BG_DATA_WIDTH-1 : 0] s00_axi_bg_wdata,
		input wire [(C_S00_AXI_BG_DATA_WIDTH/8)-1 : 0] s00_axi_bg_wstrb,
		input wire  s00_axi_bg_wvalid,
		output wire  s00_axi_bg_wready,
		output wire [1 : 0] s00_axi_bg_bresp,
		output wire  s00_axi_bg_bvalid,
		input wire  s00_axi_bg_bready,
		input wire [C_S00_AXI_BG_ADDR_WIDTH-1 : 0] s00_axi_bg_araddr,
		input wire [2 : 0] s00_axi_bg_arprot,
		input wire  s00_axi_bg_arvalid,
		output wire  s00_axi_bg_arready,
		output wire [C_S00_AXI_BG_DATA_WIDTH-1 : 0] s00_axi_bg_rdata,
		output wire [1 : 0] s00_axi_bg_rresp,
		output wire  s00_axi_bg_rvalid,
		input wire  s00_axi_bg_rready
	);
// Instantiation of Axi Bus Interface S00_AXI_BG
	vga_background_v1_0_S00_AXI_BG # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_BG_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_BG_ADDR_WIDTH)
	) vga_background_v1_0_S00_AXI_BG_inst (
	    .clk_40M(clk_40M),
	    .rst_40M(rst_40M),
        .hcount_out(hcount),
        .vcount_out(vcount),
        .hblnk_out(hblnk),
        .vblnk_out(vblnk),
        .vsync_out(vsync),
        .hsync_out(hsync),
        .r_out(red),
        .g_out(grn),
        .b_out(blu),
		.S_AXI_ACLK(s00_axi_bg_aclk),
		.S_AXI_ARESETN(s00_axi_bg_aresetn),
		.S_AXI_AWADDR(s00_axi_bg_awaddr),
		.S_AXI_AWPROT(s00_axi_bg_awprot),
		.S_AXI_AWVALID(s00_axi_bg_awvalid),
		.S_AXI_AWREADY(s00_axi_bg_awready),
		.S_AXI_WDATA(s00_axi_bg_wdata),
		.S_AXI_WSTRB(s00_axi_bg_wstrb),
		.S_AXI_WVALID(s00_axi_bg_wvalid),
		.S_AXI_WREADY(s00_axi_bg_wready),
		.S_AXI_BRESP(s00_axi_bg_bresp),
		.S_AXI_BVALID(s00_axi_bg_bvalid),
		.S_AXI_BREADY(s00_axi_bg_bready),
		.S_AXI_ARADDR(s00_axi_bg_araddr),
		.S_AXI_ARPROT(s00_axi_bg_arprot),
		.S_AXI_ARVALID(s00_axi_bg_arvalid),
		.S_AXI_ARREADY(s00_axi_bg_arready),
		.S_AXI_RDATA(s00_axi_bg_rdata),
		.S_AXI_RRESP(s00_axi_bg_rresp),
		.S_AXI_RVALID(s00_axi_bg_rvalid),
		.S_AXI_RREADY(s00_axi_bg_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
