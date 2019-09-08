module image_rom #(
    parameter WIDTH = 32,
    parameter HEIGHT = 32,
    parameter ADDR_WIDTH = 10,
    parameter FILE = "image_rom_grass32.data" )
    (
    input wire clk,
    input wire rst,
    input wire [ADDR_WIDTH-1:0] address,  // address = {addry[4:0], addrx[4:0]}
    output reg [11:0] rgb
);

reg [11:0] rom [0:(WIDTH*HEIGHT)-1];

initial $readmemh(FILE, rom); 

always @(posedge clk)
    if(rst)
        rgb <= 0;
    else
        rgb <= rom[address];
  
endmodule
