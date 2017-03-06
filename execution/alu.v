`timescale 1ns / 1ps

module alu (
		input [31:0] A, B,
		input [2:0] control,     //how many bits?, comes from decode stage control unit
		output reg branch,
		output reg [31:0] result
			);
	localparam [2:0]  add = 3'b000,  //not actual opcode
					  sub = 3'b001,
					  br = 3'b010,
					  l_and = 3'b011,
					  l_or = 3'b100;
	
	always @ *
		case (control)
			add: begin result = A + B;
					   branch = 0;
				 end
			sub: begin result = A - B;
                       branch = 0;
				 end
			br: begin branch = (A < B) ? 1:0;
				      result = 32'hxxxxxxxx;
				end
			l_and: begin result = A & B; 
						 branch = 0;
				   end
			l_or: begin result = A | B;
						branch = 0;
				  end
			default: begin result = 32'h00000000;
						   branch = 0;
				    end
		endcase
endmodule