`timescale 1ns / 1ps

module wb_mux(
		input [31:0] alu,
		input [31:0] mem,
		input sel,
		output [31:0] id_reg
		);
		
	assign id_reg = sel ? mem : alu;
	
endmodule