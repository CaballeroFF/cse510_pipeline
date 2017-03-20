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
	 
	 //reg [7:0] memory [255:0]; //for byte addressable
	 reg [31:0] memory [255:0]; //for word addressable
	 //and we would need to initialize each memory index as one 16'b word
	 initial begin
		memory[0] = 32'h00801002; //r1 = r0+r2
		memory[1] = 32'h00801003; //r1 = r0+r3
		memory[2] = 32'hEAFFFFFD;
		memory[3] = 32'h00401003; //r1 = r0-r3
		memory[4] = 32'h51A6003;
		memory[5] = 32'h50A6003;
		/*memory[5] = 32'hEAFFFFFE;
		memory[6] = 8'h18;
		memory[7] = 8'h18;
		memory[8] = 8'hD1;
		memory[9] = 8'h18;*/
	 end
	 
	 always @ (posedge clk)
		Data <= memory[instruction];
		//Data <= {memory[instruction], memory[instruction + 1], memory[instruction + 2], memory[instruction + 3]};


endmodule
