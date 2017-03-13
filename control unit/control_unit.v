`timescale 1ns / 1ps

module control_unit (
			input [3:0] condition, //[31:28]
			input set_condition,  //[20]
			input [4:0] controls, //[25:21]
			input [1:0] format,   //[27:26]
			output [7:0] signals //not actual length
					);
	localparam [1:0]  alu = 2'b00,
					  ls = 2'b01,
					  br = 2'b10;
					  
	localparam [4:0]  add = 6'b00100, //alu
					  addi = 6'b10100,
					  sub = 6'b00010,
					  subi = 6'b10010,
					  _and = 6'00000,
					  andi = 6'10000,
					  _or = 6'01100,
					  ori = 6'11100,
	//not using P U B W bits
					  rm = 6'b0xxxx, //load/store
					  imm = 6'b1xxxx;
	//localparam [3:0]

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
		rm: signals = set_condition ? 1 : 0; //load/store
		imm: signals = set_condition ? 1 : 0; //immediate load/store
		default: signals = 0;
	  endcase
	end
	
	br: begin
	  case(condition)
		default: signals = 0;
	  endcase
	end
	
	default: signals = 0;
 endcase
endmodule