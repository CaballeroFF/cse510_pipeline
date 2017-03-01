`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    19:20:45 02/27/2017 
// Design Name: 
// Module Name:    decode_register 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module decode_register(
	input clk, r_write,
	input [4:0] rs, rt, rd, 
	input[31:0] w_data,
    output reg [31:0] dataA, dataB
    );
	 
	 reg [31:0] regs, regt, regd;
	 
	 
	 reg [7:0] memory [255:0]; //for byte addressable
	 //reg [31:0] memory [255:0] //for word addressable
	 //and we would need to initialize each memory index as one 16'b word
	 initial begin
		memory[0] = 8'hD1;
		memory[1] = 8'h18;
		memory[2] = 8'hD1;
		memory[3] = 8'h18;
		memory[4] = 8'h18;
		memory[5] = 8'hD1;
		memory[6] = 8'h18;
		memory[7] = 8'h18;
		memory[8] = 8'hD1;
		memory[9] = 8'h18;
	 end
	 
	 always @ *
    begin
		regs = rs * 4;
		regt = rt * 4;
		regd = rd * 4;
	   dataA = {memory[regs], memory[regs + 1], memory[regs + 2], memory[regs + 3]};
		dataB = {memory[regt], memory[regt + 1], memory[regt + 2], memory[regt + 3]};
	 end
  
  always @ (posedge clk)
    begin
	   if (r_write)
		  memory[regd] <= w_data[31:24];
		  memory[regd + 1] <= w_data[23:16];
		  memory[regd + 2] <= w_data[15:8];
		  memory[regd + 3] <= w_data[7:0];
	 end



endmodule 