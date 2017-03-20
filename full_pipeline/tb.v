`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:03:48 03/19/2017
// Design Name:   top
// Module Name:   C:/Users/Caballero/Documents/Verilog Projects/ARM pipeline/pipeline/fullpipeline/tb.v
// Project Name:  fullpipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always #10 clk = ~clk;   
endmodule

