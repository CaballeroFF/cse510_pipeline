`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    19:10:45 02/21/2017 
// Design Name: 
// Module Name:    Instruction_Memory 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory(
	input clk,
	input [31:0] instruction,
	output reg [31:0] Data
    );
	 
	 reg [7:0] memory [255:0]; //for byte addressable
	 //reg [31:0] memory [255:0] //for word addressable
	 //and we would need to initialize each memory index as one 16'b word
	 initial begin
		memory[0] = 8'hD1;
		memory[1] = 8'h18;
		memory[2] = 8'hD1;
		memory[3] = 8'h18;
		memory[4] = 8'h18;
		memory[5] = 8'hD1;
		memory[6] = 8'h18;
		memory[7] = 8'h18;
		memory[8] = 8'hD1;
		memory[9] = 8'h18;
	 end
	 
	 always @ (posedge clk)
		Data <= {memory[instruction], memory[instruction + 1], memory[instruction + 2], memory[instruction + 3]};


endmodule
