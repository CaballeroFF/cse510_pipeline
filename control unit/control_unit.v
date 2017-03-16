`timescale 1ns / 1ps

module control_unit (
			input [3:0] condition, //[31:28]
			input set_condition,  //[20]
			input [4:0] controls, //[25:21]
			input [1:0] format,   //[27:26]
			output [9:0] signals //not actual length
	//last 2 (left) bits of signals will be for alu control
	//next bit will be for sign extend mux
	//next bit will be for immediate mux
	//next bit will be for comparator
	//next 2 bits are for memory write or read
	//next bit is for wb mux
	//next bit is for decode register
	//next bit is for fetch mux
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
		add: signals = set_condition ? 0100010100 : 0100000100; //add, not actually 1 or 0
		addi: signals = set_condition ? 0100011100 : 0100001100;
		sub: signals = set_condition ? 0100010101 : 0100000101; //subtract
		subi: signals = set_condition ? 0100011101 : 0100001101;
		_and: signals = set_condition ? 0100010111 : 0100000111; //and
		andi: signals = set_condition ? 0100011111 : 0100001111;
		_or: signals = set_condition ? 0100010110 : 0100000110; //or
		ori: signals = set_condition ? 0100011110 : 0100001110;
		default: signals = 010000100;
	  endcase
	end
	
	ls: begin
	  case(controls)
		rm: signals = set_condition ? 0111010000 : 0010100000; //load/store
		imm: signals = set_condition ? 0111011000 : 0010101000; //immediate load/store
		default: signals = 0110000000;
	  endcase
	end
	
	br: begin
	  case(condition)
		default: signals = 1000001100;
	  endcase
	end
	
	default: signals = 0100001100;
 endcase
endmodule
