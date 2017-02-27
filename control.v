`timescale 1ns / 1ps
//alu_control.v of decode
//Based on Thumb ISA (5-2)
//////////////////////////////////////////////////////////////////////////////////
module control (
	input wire clk,
	input wire [4:0] opcode, //5 left-most significant bits of 15 bit instruction
	output reg [5:0] select // enough bits to correspond to 19 ISA
    );
	 
	localparam [2:0]	SHIFTorADD_SUB	= 3'b000, 
				MOVE_COMPR	= 3'b001,
				ALUorLD_SRorPC	= 3'b010,
				imm_LD_SR	= 3'b011,
				LD_SRorSP	= 3'b100,	
				LD_ADDR		= 3'b101,
				COND_BRANCH	= 3'b110,
				UNCOND_BRANCH	= 3'b111;
	
	localparam [5:0]	SHIFT 	= 5'd1,
				ADD_SUB = 5'd2,
				MOVE_C 	= 5'd3,
				ALU 	= 5'd4,
				PC 	= 5'd6,
				LD_SR 	= 5'd7,
				immLDSR = 5'd9,
				LD_SR 	= 5'd10,
				SP 	= 5'd11,
				LD_A 	= 5'd12,
				COND_B 	= 5'd16,
				UNCOND_B = 5'd18,
				INVALID = 5'd0;
	
	always @(posedge clk) begin
		case(opcode[4:2]) begin
			SHIFTorADD_SUB	: select =(opcode[1:0] == 11) ? ADD_SUB : SHIFT;
			MOVE_COMPR	: select = MOVE_C;
			ALUorLD_SRorPC	:	
			if (opcode[1:0] == 2'b00) 
				select = ALU;
			else if(opcode[1:0] == 2'b01)
				select = PC;
			else if(opcode[1])
				select = LD_SR;
			else select = INVALID;
			imm_LD_SR	: select = immLDSR;
			LD_SRorSP 	: select = select = (opcode[1]) ? LD_SR : SP;
			LD_ADDR		: select = LD_A;
			COND_BRANCH	: select = COND_B;
			UNCOND_BRANCH	: select = UNCOND_B;
			default : select = INVALID;
		endcase
	end		
endmodule 
