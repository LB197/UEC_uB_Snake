// File: vga_timing.v
// This is the vga timing design for EE178 Lab #4.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_timing (
  output reg [11:0] vcount,
  output wire vsync,
  output wire vblnk,
  output reg [11:0] hcount,
  output wire hsync,
  output wire hblnk,
  input wire pclk,
  input wire rst
  );
    
    localparam H_TOTAL_TIME = 1056;
    localparam H_BLANK_START = 800;
    localparam H_SYNC_START = 840;
    localparam H_SYNC_TIME = 128;

    localparam V_TOTAL_TIME = 628;
    localparam V_BLANK_START = 600;
    localparam V_SYNC_START = 601;
    localparam V_SYNC_TIME = 4;

  // Describe the actual circuit for the assignment.
  // Video timing controller set for 800x600@60fps
  // using a 40 MHz pixel clock per VESA spec.
  
    reg [11:0] vcount_nxt;
    reg [11:0] hcount_nxt;
  
    always @(posedge pclk)
        if (rst) begin
            vcount <= 0;
            hcount <= 0;
        end
        else begin
            vcount <= vcount_nxt;
            hcount <= hcount_nxt;
        end
  
    always @*
        if(hcount < H_TOTAL_TIME - 1)
            hcount_nxt = hcount + 1;
        else
            hcount_nxt = 0;
            
    always @*
        if(hcount == H_TOTAL_TIME - 1)
            if(vcount < V_TOTAL_TIME - 1)
                vcount_nxt = vcount + 1;
            else
                vcount_nxt = 0;
        else
            vcount_nxt = vcount;
        
    assign hblnk = (hcount > H_BLANK_START - 1) ? 1 : 0;
    assign vblnk = (vcount > V_BLANK_START - 1) ? 1 : 0;
    
    assign hsync = (hcount > H_SYNC_START - 1 && hcount < H_SYNC_START + H_SYNC_TIME - 1) ? 1 : 0;
    assign vsync = (vcount > V_SYNC_START - 1 && vcount < V_SYNC_START + V_SYNC_TIME - 1) ? 1 : 0;
  
endmodule
