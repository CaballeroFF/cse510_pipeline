`timescale 1ns / 1ps

module ex_stage (
		input clk,
		//input set_cond,
		input [3:0] br_cond,
		input [3:0] alu_cond,  //comes from mem stage
		input [31:0] alu_imm,  //comes from decode
		input [31:0] ls_imm,
		input [31:0] br_imm,
		input [31:0] dataA, dataB,
		input [31:0] PC,
		input [3:0] rd,
		input [10:0] signals,
		input [3:0]  mem_rd, //rd from Memory Latch
		input [3:0] dataA_forward, dataB_forward, // comes decode latch
		input [31:0] data_out, // comes from Memory
		input mem_signal, // control unit bit from Memory
		output [31:0] newPC,
		output [31:0] alu_result,
		output [31:0] write_out,
		output [3:0] rd_out,
		output [3:0] branch,
		output [3:0] alu_cond_out,
		output [3:0] br_cond_out,
		output [10:0] sign_out
				);
	wire [31:0] WPC, Walu, Wres, Wimm;
	wire [3:0] Wcond;	           //from reserve to latch
	wire [3:0] Wbr;
	wire [1:0] A_sel, B_sel;
	wire [31:0] alu_A, alu_B;
	
	branch_adder e0(.PC(PC), .offset(br_imm), .newPC(WPC));

	sign_ext_mux e1 (.alu_se(alu_imm), .ls_se(ls_imm), .sel(signals[3]), .sign_out(Wimm));
	
	im_mux e2 (.mem_reg(dataB), .immediate(Wimm), .select(signals[4]), .out(Walu));
		//select comes from decode stage control unit
		
	FourToOne_Mux e6_B (.data(Walu), .ex(alu_result), .mem(data_out), .sel(B_sel), .out(alu_B));
	
	FourToOne_Mux e7_A (.data(dataA), .ex(alu_result), .mem(data_out), .sel(A_sel), .out(alu_A));
	
	forwarding e8 (.A(dataA_forward), .B(dataB_forward), .ex_rd(rd_out), .mem_rd(mem_rd), .ctrl_ex(sign_out[9]), .ctrl_mem(mem_signal), 
				.A_sel(A_sel), .B_sel(B_sel));
	
	alu e3 (.A(alu_A), .B(alu_B), .control(signals[2:0]), .branch(Wbr), .result(Wres));
	//control comes from decode stage control unit

	reserve e4 (.alu_out(branch), /*.set_cond(set_cond),*/ .cond(Wcond));
	
	ex_latch e5 (.clk(clk), .br_cond(br_cond), .br(Wbr), .alu_cond(Wcond), .alu(Wres), .adder(WPC), .writedata(dataA), 
		     .rd(rd),.br_out(branch), .alu_out(alu_result), .adder_out(newPC), .write_out(write_out),
		     .rd_out(rd_out), .alu_cond_out(alu_cond_out), .br_cond_out(br_cond_out), .signals(signals), .sign_out(sign_out));
endmodule
