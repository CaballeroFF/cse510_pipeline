`timescale 1ns / 1ps

module ex_latch ( //may be missing some inputs
		input clk, 
		input reset,
		input[3:0] br,
		input [3:0] br_cond,
		input [3:0] alu_cond, //comes from mem stage
		input [31:0] alu,
		input [31:0] adder,
		input [31:0] writedata,
		input [3:0] rd,
		input [10:0] signals,
		output reg [3:0] br_out,
		output reg [3:0] alu_cond_out,
		output reg [3:0] br_cond_out,
		output reg [31:0] alu_out,
		output reg [31:0] adder_out,
		output reg [31:0] write_out,
		output reg [3:0] rd_out,
		output reg [10:0] sign_out
		); 
	always @ (posedge clk)
	if (reset)
	begin
		br_out <= 0;
		alu_out <= 0;
		adder_out <= adder;
		write_out <= 0;
		rd_out <= 0;
		alu_cond_out <= 0;
		sign_out <= 0;
		br_cond_out <= 0;
	end
	else
	begin
		br_out <= br;
		alu_out <= alu;
		adder_out <= adder;
		write_out <= writedata;
		rd_out <= rd;
		alu_cond_out <= alu_cond;
		sign_out <= signals;
		br_cond_out <= br_cond;
	end
endmodule 
