`timescale 1ns / 1ps
//mux for execution
//////////////////////////////////////////////////////////////////////////////////
module sign_ext_mux(
	input wire [31:0] sign_imm, sign_ext,
	input wire sel, clk,
	output reg [31:0] sign_out
    );
	 
	always @ (posedge clk)
		sign_out = sel ? sign_imm : sign_ext;

endmodule
