`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    19:30:45 02/27/2017 
// Design Name: 
// Module Name:    sign_extend 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module sign_extend(
		input [15:0] in,
		output [31:0] out
				   );
  
  assign out = {4'h0000,in};

endmodule
