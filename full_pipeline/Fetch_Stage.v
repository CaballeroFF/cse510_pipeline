`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:27 02/21/2017 
// Design Name: 
// Module Name:    Fetch_Stage 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Fetch_Stage(
	input clk,
	input [31:0]  brPC,
	input sel_mux,
	output [31:0] instruction,
	output [31:0] Next_PC
    );
	 
	wire [31:0] w0,w1, w2, w3, w4;

	PC c0 (.clk(clk), .NewPC(w0), .PC(w2));
	pc_mux c1 (.sel(sel_mux), .br(brPC), .incr(w1), .newPC(w0));
	PC_Incrementor c2 (.PC(w2), .Next_PC(w1));
	Instruction_Memory c3 (.clk(clk), .instruction(w2), .Data(w3));
	Fetch_Latch c4 (.clk(clk), .instruction(w3), .PC(w1), .instr_out(instruction), .PC_out(Next_PC));

endmodule
