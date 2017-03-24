`timescale 1ns / 1ps

module control_unit (
			input [3:0] condition, //[31:28]
			input set_condition,  //[20]
			input [4:0] controls, //[25:21]
			input [1:0] format,   //[27:26]
			output reg [10:0] signals //not actual length
	//last 3 (left) bits of signals will be for alu control [2:0]
	//next bit will be for sign extend mux                  [3]
	//next bit will be for immediate mux                    [4] 
	//next bit will be for comparator                       [5]    
	//next 2 bits are for memory write or read              [7:6]
	//next bit is for wb mux                                [8]
	//next bit is for decode register                       [9] 
	//next bit is for fetch mux                             [10]
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
					  rm = 5'b01000, //load/store
					  imm = 5'b11000;
	//localparam [3:0]

always @ *
 case(format)
	alu: begin
	  case(controls)
		add: signals = set_condition ? 11'b01000101000 : 11'b01000001000; //add, not actually 1 or 0
		addi: signals = set_condition ? 11'b01000111000 : 11'b01000011000;
		sub: signals = set_condition ? 11'b01000101010 : 11'b01000001010; //subtract
		subi: signals = set_condition ? 11'b01000111010 : 11'b01000011010;
		_and: signals = set_condition ? 11'b01000101110 : 11'b01000001110; //and
		andi: signals = set_condition ? 11'b01000111110 : 11'b01000011110;
		_or: signals = set_condition ? 11'b01000101100 : 11'b01000001100; //or
		ori: signals = set_condition ? 11'b01000111100 : 11'b01000011100;
		default: signals = 11'b01000001000;
	  endcase
	end
	
	ls: begin
	  case(controls)
		rm: signals = set_condition ? 11'b01110000001 : 11'b00101000001; //load/store
		imm: signals = set_condition ? 11'b01110010001 : 11'b00101010001; //immediate load/store
		default: signals = 11'b01100000000;
	  endcase
	end
	
	br: begin
	  case(condition)
		default: signals = 11'b00000100000;
	  endcase
	end
	
	default: signals = 11'b00000000000;
 endcase
endmodule
