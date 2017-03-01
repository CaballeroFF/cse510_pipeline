`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:25:27 02/21/2017 
// Design Name: 
// Module Name:    Fetch_Latch 
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
module Fetch_Latch(
	input clk,
	input [31:0] instruction,
	input [31:0] PC,
	output reg [31:0] instr_out,
	output reg [31:0] PC_out
    );
	 
	 always @ (posedge clk)
		begin
			instr_out <= instruction;
			PC_out <= PC;
		end

endmodule
