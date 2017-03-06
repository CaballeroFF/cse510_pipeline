`timescale 1ns / 1ps

module memory_stage ( //may be missing control signals
		input clk,
		input rd,
		input alu_branch,
		input control_branch,
		input [31:0] alu,
		input [31:0] PC, 
		input [31:0] dataB,
		output [31:0] rd_out,
		output [31:0] newPC,
		output PC_mux_control,
		output [31:0] alu_out,
		output [31:0] data_out
					);
	wire [31:0] Wdata;
					
	branch_func m0 (.branch(alu_branch), .br_control(control_branch), .PC_mux_control(PC_mux_control));
	
	memory_register m1 (.clk(clk), .write(0), .read(1), .address(alu), .data(dataB), .read_data(Wdata));
	//control signals set to constants at this point
	
	memory_latch m2 (.clk(clk), .rd(rd), .read_data(Wdata), .alu_result(alu), .PC(PC) .rd_out(rd_out), 
					 .read_out(data_out), .alu_out(alu_out), .newPC(newPC));

endmodule