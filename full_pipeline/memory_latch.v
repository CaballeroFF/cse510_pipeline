`timescale 1ns / 1ps

module memory_latch ( //may be missing some important control signals
		input clk,
		input [3:0] rd,
		input [10:0] signals,
		input [31:0] read_data,
		input [31:0] alu_result,
		//input [31:0] PC,
		output reg [3:0] rd_out,
		output reg [31:0] read_out,
		output reg [31:0] alu_out,
		//output reg [31:0] newPC,
		output reg [10:0] sign_out
					);

	always @ (posedge clk)
	begin
		rd_out <= rd;
		read_out <= read_data;
		alu_out <= alu_result;
		sign_out <= signals;
	end
endmodule