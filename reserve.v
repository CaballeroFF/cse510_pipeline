`timescale 1ns / 1ps

// This takes the output of alu as the cond if set_cond signal is true. 
//////////////////////////////////////////////////////////////////////////////////
module reserve(
	input wire [3:0] alu_out,
	input wire set_cond, clk,
	output reg [3:0] cond
    );
	always @ (posedge clk, posedge set_cond) 
		if(set_cond)
			cond <= alu_out;
endmodule
