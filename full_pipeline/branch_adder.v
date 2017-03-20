`timescale 1ns / 1ps

module branch_adder (
			input [31:0] PC,
			input [31:0] offset,
			output [31:0] newPC
					);
					
	assign newPC = PC + offset;
endmodule	