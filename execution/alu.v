`timescale 1ns / 1ps

module alu (
		input [31:0] A, B,
		input [1:0] control,     //how many bits?, comes from decode stage control unit
		output reg [3:0] branch,
		output reg [31:0] result
			);
	
	
	localparam [1:0]  add = 2'b00,  //not actual opcode
					  sub = 2'b01,
					  //br = 3'b010,
					  l_and = 2'b11,
					  l_or = 2'b10;
	
	always @ *
		begin
			branch = (A - B) == 0 ? 4'b0000: (A - B) < 0 ? 4'b1011 : 1100;
			
		case (control)
			add: begin result = A + B;
					   
				 end
			sub: begin result = A - B;
                       
				 end
			/*br: begin branch = (A < B) ? 1:0;
				      result = 32'hxxxxxxxx;
				end*/
			l_and: begin result = A & B; 
						 
				   end
			l_or: begin result = A | B;
						
				  end
			default: begin result = 32'h00000000;
						   
				    end
		end	
		endcase
endmodule
