
`timescale 1 ns / 1 ps

	module vga_drawrect_char_v1_0 #
	(
		// Users to add parameters here
		
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI_TEXT_MEM
		parameter integer C_S_AXI_TEXT_MEM_ID_WIDTH	= 1,
		parameter integer C_S_AXI_TEXT_MEM_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_TEXT_MEM_ADDR_WIDTH	= 7,
		parameter integer C_S_AXI_TEXT_MEM_AWUSER_WIDTH	= 0,
		parameter integer C_S_AXI_TEXT_MEM_ARUSER_WIDTH	= 0,
		parameter integer C_S_AXI_TEXT_MEM_WUSER_WIDTH	= 0,
		parameter integer C_S_AXI_TEXT_MEM_RUSER_WIDTH	= 0,
		parameter integer C_S_AXI_TEXT_MEM_BUSER_WIDTH	= 0,

		// Parameters of Axi Slave Bus Interface S_AXI_CHAR_CTRL
		parameter integer C_S_AXI_CHAR_CTRL_DATA_WIDTH	= 64,
		parameter integer C_S_AXI_CHAR_CTRL_ADDR_WIDTH	= 7
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

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI_TEXT_MEM
		input wire  s_axi_text_mem_aclk,
		input wire  s_axi_text_mem_aresetn,
		input wire [C_S_AXI_TEXT_MEM_ID_WIDTH-1 : 0] s_axi_text_mem_awid,
		input wire [C_S_AXI_TEXT_MEM_ADDR_WIDTH-1 : 0] s_axi_text_mem_awaddr,
		input wire [7 : 0] s_axi_text_mem_awlen,
		input wire [2 : 0] s_axi_text_mem_awsize,
		input wire [1 : 0] s_axi_text_mem_awburst,
		input wire  s_axi_text_mem_awlock,
		input wire [3 : 0] s_axi_text_mem_awcache,
		input wire [2 : 0] s_axi_text_mem_awprot,
		input wire [3 : 0] s_axi_text_mem_awqos,
		input wire [3 : 0] s_axi_text_mem_awregion,
		input wire [C_S_AXI_TEXT_MEM_AWUSER_WIDTH-1 : 0] s_axi_text_mem_awuser,
		input wire  s_axi_text_mem_awvalid,
		output wire  s_axi_text_mem_awready,
		input wire [C_S_AXI_TEXT_MEM_DATA_WIDTH-1 : 0] s_axi_text_mem_wdata,
		input wire [(C_S_AXI_TEXT_MEM_DATA_WIDTH/8)-1 : 0] s_axi_text_mem_wstrb,
		input wire  s_axi_text_mem_wlast,
		input wire [C_S_AXI_TEXT_MEM_WUSER_WIDTH-1 : 0] s_axi_text_mem_wuser,
		input wire  s_axi_text_mem_wvalid,
		output wire  s_axi_text_mem_wready,
		output wire [C_S_AXI_TEXT_MEM_ID_WIDTH-1 : 0] s_axi_text_mem_bid,
		output wire [1 : 0] s_axi_text_mem_bresp,
		output wire [C_S_AXI_TEXT_MEM_BUSER_WIDTH-1 : 0] s_axi_text_mem_buser,
		output wire  s_axi_text_mem_bvalid,
		input wire  s_axi_text_mem_bready,
		input wire [C_S_AXI_TEXT_MEM_ID_WIDTH-1 : 0] s_axi_text_mem_arid,
		input wire [C_S_AXI_TEXT_MEM_ADDR_WIDTH-1 : 0] s_axi_text_mem_araddr,
		input wire [7 : 0] s_axi_text_mem_arlen,
		input wire [2 : 0] s_axi_text_mem_arsize,
		input wire [1 : 0] s_axi_text_mem_arburst,
		input wire  s_axi_text_mem_arlock,
		input wire [3 : 0] s_axi_text_mem_arcache,
		input wire [2 : 0] s_axi_text_mem_arprot,
		input wire [3 : 0] s_axi_text_mem_arqos,
		input wire [3 : 0] s_axi_text_mem_arregion,
		input wire [C_S_AXI_TEXT_MEM_ARUSER_WIDTH-1 : 0] s_axi_text_mem_aruser,
		input wire  s_axi_text_mem_arvalid,
		output wire  s_axi_text_mem_arready,
		output wire [C_S_AXI_TEXT_MEM_ID_WIDTH-1 : 0] s_axi_text_mem_rid,
		output wire [C_S_AXI_TEXT_MEM_DATA_WIDTH-1 : 0] s_axi_text_mem_rdata,
		output wire [1 : 0] s_axi_text_mem_rresp,
		output wire  s_axi_text_mem_rlast,
		output wire [C_S_AXI_TEXT_MEM_RUSER_WIDTH-1 : 0] s_axi_text_mem_ruser,
		output wire  s_axi_text_mem_rvalid,
		input wire  s_axi_text_mem_rready,

		// Ports of Axi Slave Bus Interface S_AXI_CHAR_CTRL
		input wire  s_axi_char_ctrl_aclk,
		input wire  s_axi_char_ctrl_aresetn,
		input wire [C_S_AXI_CHAR_CTRL_ADDR_WIDTH-1 : 0] s_axi_char_ctrl_awaddr,
		input wire [2 : 0] s_axi_char_ctrl_awprot,
		input wire  s_axi_char_ctrl_awvalid,
		output wire  s_axi_char_ctrl_awready,
		input wire [C_S_AXI_CHAR_CTRL_DATA_WIDTH-1 : 0] s_axi_char_ctrl_wdata,
		input wire [(C_S_AXI_CHAR_CTRL_DATA_WIDTH/8)-1 : 0] s_axi_char_ctrl_wstrb,
		input wire  s_axi_char_ctrl_wvalid,
		output wire  s_axi_char_ctrl_wready,
		output wire [1 : 0] s_axi_char_ctrl_bresp,
		output wire  s_axi_char_ctrl_bvalid,
		input wire  s_axi_char_ctrl_bready,
		input wire [C_S_AXI_CHAR_CTRL_ADDR_WIDTH-1 : 0] s_axi_char_ctrl_araddr,
		input wire [2 : 0] s_axi_char_ctrl_arprot,
		input wire  s_axi_char_ctrl_arvalid,
		output wire  s_axi_char_ctrl_arready,
		output wire [C_S_AXI_CHAR_CTRL_DATA_WIDTH-1 : 0] s_axi_char_ctrl_rdata,
		output wire [1 : 0] s_axi_char_ctrl_rresp,
		output wire  s_axi_char_ctrl_rvalid,
		input wire  s_axi_char_ctrl_rready
	);
	
	wire [7:0] char_xy;
	wire [6:0] char_code;
	wire [7:0] char_pixel;
	wire [3:0] char_line;
	
// Instantiation of Axi Bus Interface S_AXI_TEXT_MEM
	vga_drawrect_char_v1_0_S_AXI_TEXT_MEM # ( 
		.C_S_AXI_ID_WIDTH(C_S_AXI_TEXT_MEM_ID_WIDTH),
		.C_S_AXI_DATA_WIDTH(C_S_AXI_TEXT_MEM_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_TEXT_MEM_ADDR_WIDTH),
		.C_S_AXI_AWUSER_WIDTH(C_S_AXI_TEXT_MEM_AWUSER_WIDTH),
		.C_S_AXI_ARUSER_WIDTH(C_S_AXI_TEXT_MEM_ARUSER_WIDTH),
		.C_S_AXI_WUSER_WIDTH(C_S_AXI_TEXT_MEM_WUSER_WIDTH),
		.C_S_AXI_RUSER_WIDTH(C_S_AXI_TEXT_MEM_RUSER_WIDTH),
		.C_S_AXI_BUSER_WIDTH(C_S_AXI_TEXT_MEM_BUSER_WIDTH)
	) vga_drawrect_char_v1_0_S_AXI_TEXT_MEM_inst (
	    .char_xy(char_xy),
	    
	    .char_code(char_code),
	    
		.S_AXI_ACLK(s_axi_text_mem_aclk),
		.S_AXI_ARESETN(s_axi_text_mem_aresetn),
		.S_AXI_AWID(s_axi_text_mem_awid),
		.S_AXI_AWADDR(s_axi_text_mem_awaddr),
		.S_AXI_AWLEN(s_axi_text_mem_awlen),
		.S_AXI_AWSIZE(s_axi_text_mem_awsize),
		.S_AXI_AWBURST(s_axi_text_mem_awburst),
		.S_AXI_AWLOCK(s_axi_text_mem_awlock),
		.S_AXI_AWCACHE(s_axi_text_mem_awcache),
		.S_AXI_AWPROT(s_axi_text_mem_awprot),
		.S_AXI_AWQOS(s_axi_text_mem_awqos),
		.S_AXI_AWREGION(s_axi_text_mem_awregion),
		.S_AXI_AWUSER(s_axi_text_mem_awuser),
		.S_AXI_AWVALID(s_axi_text_mem_awvalid),
		.S_AXI_AWREADY(s_axi_text_mem_awready),
		.S_AXI_WDATA(s_axi_text_mem_wdata),
		.S_AXI_WSTRB(s_axi_text_mem_wstrb),
		.S_AXI_WLAST(s_axi_text_mem_wlast),
		.S_AXI_WUSER(s_axi_text_mem_wuser),
		.S_AXI_WVALID(s_axi_text_mem_wvalid),
		.S_AXI_WREADY(s_axi_text_mem_wready),
		.S_AXI_BID(s_axi_text_mem_bid),
		.S_AXI_BRESP(s_axi_text_mem_bresp),
		.S_AXI_BUSER(s_axi_text_mem_buser),
		.S_AXI_BVALID(s_axi_text_mem_bvalid),
		.S_AXI_BREADY(s_axi_text_mem_bready),
		.S_AXI_ARID(s_axi_text_mem_arid),
		.S_AXI_ARADDR(s_axi_text_mem_araddr),
		.S_AXI_ARLEN(s_axi_text_mem_arlen),
		.S_AXI_ARSIZE(s_axi_text_mem_arsize),
		.S_AXI_ARBURST(s_axi_text_mem_arburst),
		.S_AXI_ARLOCK(s_axi_text_mem_arlock),
		.S_AXI_ARCACHE(s_axi_text_mem_arcache),
		.S_AXI_ARPROT(s_axi_text_mem_arprot),
		.S_AXI_ARQOS(s_axi_text_mem_arqos),
		.S_AXI_ARREGION(s_axi_text_mem_arregion),
		.S_AXI_ARUSER(s_axi_text_mem_aruser),
		.S_AXI_ARVALID(s_axi_text_mem_arvalid),
		.S_AXI_ARREADY(s_axi_text_mem_arready),
		.S_AXI_RID(s_axi_text_mem_rid),
		.S_AXI_RDATA(s_axi_text_mem_rdata),
		.S_AXI_RRESP(s_axi_text_mem_rresp),
		.S_AXI_RLAST(s_axi_text_mem_rlast),
		.S_AXI_RUSER(s_axi_text_mem_ruser),
		.S_AXI_RVALID(s_axi_text_mem_rvalid),
		.S_AXI_RREADY(s_axi_text_mem_rready)
	);

// Instantiation of Axi Bus Interface S_AXI_CHAR_CTRL
	vga_drawrect_char_v1_0_S_AXI_CHAR_CTRL # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_CHAR_CTRL_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_CHAR_CTRL_ADDR_WIDTH)
	) vga_drawrect_char_v1_0_S_AXI_CHAR_CTRL_inst (
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
        .char_pixel(char_pixel),
        
        .char_xy(char_xy),
        .char_line(char_line),
        .hcount_out(hcount_out),
        .vcount_out(vcount_out),
        .hblnk_out(hblnk_out),
        .vblnk_out(vblnk_out),
        .vsync_out(vsync_out),
        .hsync_out(hsync_out),
        .r_out(r_out),
        .g_out(g_out),
        .b_out(b_out),
        
		.S_AXI_ACLK(s_axi_char_ctrl_aclk),
		.S_AXI_ARESETN(s_axi_char_ctrl_aresetn),
		.S_AXI_AWADDR(s_axi_char_ctrl_awaddr),
		.S_AXI_AWPROT(s_axi_char_ctrl_awprot),
		.S_AXI_AWVALID(s_axi_char_ctrl_awvalid),
		.S_AXI_AWREADY(s_axi_char_ctrl_awready),
		.S_AXI_WDATA(s_axi_char_ctrl_wdata),
		.S_AXI_WSTRB(s_axi_char_ctrl_wstrb),
		.S_AXI_WVALID(s_axi_char_ctrl_wvalid),
		.S_AXI_WREADY(s_axi_char_ctrl_wready),
		.S_AXI_BRESP(s_axi_char_ctrl_bresp),
		.S_AXI_BVALID(s_axi_char_ctrl_bvalid),
		.S_AXI_BREADY(s_axi_char_ctrl_bready),
		.S_AXI_ARADDR(s_axi_char_ctrl_araddr),
		.S_AXI_ARPROT(s_axi_char_ctrl_arprot),
		.S_AXI_ARVALID(s_axi_char_ctrl_arvalid),
		.S_AXI_ARREADY(s_axi_char_ctrl_arready),
		.S_AXI_RDATA(s_axi_char_ctrl_rdata),
		.S_AXI_RRESP(s_axi_char_ctrl_rresp),
		.S_AXI_RVALID(s_axi_char_ctrl_rvalid),
		.S_AXI_RREADY(s_axi_char_ctrl_rready)
	);

	// Add user logic here
	
    font_rom my_font (
        .clk(clk_40M),
        .addr({char_code, char_line}),
        .char_line_pixels(char_pixel)
    );

	// User logic ends

	endmodule
