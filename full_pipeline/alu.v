`timescale 1ns / 1ps

module alu (
		input [31:0] A, B,
		input [2:0] control,     //how many bits?, comes from decode stage control unit
		output reg [3:0] branch,
		output reg [31:0] result
			);
	
	
	localparam [2:0]  add = 3'b000,  //not actual opcode
					  sub = 3'b010,
					  //br = 3'b010,
					  l_and = 3'b110,
					  l_or = 3'b100;
	
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
			default: begin result = B;
						   
				    end
		
		endcase
		end	
endmodule
