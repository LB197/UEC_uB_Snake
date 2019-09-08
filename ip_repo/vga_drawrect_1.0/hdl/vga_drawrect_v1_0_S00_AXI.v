
`timescale 1 ns / 1 ps

	module vga_drawrect_v1_0_S00_AXI #
	(
		// Users to add parameters here
        parameter integer NUMBER_OF_RECTANGLES  = 32,
		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 64,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 8
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
        output reg [11:0] hcount_out,
        output reg [11:0] vcount_out,
        output reg hblnk_out,
        output reg vblnk_out,
        output reg vsync_out,
        output reg hsync_out,
        output reg [3:0] r_out,
        output reg [3:0] g_out,
        output reg [3:0] b_out,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = C_S_AXI_ADDR_WIDTH - ADDR_LSB - 1;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	localparam SLV_REG_NUMBER = NUMBER_OF_RECTANGLES;
	//-- Number of Slave Registers s
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg [0:SLV_REG_NUMBER-1];
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	integer i;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      for(i = 0; i < SLV_REG_NUMBER; i = i + 1) begin
	           slv_reg[i] <= 0;
	      end
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        for(i = 0; i < SLV_REG_NUMBER; i = i + 1) begin
	          if(i == axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg[i][(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end
              end
	          
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
        reg_data_out <= slv_reg[axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]];
	        
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

    // Add user logic here
    localparam NumberOfObjects = SLV_REG_NUMBER;
    reg [52:0]	w_slv_reg [0:NumberOfObjects-1];
    wire [11:0] rgb_pixel [0:8];
    wire [9:0] pixel_addr;
    reg [3:0] select;
    wire result [0:NumberOfObjects-1];
    reg [11:0] rgb;
    
    reg [11:0] hcount_temp, vcount_temp;
    reg hsync_temp, vsync_temp, hblnk_temp, vblnk_temp;
    reg [11:0] rgb_temp;
	
	always @(posedge clk_40M)
        for(i = 0; i < SLV_REG_NUMBER; i = i + 1)  begin
            w_slv_reg[i] <= slv_reg[i];
        end
	
    always @(posedge clk_40M)
        if(rst_40M) begin
            hsync_out <= 0;
            vsync_out <= 0;
            hblnk_out <= 0;
            vblnk_out <= 0;
            hcount_out <= 0;
            vcount_out <= 0;
            r_out <= 0;
            g_out <= 0;
            b_out <= 0;
            
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
            r_out <= rgb[11:8];
            g_out <= rgb[7:4];
            b_out <= rgb[3:0];
            
            hcount_temp <= hcount_in;
            vcount_temp <= vcount_in;
            hsync_temp <= hsync_in;
            vsync_temp <= vsync_in;
            hblnk_temp <= hblnk_in;
            vblnk_temp <= vblnk_in;
            rgb_temp <= {r_in, g_in, b_in};
            end

    always @*
        case(select)
            4'b0000: rgb = rgb_pixel[0];
            4'b0001: rgb = rgb_pixel[1];
            4'b0010: rgb = rgb_pixel[2];
            4'b0011: rgb = rgb_pixel[3];
            4'b0100: rgb = rgb_pixel[4];
            4'b0101: rgb = rgb_pixel[5];
            4'b0110: rgb = rgb_pixel[6];
            4'b0111: rgb = rgb_pixel[7];
            4'b1000: rgb = rgb_pixel[8];
            default: rgb = rgb_temp;
        endcase

    always @* begin
        select = 4'b1111;
        for(i = 0; i < SLV_REG_NUMBER; i = i + 1) begin
            if(result[SLV_REG_NUMBER - 1 - i]) select = w_slv_reg[SLV_REG_NUMBER - 1 - i][52:49];
            end
        end
        
    genvar r;
    generate
        for(r = 0; r < NumberOfObjects; r = r + 1) begin
	       assign result[r] = (w_slv_reg[r][48] && hcount_temp >= w_slv_reg[r][11:0] && hcount_temp < w_slv_reg[r][11:0] + w_slv_reg[r][47:36] && vcount_temp >= w_slv_reg[r][23:12] && vcount_temp < w_slv_reg[r][23:12] + w_slv_reg[r][35:24]) ? 1 : 0;
	       end
	endgenerate
	
    assign pixel_addr = {vcount_in[4:0], hcount_in[4:0]};
    
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_apple32.data")) apple (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[0])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_grass32.data")) grass (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[1])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_snakebody32.data")) body (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[2])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_snakehdown32.data")) hdown (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[3])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_snakehleft32.data")) hleft (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[4])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_snakehright32.data")) hright (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[5])
    );
        image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_snakehup32.data")) hup (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[6])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_apple32dark.data")) apple_dark (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[7])
    );
    image_rom #(.WIDTH(32), .HEIGHT(32), .ADDR_WIDTH(10), .FILE("image_rom_dirt32.data")) dirt (
        .clk(clk_40M),
        .rst(rst_40M),
        .address(pixel_addr),
        .rgb(rgb_pixel[8])
    );
    
	            
	// User logic ends

	endmodule
