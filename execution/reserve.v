`timescale 1ns / 1ps

// This takes the output of alu as the cond if set_cond signal is true. 
//////////////////////////////////////////////////////////////////////////////////
module reserve(
	input wire [3:0] alu_out,
	input wire set_cond,
	output reg [3:0] cond
    );
	always @ (posedge set_cond) //no clock needed
		//if(set_cond) dont need this
			cond <= alu_out;
endmodule
