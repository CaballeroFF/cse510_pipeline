`timescale 1ns / 1ps

module control_unit (
			input [3:0] condition, //[31:28]
			input set_condition,  //[20]
			input [4:0] controls, //[25:21]
			input [1:0] format,   //[27:26]
			output [7:0] signals //not actual length
	//last 2 bits of signals will be for alu control
					);
	localparam [1:0]  alu = 2'b00,
					  ls = 2'b01,
					  br = 2'b10;
					  
	localparam [4:0]  add = 6'b00100, //alu
					  addi = 5'b10100,
					  sub = 5'b00010,
					  subi = 5'b10010,
					  _and = 5'00000,
					  andi = 5'10000,
					  _or = 5'01100,
					  ori = 5'11100,
	//not using P U B W bits
					  rm = 5'b0xxxx, //load/store
					  imm = 5'b1xxxx;
	//localparam [3:0]

always @ *
 case(format)
	alu: begin
	  case(controls)
		add: signals = set_condition ? 00 : 00; //add, not actually 1 or 0
		addi: signals = set_condition ? 00 : 00;
		sub: signals = set_condition ? 01 : 01; //subtract
		subi: signals = set_condition ? 01 : 01;
		_and: signals = set_condition ? 11 : 11; //and
		andi: signals = set_condition ? 11 : 11;
		_or: signals = set_condition ? 10 : 10; //or
		ori: signals = set_condition ? 10 : 10;
		default: signals = 00;
	  endcase
	end
	
	ls: begin
	  case(controls)
		rm: signals = set_condition ? 00 : 00; //load/store
		imm: signals = set_condition ? 00 : 00; //immediate load/store
		default: signals = 00;
	  endcase
	end
	
	br: begin
	  case(condition)
		default: signals = 00;
	  endcase
	end
	
	default: signals = 00;
 endcase
endmodule
