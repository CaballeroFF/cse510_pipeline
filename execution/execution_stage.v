`timescale 1ns / 1ps

module ex_stage (
		input clk,
		input [31:0] immediate,
		input [31:0] dataA, dataB,
		input [31:0] PC,
		input [5:0] rd,
		output [31:0] newPC,
		output [31:0] alu_result,
		output [31:0] imm_out,
		output [5:0] rd_out,
		output branch
				);
	wire [31:0] WPC, Walu, Wres;	
	wire Wbr;
	branch_adder e0(.PC(PC), .offset(immediate), .newPC(WPC));
	
	im_mux e1 (.mem_reg(dataB), .immediate(immediate), .select(0), .out(Walu));
	//select comes from decode stage control unit
	
	alu e2 (.A(dataA), .B(Walu), .control(0), .branch(Wbr), .result(Wres));
	//control comes from decode stage control unit
	
	ex_latch e3 (.clk(clk), .br(Wbr), .alu(Wres), .adder(WPC), .immediate(immediate), .rd(rd),
				 .br_out(branch), .alu_out(alu_result), .adder_out(newPC), .imm_out(imm_out),
				 .rd_out(rd_out));
endmodule