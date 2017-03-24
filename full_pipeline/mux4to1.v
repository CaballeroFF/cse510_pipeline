`timescale 1ns / 1ps

//
//////////////////////////////////////////////////////////////////////////////////
module FourToOne_Mux(
	input wire [31:0] data,
	input wire [31:0] ex,
	input wire [31:0] mem,
	input wire [1:0] sel,
	output reg [31:0] out
    );
	 
	localparam [1:0]	DATA = 2'b00,
							EX = 2'b01,
							MEM = 2'b10;
	 
	always @ *  begin
		case (sel) 
			DATA: out = data;
			EX: out = ex;
			MEM: out = mem;
			default: out = mem;
		endcase
	end 
endmodule 