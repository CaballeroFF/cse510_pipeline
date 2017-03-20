`timescale 1ns /1ps

module memory_register (
		input clk,
		input write,       //control signals come from decode stage cotrol unit
		input read,
		input [31:0] address,
		input [31:0] data,
		output reg [31:0] read_data
				);

		reg [31:0] mem [9:0];
		initial begin
		mem[0] = 11;
		mem[1] = 12;
		mem[2] = 31;
		mem[3] = 14;
		mem[4] = 52;
		mem[5] = 61;
		mem[6] = 17;
		mem[7] = 18;
		mem[8] = 19;
		mem[9] = 120;
	 end
	 
	   always @ (posedge read)
			//if (read)
				read_data = mem[address];
		always @ (posedge clk)
			if(write)
				mem[address] <= data;
				
endmodule
//may be an error in the conditional statements