`timescale 1ns / 1ps

// This takes the output of alu as the cond if set_cond signal is true. 
//////////////////////////////////////////////////////////////////////////////////
module reserve(
	input wire [3:0] alu_out,
	//input wire set_cond,
	output reg [3:0] cond
    );
	//always @ (posedge set_cond) //might need clock
		//if(set_cond)
			assign cond = alu_out;
		//else
		//	cond <= 4'b1110;
endmodule
