`timescale 1ns / 1ps

module pc_mux (
		input sel,            //from control
		input [31:0] br,     //branch pc
		input [31:0] incr,   //incrementor pc
		output [31:0] newPC
			   );
			  
	assign newPC = sel ? br : incr;
	
endmodule