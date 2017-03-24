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
			input reset,
			input [31:0] next_pc,
			input [31:0] dataA, dataB,
			input [31:0] br_se,             //branch sign extended   
			input [31:0] ls_se,             //load / store sign extended
			input [31:0] alu_se,            // alu sign extended
			input [3:0]  rd, rn, rm,
			input [10:0] signals,
			input [3:0] instr_cond,
			//input [4:0]  rd, for immediate type
			output reg [31:0] pc_out,
			output reg [31:0] dataA_out, dataB_out,
			output reg [31:0] br_se_out,
			output reg [31:0] ls_se_out,
			output reg [31:0] alu_se_out,
			output reg [3:0] rd_out, rn_out, rm_out,
			output reg [10:0] sign_out,
			output reg [3:0] br_cond
					);
					
		always @ (posedge clk)
		if (reset)
		begin
		pc_out <= 0;
		dataA_out <= 0;
		dataB_out <= 0;
		br_se_out <= 0;
		ls_se_out <= 0;
		alu_se_out <= 0;
		rd_out <= 0;
		rn_out <= 0;
		rm_out <= 0;
		sign_out <= 0;
		br_cond <= 0;
		end
		else
		begin
		pc_out <= next_pc;
		dataA_out <= dataA;
		dataB_out <= dataB;
		br_se_out <= br_se;
		ls_se_out <= ls_se;
		alu_se_out <= alu_se;
		rd_out <= rd;
		rn_out <= rn;
		rm_out <= rm;
		sign_out <= signals;
		br_cond <= instr_cond;
		end
endmodule
//still need to add control signals
