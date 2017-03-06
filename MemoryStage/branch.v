'timescale 1ns / 1ps 

module branch_func (
		input branch,
		input br_control,
		output reg PC_mux_control
					);
	initial PC_mux_control = 0;
	
	always @ *
		PC_mux_control = br_control && branch;

endmodule