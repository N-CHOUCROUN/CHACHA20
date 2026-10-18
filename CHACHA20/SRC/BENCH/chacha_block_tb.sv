`timescale 1ns / 1ps
module chacha_block_tb
	import Package_Round::*;
( //toujours vide pour la simulation
);

logic clock_s;
logic resetb_s;
logic [127:0] constant_s;
logic [255:0] key_s;
logic [95:0] nonce_s;
logic [31:0] block_s;
logic init_s;
logic rotation_s;
logic reg_sel_s;
state_t state_round_s;
state_t state_keystream_s;

chacha_block DUT (
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.constant_i(constant_s),
	.key_i(key_s),
	.nonce_i(nonce_s),
	.block_i(block_s),
	.init_i(init_s),
	.rotation_i(rotation_s),
	.reg_sel_i(reg_sel_s),
	.state_round_o(state_round_s),
	.state_keystream_o(state_keystream_s)
);

initial begin
	clock_s = 1'b0;
	forever #5 clock_s = ~clock_s;
end

initial begin
	resetb_s = 1'b0;
	constant_s = 128'h0;
	key_s = 256'h0;
	nonce_s = 96'h0;
	block_s = 32'h0;
	init_s = 1'b0;
	rotation_s = 1'b0;
	reg_sel_s = 1'b0;
	#12;
	resetb_s = 1'b1;

// Valeurs du sujet
	constant_s = 128'h6b20657479622d323320646e61707865;
	key_s = 256'h4e7ced7e860e69aed3a53fefd52a3eec27a09386322fdc9a76a2b5eae921c73a;
	nonce_s = 96'hd4ac91b9caccf25906e46ce3;
	block_s = 32'h00000001;

// Cycle d'initialisation : charge Sinit et calcule la première ronde
	init_s = 1'b1;
	reg_sel_s = 1'b1;

	#10;
	init_s = 1'b0;

// 19 autres rondes pour arriver à 20 au total
	repeat (19) begin
		rotation_s = ~rotation_s;
		#10;
	end

	reg_sel_s = 1'b0;

	#10;
	
end

endmodule : chacha_block_tb
