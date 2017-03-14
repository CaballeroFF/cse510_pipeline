`timescale 1ns / 1ps

//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module control_unit (
			input [3:0] condition, //[31:28]
			input set_condition,  //[20]
			input [4:0] controls, //[25:21], (I P U B W) or (I OpCode)
			input [1:0] format,   //[27:26], 01 = L/S, 00 = ALU, and 10 = branch
			output [7:0] signals //not actual length
					);
	localparam [1:0]  alu = 2'b00,
					  ls = 2'b01,
					  br = 2'b10;
					  
	localparam [4:0]  add = 5'b00100, //alu
					  addi = 5'b10100,
					  sub = 5'b00010,
					  subi = 5'b10010,
					  _and = 5'b00000,
					  andi = 5'b10000,
					  _or = 5'b01100,
					  ori = 5'b11100,
	//not using P U B W bits
					  load_reg = 5'b1xxx1, //load/store
					  load_imm = 5'b0xxx1,
					  store_reg = 5'b1xxx0,
					  store_imm = 5'b0xxx0;
	localparam [3:0]
					br = 4'b1010,
					br_link = 4'b1011;
always @ *
 case(format)
	alu: begin
	  case(controls)
		add: signals = set_condition ? 1 : 0; //add, not actually 1 or 0
		addi: signals = set_condition ? 1 : 0;
		sub: signals = set_condition ? 1 : 0; //subtract
		subi: signals = set_condition ? 1 : 0;
		_and: signals = set_condition ? 1 : 0; //and
		andi: signals = set_condition ? 1 : 0;
		_or: signals = set_condition ? 1 : 0; //or
		ori: signals = set_condition ? 1 : 0;
		default: signals = 0;
	  endcase
	end
	
	ls: begin
	  case(controls)
		load_reg: signals = set_condition ? 1 : 0; //load/store
		load_imm: signals = set_condition ? 1 : 0; //immediate load/store
		store_reg: signals = set_condition ? 1 : 0;
		store_imm: signals = set_condition ? 1 : 0;
		default: signals = 0;
	  endcase
	end
	
	br: begin
	  case(condition)
		br: signals = set_condition ? 1 : 0;
		br_link: signals = set_condition ? 1 : 0;
		default: signals = 0;
	  endcase
	end
	
	default: signals = 0;
 endcase
endmodule
