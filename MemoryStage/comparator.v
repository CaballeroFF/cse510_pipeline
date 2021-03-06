`timescale 1ns / 1ps

module br_comp(
      input enable,
      input [3:0] alu,
      input [3:0] cond,
      output reg br_sel
        );
      always @ (posedge enable)
  br_sel = (alu == cond) ? 1 : (cond == 1110) ? 1 : 0;
        
endmodule
