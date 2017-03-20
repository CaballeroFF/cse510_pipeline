`timescale 1ns / 1ps

module memory_stage ( //may be missing control signals
		input clk,
		input [3:0] rd,
		input [10:0] signals,
		input [3:0] alu_branch,
		input [3:0] control_branch,
		input [31:0] alu,
		input [31:0] dataA,
		output [3:0] rd_out,
		output PC_mux_control,
		output [31:0] alu_out,
		output [31:0] data_out,
		output [10:0] sign_out
			);
	wire [31:0] Wdata;
	
	br_comp m0 (.enable(signals[5]), .alu(alu_branch), .cond(control_branch), .br_sel(PC_mux_control));
	
	
	memory_register m1 (.clk(clk), .write(signals[6]), .read(signals[7]), .address(alu), .data(dataA), .read_data(Wdata));
	
	memory_latch m2 (.clk(clk), .rd(rd), .signals(signals), .read_data(Wdata), .alu_result(alu),
						  .rd_out(rd_out), .read_out(data_out), .alu_out(alu_out), .sign_out(sign_out));

endmodule
