`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    18:47:41 02/21/2017 
// Design Name: 
// Module Name:    PC_Incrementor 
// Project Name:  
// Description: 
// Revision: 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module PC_Incrementor(
	input [31:0] PC,
	output [31:0] Next_PC
    );

	//assign Next_PC = PC + 4; //for byte addressable
	assign Next_PC = PC + 1; //for word adressable

endmodule
