`timescale 1ns / 1ps

// 
////////////////////////////////////////////////////////////////////////////////

module forwarding_test;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] ex_rd;
	reg [3:0] mem_rd;
	reg ctrl_ex;
	reg ctrl_mem;

	// Outputs
	wire [1:0] A_sel;
	wire [1:0] B_sel;

	// Instantiate the Unit Under Test (UUT)
	forwarding uut (
		.A(A), 
		.B(B), 
		.ex_rd(ex_rd), 
		.mem_rd(mem_rd), 
		.ctrl_ex(ctrl_ex), 
		.ctrl_mem(ctrl_mem), 
		.A_sel(A_sel), 
		.B_sel(B_sel)
	);

	initial begin
		// Initialize Inputs
		A = 32'd10;
		B = 32'd5;
		ex_rd = 0;
		mem_rd = 0;
		
		ctrl_ex = 0;
		ctrl_mem = 0;
		// output DATA 
		
		# 1
		ctrl_ex = 1;
		//output DATA
		
		#1
		ctrl_ex = 0;
		ctrl_mem = 1;
		//output DATA
		
		#1
		mem_rd = 32'd6;
		ex_rd = 32'd6;
		//output DATA
		
		#1 
		mem_rd = 32'd10;
		//output A_sel == MEM
		
		#1
		mem_rd = 32'd6;
		ex_rd = 32'd10;
		//output DATA
		
		#1 
		ctrl_ex = 1;
		// ctrl_mem still has priority
		mem_rd = 32'd5;
		ex_rd = 32'd10;
		//output B_sel == MEM
		
		#1 ctrl_mem = 0;
		//output A_sel == EX
		#1 $stop;
		
		
	

	end
      
endmodule

