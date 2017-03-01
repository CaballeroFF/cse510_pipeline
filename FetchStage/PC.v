`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    18:47:41 02/21/2017 
// Design Name: 
// Module Name:    PC 
// Project Name:  
// Description: 
// Revision: 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module PC(
	input clk, 
	input [31:0] NewPC,
	output reg [31:0] PC
    );

	initial PC = 0;
	
	always @ (posedge clk)
		PC <= NewPC;

endmodule
