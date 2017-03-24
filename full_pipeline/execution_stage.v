`timescale 1ns / 1ps

module ex_stage (
		input clk, reset,
		input wb_ex, wb_mem,
		input [3:0] rn, rm, rd_ex, rd_mem,
		input [31:0] ex_data, mem_data,
		input [3:0] br_cond,
		input [3:0] alu_cond,  //comes from mem stage
		input [31:0] alu_imm,  //comes from decode
		input [31:0] ls_imm,
		input [31:0] br_imm,
		input [31:0] dataA, dataB,
		input [31:0] PC,
		input [3:0] rd,
		input [10:0] signals,
		output [31:0] newPC,
		output [31:0] alu_result,
		output [31:0] write_out,
		output [3:0] rd_out,
		output [3:0] branch,
		output [3:0] alu_cond_out,
		output [3:0] br_cond_out,
		output [10:0] sign_out
				);
				
	wire [31:0] WPC, Walu, Wres, Wimm, Wm1, Wm2;
	wire [3:0] Wcond;	           //from reserve to latch
	wire [3:0] Wbr;
	wire [1:0] sel1, sel2;
	
	branch_adder e0(.PC(PC), .offset(br_imm), .newPC(WPC));

	sign_ext_mux e1 (.alu_se(alu_imm), .ls_se(ls_imm), .sel(signals[3]), .sign_out(Wimm));
	
	im_mux e2 (.mem_reg(dataB), .immediate(Wimm), .select(signals[4]), .out(Walu));
	//select comes from decode stage control unit
	
	forwarding e3(.A(rn), .B(rm), .ex_rd(rd_ex), .mem_rd(rd_mem), .ctrl_ex(wb_ex), .ctrl_mem(wb_mem), .A_sel(sel1), .B_sel(sel2));
	
	FourToOne_Mux e4(.data(dataA), .ex(ex_data), .mem(mem_data), .sel(sel1), .out(Wm1));
	
	FourToOne_Mux e5(.data(Walu), .ex(ex_data), .mem(mem_data), .sel(sel2), .out(Wm2));
	
	alu e6 (.A(Wm1), .B(Wm2), .control(signals[2:0]), .branch(Wbr), .result(Wres));
	//control comes from decode stage control unit

	reserve e7 (.alu_out(branch), .cond(Wcond));
	
	ex_latch e8 (.clk(clk), .reset(reset), .br_cond(br_cond), .br(Wbr), .alu_cond(Wcond), .alu(Wres), .adder(WPC), .writedata(Wm1/*dataA*/), 
		     .rd(rd),.br_out(branch), .alu_out(alu_result), .adder_out(newPC), .write_out(write_out),
		     .rd_out(rd_out), .alu_cond_out(alu_cond_out), .br_cond_out(br_cond_out), .signals(signals), .sign_out(sign_out));
endmodule
