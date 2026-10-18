`timescale 1ns / 1ps

module RegState
	import Package_Round::*;
(
	input logic clock_i,
	input logic resetb_i,
	input logic enable_i,
	input state_t state_round_i,
	output state_t state_reg_o
);

	
always_ff @(posedge clock_i or negedge resetb_i) begin
	if (resetb_i == 1'b0) state_reg_o <= '0;
	else if (enable_i == 1'b1) state_reg_o <= state_round_i;
end


endmodule : RegState
