//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Sun Sep  8 16:51:21 2019
//Host        : Dell running 64-bit major release  (build 9200)
//Command     : generate_target microblaze_wrapper.bd
//Design      : microblaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module microblaze_wrapper
   (b,
    g,
    hs,
    ps2_clk,
    ps2_data,
    push_buttons_4bits_tri_i,
    r,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd,
    vs);
  output [3:0]b;
  output [3:0]g;
  output hs;
  inout ps2_clk;
  inout ps2_data;
  input [3:0]push_buttons_4bits_tri_i;
  output [3:0]r;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;
  output vs;

  wire [3:0]b;
  wire [3:0]g;
  wire hs;
  wire ps2_clk;
  wire ps2_data;
  wire [3:0]push_buttons_4bits_tri_i;
  wire [3:0]r;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;
  wire vs;

  microblaze microblaze_i
       (.b(b),
        .g(g),
        .hs(hs),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .push_buttons_4bits_tri_i(push_buttons_4bits_tri_i),
        .r(r),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd),
        .vs(vs));
endmodule
