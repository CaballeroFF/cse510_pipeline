`timescale 1ns / 1ps


// 
////////////////////////////////////////////////////////////////////////////////

module FourToOne_Mux_test;

	// Inputs
	reg [31:0] data;
	reg [31:0] ex;
	reg [31:0] mem;
	reg [1:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	FourToOne_Mux uut (
		.data(data), 
		.ex(ex), 
		.mem(mem), 
		.sel(sel), 
		.out(out)
	);

	 
	localparam [1:0]	DATA = 2'b00,
							EX = 2'b01,
							MEM = 2'b10;
	 
	initial begin
		// Initialize Inputs
		data = 0;
		ex = 1;
		mem = 2;
	
		sel = 11; 
		// out == 0 due to default 
		
		#1
		sel = EX;
		//out == 1
		
		#1 
		sel = MEM;
		//out = 2;

		#1
		sel = DATA;
		//out == 0;
		#1
		$stop;
	end
      
endmodule

