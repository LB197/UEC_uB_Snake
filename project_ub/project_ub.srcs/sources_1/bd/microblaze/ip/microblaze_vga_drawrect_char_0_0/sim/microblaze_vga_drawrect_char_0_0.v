// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:vga_drawrect_char:1.1
// IP Revision: 8

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module microblaze_vga_drawrect_char_0_0 (
  clk_40M,
  rst_40M,
  hcount_in,
  vcount_in,
  hblnk_in,
  vblnk_in,
  vsync_in,
  hsync_in,
  r_in,
  g_in,
  b_in,
  hcount_out,
  vcount_out,
  hblnk_out,
  vblnk_out,
  vsync_out,
  hsync_out,
  r_out,
  g_out,
  b_out,
  s_axi_text_mem_awaddr,
  s_axi_text_mem_awlen,
  s_axi_text_mem_awsize,
  s_axi_text_mem_awburst,
  s_axi_text_mem_awlock,
  s_axi_text_mem_awcache,
  s_axi_text_mem_awprot,
  s_axi_text_mem_awregion,
  s_axi_text_mem_awqos,
  s_axi_text_mem_awvalid,
  s_axi_text_mem_awready,
  s_axi_text_mem_wdata,
  s_axi_text_mem_wstrb,
  s_axi_text_mem_wlast,
  s_axi_text_mem_wvalid,
  s_axi_text_mem_wready,
  s_axi_text_mem_bresp,
  s_axi_text_mem_bvalid,
  s_axi_text_mem_bready,
  s_axi_text_mem_araddr,
  s_axi_text_mem_arlen,
  s_axi_text_mem_arsize,
  s_axi_text_mem_arburst,
  s_axi_text_mem_arlock,
  s_axi_text_mem_arcache,
  s_axi_text_mem_arprot,
  s_axi_text_mem_arregion,
  s_axi_text_mem_arqos,
  s_axi_text_mem_arvalid,
  s_axi_text_mem_arready,
  s_axi_text_mem_rdata,
  s_axi_text_mem_rresp,
  s_axi_text_mem_rlast,
  s_axi_text_mem_rvalid,
  s_axi_text_mem_rready,
  s_axi_text_mem_aclk,
  s_axi_text_mem_aresetn,
  s_axi_char_ctrl_awaddr,
  s_axi_char_ctrl_awprot,
  s_axi_char_ctrl_awvalid,
  s_axi_char_ctrl_awready,
  s_axi_char_ctrl_wdata,
  s_axi_char_ctrl_wstrb,
  s_axi_char_ctrl_wvalid,
  s_axi_char_ctrl_wready,
  s_axi_char_ctrl_bresp,
  s_axi_char_ctrl_bvalid,
  s_axi_char_ctrl_bready,
  s_axi_char_ctrl_araddr,
  s_axi_char_ctrl_arprot,
  s_axi_char_ctrl_arvalid,
  s_axi_char_ctrl_arready,
  s_axi_char_ctrl_rdata,
  s_axi_char_ctrl_rresp,
  s_axi_char_ctrl_rvalid,
  s_axi_char_ctrl_rready,
  s_axi_char_ctrl_aclk,
  s_axi_char_ctrl_aresetn
);

