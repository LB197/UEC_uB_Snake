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
    input wire [11:0] rgb_bg,
    input wire [11:0] rgb_pixel,
    input wire rgb_ctrl,
    
    output reg [11:0] vcount_out,
    output reg vsync_out,
    output reg vblnk_out,
    output reg [11:0] hcount_out,
    output reg hsync_out,
    output reg hblnk_out,
    output reg [11:0] rgb_out,
    output wire [9:0] pixel_addr
    );
    
    reg [11:0] hcount_temp, vcount_temp;
    reg hsync_temp, vsync_temp, hblnk_temp, vblnk_temp;
    
    
    always @(posedge pclk)
        if(rst) begin
            hsync_out <= 0;
            vsync_out <= 0;
            hblnk_out <= 0;
            vblnk_out <= 0;
            hcount_out <= 0;
            vcount_out <= 0;
            
            hsync_temp <= 0;
            vsync_temp <= 0;
            hblnk_temp <= 0;
            vblnk_temp <= 0;
            hcount_temp <= 0;
            vcount_temp <= 0;
            end
        else begin
            hcount_out <= hcount_temp;
            vcount_out <= vcount_temp;
            hsync_out <= hsync_temp;
            vsync_out <= vsync_temp;
            hblnk_out <= hblnk_temp;
            vblnk_out <= vblnk_temp;
            hcount_temp <= hcount_in;
            vcount_temp <= vcount_in;
            hsync_temp <= hsync_in;
            vsync_temp <= vsync_in;
            hblnk_temp <= hblnk_in;
            vblnk_temp <= vblnk_in;
            if (vblnk_temp || hblnk_temp) 
                rgb_out <= 12'h0_0_0;
            else
                if(rgb_ctrl)
                    rgb_out <= rgb_pixel;
                else
                    rgb_out <= rgb_bg;
            
          end
          
      assign pixel_addr = {vcount_in[4:0], hcount_in[4:0]};
          
endmodule
