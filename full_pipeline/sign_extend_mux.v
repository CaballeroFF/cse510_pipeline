`timescale 1ns / 1ps
//mux for execution
//////////////////////////////////////////////////////////////////////////////////
module sign_ext_mux(
	input wire [31:0] alu_se, ls_se,
	input wire sel,
	output [31:0] sign_out
    );
	 
	assign sign_out = sel ? alu_se : ls_se;

endmodule
