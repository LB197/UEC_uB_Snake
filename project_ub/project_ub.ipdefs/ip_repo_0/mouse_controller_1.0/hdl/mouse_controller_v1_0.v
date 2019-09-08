
`timescale 1 ns / 1 ps

	module mouse_controller_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here
        input wire clk_40M,
        input wire rst_40M,
        input wire [11:0] hcount_in,
        input wire [11:0] vcount_in,
        input wire hblnk_in,
        input wire vblnk_in,
        input wire vsync_in,
        input wire hsync_in,
        input wire [3:0] r_in,
        input wire [3:0] g_in,
        input wire [3:0] b_in,
        output wire [11:0] hcount_out,
        output wire [11:0] vcount_out,
        output wire hblnk_out,
        output wire vblnk_out,
        output wire vsync_out,
        output wire hsync_out,
        output wire [3:0] r_out,
        output wire [3:0] g_out,
        output wire [3:0] b_out,
        inout wire ps2_clk,
        inout wire ps2_data,
        output wire LMB_int,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	mouse_controller_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) mouse_controller_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		.clk_40M(clk_40M),
        .rst_40M(rst_40M),
        .hcount_in(hcount_in),
        .vcount_in(vcount_in),
        .hblnk_in(hblnk_in),
        .vblnk_in(vblnk_in),
        .vsync_in(vsync_in),
        .hsync_in(hsync_in),
        .r_in(r_in),
        .g_in(g_in),
        .b_in(b_in),
        .hcount_out(hcount_out),
        .vcount_out(vcount_out),
        .hblnk_out(hblnk_out),
        .vblnk_out(vblnk_out),
        .vsync_out(vsync_out),
        .hsync_out(hsync_out),
        .r_out(r_out),
        .g_out(g_out),
        .b_out(b_out),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .LMB_int(LMB_int)
       
	);

	// Add user logic here

	// User logic ends

	endmodule
