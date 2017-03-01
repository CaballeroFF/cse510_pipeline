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
		input [4:0] rd_write,
		input [31:0] instruction, PC, data_in,
		output [31:0] pc_out,
		output [31:0] dataA_out, dataB_out,
		output [31:0] sign_extend_out,
		output [4:0] rd_out
				);
	
	wire [1:0] W_wb;
	wire [2:0] W_m;
	wire [3:0] W_ex;
	wire [31:0] WA, WB, Wextend;
	
	
	
	//CONTROL d0 (.opcode(instruction[31:26]), .wb(W_wb), .m(W_m), .ex(W_ex));
	
	decode_register d1 (.clk(clk), .r_write(r_write), .rs(instruction[25:21]),    //not actual instruction bits
						.rt(instruction[20:16]), .rd(rd_write), .w_data(data_in), 
						.dataA(WA), .dataB(WB));
	
	sign_extend d2 (.in(instruction[15:0]), .out(Wextend));						//not actual instruction bits
	
	decode_latch d3 (.clk(clk), .next_pc(PC), .dataA(WA),.dataB(WB), 
					 .sign_extend(Wextend), .rd(instruction[20:16]), .pc_out(pc_out), 				//missing control signals
					 .dataA_out(dataA_out),.dataB_out(dataB_out), .sign_extend_out(sign_extend_out), 
					 .rd_out(rd_out));

endmodule 