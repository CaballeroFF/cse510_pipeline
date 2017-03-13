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
		input [11:0] in,
		output [31:0] out
				   );
	assign out = {{20{in[11]}}, in};

endmodule
