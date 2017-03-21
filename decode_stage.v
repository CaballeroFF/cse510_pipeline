`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    20:10:45 02/27/2017 
// Design Name: 
// Module Name:    decode_stage 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module decode_stage(
		input clk, r_write,
		input [3:0] rd_write,          //changed to 4bits
		input [31:0] instruction, PC, data_in,
		output [31:0] pc_out,
		output [31:0] dataA_out, dataB_out,
		output [31:0] br_se_out,
		output [31:0] ls_se_out,
		output [31:0] alu_se_out,
		output [3:0] rd_out,
		output [10:0] signals,
		output [3:0] br_cond,
		output [3:0] dataA_forward_out, dataB_forward_out
				);
	
	wire [1:0] W_wb;
	wire [2:0] W_m;
	wire [3:0] W_ex;
	wire [31:0] WA, WB, Wbr_se, Wls_se, Walu_se;
	wire [10:0] Wsign;
	
	
	control_unit d0(.condition(instruction[31:28]), .set_condition(instruction[20]), 
						 .controls(instruction[25:21]), .format(instruction[27:26]), .signals(Wsign));
	
	decode_register d1 (.clk(clk), .r_write(r_write), .rs(instruction[19:16]),    //changed to 4 bits
						.rt(instruction[3:0]), .rd(rd_write), .w_data(data_in), 
						.dataA(WA), .dataB(WB));
	
	sign_extend d2 (.in(instruction[23:0]), .branch_se(Wbr_se), .store_se(Wls_se),
					.alu_se(Walu_se));		
	
	//missing control signals
	decode_latch d3 (.clk(clk), .next_pc(PC), .dataA(WA),.dataB(WB), .signals(Wsign), 
					 .br_se(Wbr_se), .ls_se(Wls_se), .alu_se(Walu_se), .rd(instruction[15:12]), //changed to 4 bits      
					 .dataA_forward_in(instruction[19:16]), .dataB_forward_in(instruction[3:0]),
					 .pc_out(pc_out), .dataA_out(dataA_out),.dataB_out(dataB_out), 
					 .br_se_out(br_se_out), .ls_se_out(ls_se_out), .alu_se_out(alu_se_out), 
					 .rd_out(rd_out), .sign_out(signals), .instr_cond(instruction[31:28]), .br_cond(br_cond),
					 .dataA_forward_out(dataA_forward_out), .dataB_forward_out(dataB_forward_out)
					 );

endmodule 
