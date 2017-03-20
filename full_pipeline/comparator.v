`timescale 1ns / 1ps

module br_comp(
      input enable,
      input [3:0] alu,
      input [3:0] cond,
      output reg br_sel
        );
		  
		initial br_sel = 1'b0; 
		
      always @ *
		  if (enable)					
			 br_sel = (alu == cond) ? 1'b1 : (cond == 4'b1110) ? 1'b1 : 1'b0;
        else
		    br_sel = 1'b0;
			
endmodule
