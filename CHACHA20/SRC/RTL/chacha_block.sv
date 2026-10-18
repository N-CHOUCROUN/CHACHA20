`timescale 1ns / 1ps
module chacha_block
	import Package_Round::*;
(
	input logic clock_i,
	input logic resetb_i,
	input logic [127:0] constant_i,
	input logic [255:0] key_i,
	input logic [95:0] nonce_i,
	input logic [31:0] block_i,
	input logic init_i,
	input logic rotation_i,
	input logic reg_sel_i,
	output state_t state_round_o,
	output state_t state_keystream_o
);


state_t state_in_s;
state_t state_round_compute_s;
state_t state_round_toggled_s;
state_t state_mux_s;
state_t state_reg_s;
logic input_sel_s;
state_t state_keystream_s;


// Initialisation de l’état Sinit
always_comb begin
	state_in_s[0] = constant_i[31:0];
	state_in_s[1] = constant_i[63:32];
	state_in_s[2] = constant_i[95:64];
	state_in_s[3] = constant_i[127:96];
	state_in_s[4] = key_i[31:0];
	state_in_s[5] = key_i[63:32];
	state_in_s[6] = key_i[95:64];
	state_in_s[7] = key_i[127:96];
	state_in_s[8] = key_i[159:128];
	state_in_s[9] = key_i[191:160];
	state_in_s[10] = key_i[223:192];
	state_in_s[11] = key_i[255:224];
	state_in_s[12] = block_i;
	state_in_s[13] = nonce_i[31:0];
	state_in_s[14] = nonce_i[63:32];
	state_in_s[15] = nonce_i[95:64];
end

assign input_sel_s = init_i;

// Multiplexeur d’entrée
// input_sel_s = 1 -> on injecte l’état initial
// input_sel_s = 0 -> on réutilise l’état mémorisé
MuxState mux_state (
	.sel_i(input_sel_s),
	.state_in_i(state_in_s),
	.state_reg_i(state_reg_s),
	.state_mux_o(state_mux_s)
);
	

// Bloc général de ronde
Round round_block (
	.round_i(state_mux_s),
	.round_o(state_round_compute_s)
);

// Bloc de rotation colonne / diagonale
ToggleRound toggle_round (
	.compute_i(state_round_compute_s),
	.coldiag_i(rotation_i),
	.toggled_o(state_round_toggled_s)
);


// Registre d’état courant
RegState reg_state (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.enable_i(reg_sel_i),
	.state_round_i(state_round_toggled_s),
	.state_reg_o(state_reg_s)
);


// Calcul du keystream = état final + état initial
// additions modulo 2^32
always_comb begin
	state_keystream_s[0] = state_reg_s[0] + state_in_s[0];
	state_keystream_s[1] = state_reg_s[1] + state_in_s[1];
	state_keystream_s[2] = state_reg_s[2] + state_in_s[2];
	state_keystream_s[3] = state_reg_s[3] + state_in_s[3];
	state_keystream_s[4] = state_reg_s[4] + state_in_s[4];
	state_keystream_s[5] = state_reg_s[5] + state_in_s[5];
	state_keystream_s[6] = state_reg_s[6] + state_in_s[6];
	state_keystream_s[7] = state_reg_s[7] + state_in_s[7];
	state_keystream_s[8] = state_reg_s[8] + state_in_s[8];
	state_keystream_s[9] = state_reg_s[9] + state_in_s[9];
	state_keystream_s[10] = state_reg_s[10] + state_in_s[10];
	state_keystream_s[11] = state_reg_s[11] + state_in_s[11];
	state_keystream_s[12] = state_reg_s[12] + state_in_s[12];
	state_keystream_s[13] = state_reg_s[13] + state_in_s[13];
	state_keystream_s[14] = state_reg_s[14] + state_in_s[14];
	state_keystream_s[15] = state_reg_s[15] + state_in_s[15];
end


assign state_round_o = state_reg_s;
assign state_keystream_o = state_keystream_s;


endmodule : chacha_block
