`timescale 1ns / 1ps

module MuxState
	import Package_Round::*;
(
	input logic sel_i,
	input state_t state_in_i,
	input state_t state_reg_i,
	output state_t state_mux_o
);


assign state_mux_o = (sel_i) ? state_in_i : state_reg_i;


endmodule : MuxState
