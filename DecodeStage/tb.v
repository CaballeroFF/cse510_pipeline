`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:48:59 02/28/2017
// Design Name:   decode_stage
// Module Name:   C:/Users/Caballero/Documents/Verilog Projects/ARM pipeline/decode/tb.v
// Project Name:  decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode_stage
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
	reg r_write;
	reg [4:0] rd_write;
	reg [31:0] instruction;
	reg [31:0] PC;
	reg [31:0] data_in;

	// Outputs
	wire [31:0] pc_out;
	wire [31:0] dataA_out;
	wire [31:0] dataB_out;
	wire [31:0] sign_extend_out;
	wire [4:0] rd_out;

	// Instantiate the Unit Under Test (UUT)
	decode_stage uut (
		.clk(clk), 
		.r_write(r_write), 
		.rd_write(rd_write), 
		.instruction(instruction), 
		.PC(PC), 
		.data_in(data_in), 
		.pc_out(pc_out), 
		.dataA_out(dataA_out), 
		.dataB_out(dataB_out), 
		.sign_extend_out(sign_extend_out), 
		.rd_out(rd_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		r_write = 0;
		rd_write = 0;
		instruction = 32'h10005678;
		PC = 8;
		data_in = 32'h01234567;

		#30 r_write = 1;
		#10 r_write = 0;
		#30 instruction = 32'h10215678;
		#20 instruction = 32'h10005678;

	end
	always #10 clk = ~clk;
      
endmodule

