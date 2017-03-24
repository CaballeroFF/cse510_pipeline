`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:22 03/19/2017 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
		input clk
    );

 wire pc_sel_mux;	 
 wire [31:0] instruction, nextpc, alu_se_out, ls_se_out, br_se_out, dataA_out, dataB_out, pc_out,
				 newPC, alu_result, write_out, m_alu, m_data, result;
 wire [10:0] d_signals, ex_sign_out, m_sign_out;
 wire [3:0] d_br_cond, rd_decode, alu_cond_out, ex_br_cond, branch, ex_rd_out, m_rd_out,
				Wrn, Wrm;
 
 Fetch_Stage p0 (.clk(clk), .reset(pc_sel_mux), .brPC(newPC),.sel_mux(pc_sel_mux), .instruction(instruction), .Next_PC(nextpc));
 
 decode_stage p1 (.clk(clk), .reset(pc_sel_mux), .r_write(m_sign_out[9]), .rd_write(m_rd_out), .instruction(instruction), .PC(nextpc), .data_in(result),
						.pc_out(pc_out), .dataA_out(dataA_out), .dataB_out(dataB_out), .br_se_out(br_se_out), .rn(Wrn), .rm(Wrm),
						.ls_se_out(ls_se_out), .alu_se_out(alu_se_out), .rd_out(rd_decode), .signals(d_signals), .br_cond(d_br_cond));
						
 ex_stage p2 (.clk(clk), .reset(pc_sel_mux), .wb_ex(ex_sign_out[9]), .wb_mem(m_sign_out[9]), .rn(Wrn), .rm(Wrm), .rd_ex(ex_rd_out), .rd_mem(m_rd_out), 
				  .ex_data(alu_result), .mem_data(m_alu), .br_cond(d_br_cond), .alu_cond(4'b0000), .alu_imm(alu_se_out),  .ls_imm(ls_se_out),
		        .br_imm(br_se_out), .dataA(dataA_out), .dataB(dataB_out), .PC(pc_out), .rd(rd_decode), .signals(d_signals),
		        .newPC(newPC), .alu_result(alu_result), .write_out(write_out), .rd_out(ex_rd_out), .branch(branch),
		        .alu_cond_out(alu_cond_out), .sign_out(ex_sign_out), .br_cond_out(ex_br_cond));
				  
 
 memory_stage p3 (.clk(clk), .rd(ex_rd_out), .signals(ex_sign_out), .alu_branch(alu_cond_out),
		        .control_branch(ex_br_cond), .alu(alu_result), .dataA(write_out), .rd_out(m_rd_out),
		        .PC_mux_control(pc_sel_mux), .alu_out(m_alu), .data_out(m_data), .sign_out(m_sign_out));
				  
 wb_mux p4 (.alu(m_alu),
		.mem(m_data),
		.sel(m_sign_out[8]),
		.id_reg(result)
		);

endmodule
