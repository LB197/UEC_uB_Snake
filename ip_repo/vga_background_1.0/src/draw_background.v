`timescale 1ns / 1ps

module draw_background(
    input wire pclk,
    input wire rst,
    input wire [11:0] vcount_in,
    input wire vsync_in,
    input wire vblnk_in,
    input wire [11:0] hcount_in,
    input wire hsync_in,
    input wire hblnk_in,
    input wire [11:0] rgb,
    
    output reg [11:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [11:0] rgb_out
    );
    
    always @(posedge pclk)
        if(rst) begin
            hsync_out <= 0;
            vsync_out <= 0;
            hblnk_out <= 0;
            vblnk_out <= 0;
            hcount_out <= 0;
            vcount_out <= 0;
            rgb_out <= 0;
        end
        else begin
            hcount_out <= hcount_in;
            vcount_out <= vcount_in;
            hsync_out <= hsync_in;
            vsync_out <= vsync_in;
            hblnk_out <= hblnk_in;
            vblnk_out <= vblnk_in;
            if (vblnk_in || hblnk_in) 
                rgb_out <= 12'h0_0_0;
            else
                rgb_out <= rgb;
            
          end
endmodule
