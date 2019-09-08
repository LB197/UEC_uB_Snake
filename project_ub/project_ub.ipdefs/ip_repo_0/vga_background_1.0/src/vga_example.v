// File: vga_example.v
// This is the top level design for EE178 Lab #4.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_example (
  input wire pclk,
  input wire rst,
  input wire [11:0] rgb,
  
  output wire [11:0] hcount,
  output wire [11:0] vcount,
  output wire hblnk,
  output wire vblnk,
  output wire vsync,
  output wire hsync,
  output wire [3:0] r,
  output wire [3:0] g,
  output wire [3:0] b
  );

  // Instantiate the vga_timing module, which is
  // the module you are designing for this lab.
  
  //VGA_timing output wires
  wire [11:0] vcount_vt, hcount_vt;
  wire vsync_vt, hsync_vt;
  wire vblnk_vt, hblnk_vt;

  vga_timing my_timing (
    .vcount(vcount_vt),
    .vsync(vsync_vt),
    .vblnk(vblnk_vt),
    .hcount(hcount_vt),
    .hsync(hsync_vt),
    .hblnk(hblnk_vt),
    .pclk(pclk),
    .rst(rst)
  );
  
  // Draw_background output wires
  wire [11:0] rgb_db;
  reg [11:0] rgb_d;

    draw_background my_background (
        .pclk(pclk),
        .rst(rst),
        .vcount_in(vcount_vt),
        .vsync_in(vsync_vt),
        .vblnk_in(vblnk_vt),
        .hcount_in(hcount_vt),
        .hsync_in(hsync_vt),
        .hblnk_in(hblnk_vt),
        .rgb(rgb_d),
        
        .vcount_out(vcount),
        .vsync_out(vsync),
        .vblnk_out(vblnk),
        .hcount_out(hcount),
        .hsync_out(hsync),
        .hblnk_out(hblnk),
        .rgb_out(rgb_db)
    );
    always @(posedge pclk)
        if(rst)
            rgb_d <= 0;
        else
            rgb_d <= rgb;
            
    assign r = rgb_db[11:8];
    assign g = rgb_db[7:4];
    assign b = rgb_db[3:0];

endmodule
