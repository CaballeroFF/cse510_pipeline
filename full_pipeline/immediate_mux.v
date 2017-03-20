`timescale 1ns / 1ps

module im_mux (
		input [31:0] mem_reg,
		input [31:0] immediate,
		input select,
		output [31:0] out
			   );
	assign out = select ? immediate : mem_reg;
endmodule
