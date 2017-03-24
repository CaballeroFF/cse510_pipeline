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
	    memory[0] = 32'h813002;    //r3 = r1+r2  testing forwarding
		memory[1] = 32'h834001;    //r4 = r3+r1
		memory[2] = 32'h834001;    //r4 = r3+r1
		memory[3] = 32'h834001;    //r4 = r3+r1
		memory[4] = 32'h834001;    //r4 = r3+r1
		memory[5] = 32'h834001;    //r4 = r3+r1

	  /* memory[0] = 32'h07000000;  //store r0 to 0x0000  testing load/store
		memory[1] = 32'h00801003;   //some add func
		memory[2] = 32'h00801003;
		memory[3] = 32'h00801003; 
		memory[4] = 32'h00801003;
		memory[5] = 32'h51F1000;    //loading previously stored reg
		memory[6] = 32'h51F0000;
		memory[7] = 32'h71F0000;
		memory[8] = 32'h7100000;
		memory[8] = 32'h7100009;*/
		/*memory[0] = 32'h00801002; //r1 = r0+r2  testing branch 
		memory[1] = 32'h00801003; //r1 = r0+r3
		memory[2] = 32'hEAFFFFFD; //unconditional branch to pc - 3
		memory[3] = 32'h00401003; //r1 = r0-r3
		memory[4] = 32'h51A6003;
		memory[5] = 32'h50A6003;*/
	 end
	 
	 always @ (posedge clk)
		Data <= memory[instruction];
		//Data <= {memory[instruction], memory[instruction + 1], memory[instruction + 2], memory[instruction + 3]};


endmodule
