`timescale 1ns / 1ps

module ToggleRound
	import Package_Round::*;
(
	input state_t compute_i,
	input logic coldiag_i,
	output state_t toggled_o
);


always_comb begin
	if (coldiag_i == 1'b0) begin
		toggled_o[0] = compute_i[0];
		toggled_o[1] = compute_i[1];
		toggled_o[2] = compute_i[2];
		toggled_o[3] = compute_i[3];
		toggled_o[4] = compute_i[5];
		toggled_o[5] = compute_i[6];
		toggled_o[6] = compute_i[7];
		toggled_o[7] = compute_i[4];
		toggled_o[8] = compute_i[10];
		toggled_o[9] = compute_i[11];
		toggled_o[10] = compute_i[8];
		toggled_o[11] = compute_i[9];
		toggled_o[12] = compute_i[15];
		toggled_o[13] = compute_i[12];
		toggled_o[14] = compute_i[13];
		toggled_o[15] = compute_i[14];
	end

	if (coldiag_i == 1'b1) begin
		toggled_o[0] = compute_i[0];
		toggled_o[1] = compute_i[1];
		toggled_o[2] = compute_i[2];
		toggled_o[3] = compute_i[3];
		toggled_o[4] = compute_i[7];
		toggled_o[5] = compute_i[4];
		toggled_o[6] = compute_i[5];
		toggled_o[7] = compute_i[6];
		toggled_o[8] = compute_i[10];
		toggled_o[9] = compute_i[11];
		toggled_o[10] = compute_i[8];
		toggled_o[11] = compute_i[9];
		toggled_o[12] = compute_i[13];
		toggled_o[13] = compute_i[14];
		toggled_o[14] = compute_i[15];
		toggled_o[15] = compute_i[12];
	end
end


endmodule : ToggleRound
