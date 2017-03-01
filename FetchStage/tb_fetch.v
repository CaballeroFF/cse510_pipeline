`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:42:22 02/21/2017
// Design Name:   Fetch_Stage
// Module Name:   C:/Users/Caballero/Documents/Verilog Projects/ARM pipeline/Fetch/tb_fetch.v
// Project Name:  Fetch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch_Stage
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
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

