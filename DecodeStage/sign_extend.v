`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    19:30:45 02/27/2017 
// Design Name: 
// Module Name:    sign_extend 
// Project Name:
// Description:
//////////////////////////////////////////////////////////////////////////////////
module sign_extend(
		input [23:0] in,  //immediate field 
		output [31:0] branch_se, //branch sign extended field
		output [31:0] store_se,  // load/store sign extended field
		output [31:0] alu_se     // alu sign extended field
				   );
  
  assign branch_se = {2'h00,in};
  assign store_se = {5'h00000,in[11:0]};
  assign alu_se = {6'h0000000,in[7:0]};

endmodule
