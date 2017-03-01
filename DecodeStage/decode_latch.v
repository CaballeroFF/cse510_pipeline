`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    20:10:45 02/27/2017 
// Design Name: 
// Module Name:    decode_latch 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module decode_latch(
//input control signals in the future
			input clk,
			input [31:0] next_pc,
			input [31:0] dataA, dataB,
			input [31:0] sign_extend,
			input [4:0]  rd,
			//input [4:0]  rd, for immediate type
			output reg [31:0] pc_out,
			output reg [31:0] dataA_out, dataB_out,
			output reg [31:0] sign_extend_out,
			output reg [4:0] rd_out
					);
					
		always @ (posedge clk)
		begin
		pc_out <= next_pc;
		dataA_out <= dataA;
		dataB_out <= dataB;
		sign_extend_out <= sign_extend;
		rd_out <= rd;
		end
endmodule
//still need to add control signals