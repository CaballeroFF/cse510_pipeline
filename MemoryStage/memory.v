`timescale 1ns /1ps

module memory_register (
		input clk,
		input write,       //control signals come from decode stage cotrol unit
		input read,
		input [31:0] address,
		input [31:0] data,
		output reg [31:0] read_data
				);

		reg [31:0] mem [255:0];
		
		always @ (posedge clk)
			if(write)
				mem[address] <= data;
		always @ *
			if (read)
				read_data = mem[address];
				
endmodule
//may be an error in the conditional statements