input wire clk_40M;
input wire rst_40M;
input wire [11 : 0] hcount_in;
input wire [11 : 0] vcount_in;
input wire hblnk_in;
input wire vblnk_in;
input wire vsync_in;
input wire hsync_in;
input wire [3 : 0] r_in;
input wire [3 : 0] g_in;
input wire [3 : 0] b_in;
output wire [11 : 0] hcount_out;
output wire [11 : 0] vcount_out;
output wire hblnk_out;
output wire vblnk_out;
output wire vsync_out;
output wire hsync_out;
output wire [3 : 0] r_out;
output wire [3 : 0] g_out;
output wire [3 : 0] b_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWADDR" *)
input wire [6 : 0] s_axi_text_mem_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWLEN" *)
input wire [7 : 0] s_axi_text_mem_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWSIZE" *)
input wire [2 : 0] s_axi_text_mem_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWBURST" *)
input wire [1 : 0] s_axi_text_mem_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWLOCK" *)
input wire s_axi_text_mem_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWCACHE" *)
input wire [3 : 0] s_axi_text_mem_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWPROT" *)
input wire [2 : 0] s_axi_text_mem_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWREGION" *)
input wire [3 : 0] s_axi_text_mem_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWQOS" *)
input wire [3 : 0] s_axi_text_mem_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWVALID" *)
input wire s_axi_text_mem_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM AWREADY" *)
output wire s_axi_text_mem_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM WDATA" *)
input wire [31 : 0] s_axi_text_mem_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM WSTRB" *)
input wire [3 : 0] s_axi_text_mem_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM WLAST" *)
input wire s_axi_text_mem_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM WVALID" *)
input wire s_axi_text_mem_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM WREADY" *)
output wire s_axi_text_mem_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM BRESP" *)
output wire [1 : 0] s_axi_text_mem_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM BVALID" *)
output wire s_axi_text_mem_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM BREADY" *)
input wire s_axi_text_mem_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARADDR" *)
input wire [6 : 0] s_axi_text_mem_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARLEN" *)
input wire [7 : 0] s_axi_text_mem_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARSIZE" *)
input wire [2 : 0] s_axi_text_mem_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARBURST" *)
input wire [1 : 0] s_axi_text_mem_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARLOCK" *)
input wire s_axi_text_mem_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARCACHE" *)
input wire [3 : 0] s_axi_text_mem_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARPROT" *)
input wire [2 : 0] s_axi_text_mem_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARREGION" *)
input wire [3 : 0] s_axi_text_mem_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARQOS" *)
input wire [3 : 0] s_axi_text_mem_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARVALID" *)
input wire s_axi_text_mem_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM ARREADY" *)
output wire s_axi_text_mem_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM RDATA" *)
output wire [31 : 0] s_axi_text_mem_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM RRESP" *)
output wire [1 : 0] s_axi_text_mem_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM RLAST" *)
output wire s_axi_text_mem_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM RVALID" *)
output wire s_axi_text_mem_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_TEXT_MEM, WIZ_DATA_WIDTH 32, WIZ_MEMORY_SIZE 128, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_o\
ut1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_TEXT_MEM RREADY" *)
input wire s_axi_text_mem_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_TEXT_MEM_CLK, ASSOCIATED_BUSIF S_AXI_TEXT_MEM, ASSOCIATED_RESET s_axi_text_mem_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_TEXT_MEM_CLK CLK" *)
input wire s_axi_text_mem_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_TEXT_MEM_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_TEXT_MEM_RST RST" *)
input wire s_axi_text_mem_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL AWADDR" *)
input wire [6 : 0] s_axi_char_ctrl_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL AWPROT" *)
input wire [2 : 0] s_axi_char_ctrl_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL AWVALID" *)
input wire s_axi_char_ctrl_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL AWREADY" *)
output wire s_axi_char_ctrl_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL WDATA" *)
input wire [63 : 0] s_axi_char_ctrl_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL WSTRB" *)
input wire [7 : 0] s_axi_char_ctrl_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL WVALID" *)
input wire s_axi_char_ctrl_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL WREADY" *)
output wire s_axi_char_ctrl_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL BRESP" *)
output wire [1 : 0] s_axi_char_ctrl_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL BVALID" *)
output wire s_axi_char_ctrl_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL BREADY" *)
input wire s_axi_char_ctrl_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL ARADDR" *)
input wire [6 : 0] s_axi_char_ctrl_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL ARPROT" *)
input wire [2 : 0] s_axi_char_ctrl_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL ARVALID" *)
input wire s_axi_char_ctrl_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL ARREADY" *)
output wire s_axi_char_ctrl_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL RDATA" *)
output wire [63 : 0] s_axi_char_ctrl_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL RRESP" *)
output wire [1 : 0] s_axi_char_ctrl_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL RVALID" *)
output wire s_axi_char_ctrl_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CHAR_CTRL, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 16, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_o\
ut1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CHAR_CTRL RREADY" *)
input wire s_axi_char_ctrl_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CHAR_CTRL_CLK, ASSOCIATED_BUSIF S_AXI_CHAR_CTRL, ASSOCIATED_RESET s_axi_char_ctrl_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_CHAR_CTRL_CLK CLK" *)
input wire s_axi_char_ctrl_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CHAR_CTRL_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_CHAR_CTRL_RST RST" *)
input wire s_axi_char_ctrl_aresetn;

  vga_drawrect_char_v1_0 #(
    .C_S_AXI_TEXT_MEM_ID_WIDTH(0),  // Width of ID for for write address, write data, read address and read data
    .C_S_AXI_TEXT_MEM_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_S_AXI_TEXT_MEM_ADDR_WIDTH(7),  // Width of S_AXI address bus
    .C_S_AXI_TEXT_MEM_AWUSER_WIDTH(0),  // Width of optional user defined signal in write address channel
    .C_S_AXI_TEXT_MEM_ARUSER_WIDTH(0),  // Width of optional user defined signal in read address channel
    .C_S_AXI_TEXT_MEM_WUSER_WIDTH(0),  // Width of optional user defined signal in write data channel
    .C_S_AXI_TEXT_MEM_RUSER_WIDTH(0),  // Width of optional user defined signal in read data channel
    .C_S_AXI_TEXT_MEM_BUSER_WIDTH(0),  // Width of optional user defined signal in write response channel
    .C_S_AXI_CHAR_CTRL_DATA_WIDTH(64),  // Width of S_AXI data bus
    .C_S_AXI_CHAR_CTRL_ADDR_WIDTH(7)  // Width of S_AXI address bus
  ) inst (
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
    .s_axi_text_mem_awid(1'B0),
    .s_axi_text_mem_awaddr(s_axi_text_mem_awaddr),
    .s_axi_text_mem_awlen(s_axi_text_mem_awlen),
    .s_axi_text_mem_awsize(s_axi_text_mem_awsize),
    .s_axi_text_mem_awburst(s_axi_text_mem_awburst),
    .s_axi_text_mem_awlock(s_axi_text_mem_awlock),
    .s_axi_text_mem_awcache(s_axi_text_mem_awcache),
    .s_axi_text_mem_awprot(s_axi_text_mem_awprot),
    .s_axi_text_mem_awregion(s_axi_text_mem_awregion),
    .s_axi_text_mem_awqos(s_axi_text_mem_awqos),
    .s_axi_text_mem_awuser(1'B0),
    .s_axi_text_mem_awvalid(s_axi_text_mem_awvalid),
    .s_axi_text_mem_awready(s_axi_text_mem_awready),
    .s_axi_text_mem_wdata(s_axi_text_mem_wdata),
    .s_axi_text_mem_wstrb(s_axi_text_mem_wstrb),
    .s_axi_text_mem_wlast(s_axi_text_mem_wlast),
    .s_axi_text_mem_wuser(1'B0),
    .s_axi_text_mem_wvalid(s_axi_text_mem_wvalid),
    .s_axi_text_mem_wready(s_axi_text_mem_wready),
    .s_axi_text_mem_bid(),
    .s_axi_text_mem_bresp(s_axi_text_mem_bresp),
    .s_axi_text_mem_buser(),
    .s_axi_text_mem_bvalid(s_axi_text_mem_bvalid),
    .s_axi_text_mem_bready(s_axi_text_mem_bready),
    .s_axi_text_mem_arid(1'B0),
    .s_axi_text_mem_araddr(s_axi_text_mem_araddr),
    .s_axi_text_mem_arlen(s_axi_text_mem_arlen),
    .s_axi_text_mem_arsize(s_axi_text_mem_arsize),
    .s_axi_text_mem_arburst(s_axi_text_mem_arburst),
    .s_axi_text_mem_arlock(s_axi_text_mem_arlock),
    .s_axi_text_mem_arcache(s_axi_text_mem_arcache),
    .s_axi_text_mem_arprot(s_axi_text_mem_arprot),
    .s_axi_text_mem_arregion(s_axi_text_mem_arregion),
    .s_axi_text_mem_arqos(s_axi_text_mem_arqos),
    .s_axi_text_mem_aruser(1'B0),
    .s_axi_text_mem_arvalid(s_axi_text_mem_arvalid),
    .s_axi_text_mem_arready(s_axi_text_mem_arready),
    .s_axi_text_mem_rid(),
    .s_axi_text_mem_rdata(s_axi_text_mem_rdata),
    .s_axi_text_mem_rresp(s_axi_text_mem_rresp),
    .s_axi_text_mem_rlast(s_axi_text_mem_rlast),
    .s_axi_text_mem_ruser(),
    .s_axi_text_mem_rvalid(s_axi_text_mem_rvalid),
    .s_axi_text_mem_rready(s_axi_text_mem_rready),
    .s_axi_text_mem_aclk(s_axi_text_mem_aclk),
    .s_axi_text_mem_aresetn(s_axi_text_mem_aresetn),
    .s_axi_char_ctrl_awaddr(s_axi_char_ctrl_awaddr),
    .s_axi_char_ctrl_awprot(s_axi_char_ctrl_awprot),
    .s_axi_char_ctrl_awvalid(s_axi_char_ctrl_awvalid),
    .s_axi_char_ctrl_awready(s_axi_char_ctrl_awready),
    .s_axi_char_ctrl_wdata(s_axi_char_ctrl_wdata),
    .s_axi_char_ctrl_wstrb(s_axi_char_ctrl_wstrb),
    .s_axi_char_ctrl_wvalid(s_axi_char_ctrl_wvalid),
    .s_axi_char_ctrl_wready(s_axi_char_ctrl_wready),
    .s_axi_char_ctrl_bresp(s_axi_char_ctrl_bresp),
    .s_axi_char_ctrl_bvalid(s_axi_char_ctrl_bvalid),
    .s_axi_char_ctrl_bready(s_axi_char_ctrl_bready),
    .s_axi_char_ctrl_araddr(s_axi_char_ctrl_araddr),
    .s_axi_char_ctrl_arprot(s_axi_char_ctrl_arprot),
    .s_axi_char_ctrl_arvalid(s_axi_char_ctrl_arvalid),
    .s_axi_char_ctrl_arready(s_axi_char_ctrl_arready),
    .s_axi_char_ctrl_rdata(s_axi_char_ctrl_rdata),
    .s_axi_char_ctrl_rresp(s_axi_char_ctrl_rresp),
    .s_axi_char_ctrl_rvalid(s_axi_char_ctrl_rvalid),
    .s_axi_char_ctrl_rready(s_axi_char_ctrl_rready),
    .s_axi_char_ctrl_aclk(s_axi_char_ctrl_aclk),
    .s_axi_char_ctrl_aresetn(s_axi_char_ctrl_aresetn)
  );
endmodule
