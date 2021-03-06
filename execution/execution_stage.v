`timescale 1ns / 1ps

module ex_stage (
		input clk,
		input set_cond,
		input [3:0] alu_cond,  //comes from mem stage
		input [31:0] alu_imm,  //comes from decode
		input [31:0] ls_imm,
		input [31:0] br_imm,
		input [31:0] dataA, dataB,
		input [31:0] PC,
		input [5:0] rd,
		output [31:0] newPC,
		output [31:0] alu_result,
		output [31:0] imm_out,
		output [5:0] rd_out,
		output [3:0] branch,
		output [3:0] alu_cond_out
				);
	wire [31:0] WPC, Walu, Wres, Wimm;
	wire [3:0] Wcond;	           //from reserve to latch
	wire Wbr;
	branch_adder e0(.PC(PC), .offset(br_imm), .newPC(WPC));

	sign_extend_mux e1 (.alu_se(alu_imm), .ls_se(ls_imm), .sel(0), .sign_out(Wimm));
	
	im_mux e2 (.mem_reg(dataB), .immediate(Wimm), .select(0), .out(Walu));
	//select comes from decode stage control unit
	
	alu e3 (.A(dataA), .B(Walu), .control(0), .branch(Wbr), .result(Wres));
	//control comes from decode stage control unit

	reserve e4 (.alu_out(alu_cond), .set_cond(set_cond), .cond(Wcond));
	
	ex_latch e5 (.clk(clk), .br(Wbr), .alu_cond(Wcond), .alu(Wres), .adder(WPC), .immediate(br_imm), 
		     .rd(rd),.br_out(branch), .alu_out(alu_result), .adder_out(newPC), .imm_out(imm_out),
		     .rd_out(rd_out), .alu_cond_out(alu_cond_out));
endmodule
