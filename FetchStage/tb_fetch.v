`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:42:22 02/21/2017
// Design Name:   Fetch_Stage
// 
// Project Name:  Fetch
//
////////////////////////////////////////////////////////////////////////////////

module tb_fetch;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] instruction;
	wire [31:0] Next_PC;

	// Instantiate the Unit Under Test (UUT)
	Fetch_Stage uut (
		.clk(clk), 
		.instruction(instruction), 
		.Next_PC(Next_PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		
		#200 $finish;

	end
	always #10 clk = ~clk;
      
endmodule

