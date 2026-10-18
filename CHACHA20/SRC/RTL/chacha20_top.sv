`timescale 1ns / 1ps
module chacha20_top 
	import Package_Round::*;
(
	input  logic         clock_i,
	input  logic         resetb_i,
	input  logic         start_i,
	input  logic [127:0] data_i,
	input  logic         data_valid_i,
	input  logic [255:0] key_i,
	input  logic [95:0]  nonce_i,
	output logic [127:0] cipher_o,
	output logic         cipher_valid_o,
	output logic         end_o
);

// Signaux internes
logic [127:0] constant_s = 128'h6b20657479622d323320646e61707865;
logic [31:0]  block_s = 32'h00000001;
logic [4:0]   cpt_s;
logic         init_s;
logic         reg_sel_s;
logic         en_cpt_s;
logic         init_cpt_s;
logic         rotation_s;
state_t       state_round_s;
state_t       state_keystream_s;
logic [511:0] keystream_s;
logic [127:0] keystream_128_s;
logic         cipher_valid_s;


// 1. Instanciation du Compteur
compteur_init cpt_inst (
	.clock_i  (clock_i),
	.resetb_i (resetb_i),
	.init_i   (init_cpt_s),
	.en_i     (en_cpt_s),
	.cpt_o    (cpt_s)
);

// 2. Instanciation de la FSM
chacha_fsm fsm_inst (
	.clock_i        (clock_i),
	.resetb_i       (resetb_i),
	.start_i        (start_i),
	.data_valid_i   (data_valid_i),
	.cpt_i          (cpt_s),
	.init_o         (init_s),
	.reg_sel_o      (reg_sel_s),
	.en_cpt_o       (en_cpt_s),
	.init_cpt_o     (init_cpt_s),
	.rotation_o     (rotation_s),
	.end_o          (end_o),
	.cipher_valid_o (cipher_valid_s)
);

// 3. Instanciation du Bloc ChaCha (32 bits interne)
chacha_block block_inst (
	.clock_i           (clock_i),
	.resetb_i          (resetb_i),
	.constant_i        (constant_s),
	.key_i             (key_i),
	.nonce_i           (nonce_i),
	.block_i           (block_s),
	.init_i            (init_s),
	.rotation_i        (rotation_s),
	.reg_sel_i         (reg_sel_s),
	.state_round_o     (state_round_s),
	.state_keystream_o (state_keystream_s)
);

// 4. Sélection du bloc de 128 bits dans le Keystream (512 bits total)
	// cpt_s vaut 0, 1 ou 2 durant la phase de XOR
Reg_512 memo_keystream (
	.clock_i  (clock_i),
	.resetb_i (resetb_i),
	.enable_i (reg_sel_s),
	.reg_i    (state_keystream_s),
	.reg_o    (keystream_s)
);

Splitter separateur_512_to_128 (
	.sel_i           (cpt_s[1:0]),
	.keystream_i     (keystream_s),
	.keystream_128_o (keystream_128_s)
);

// 5. Logique de XOR
always_comb begin
	if (resetb_i == 1'b0) cipher_o = 128'h0;
	else if (cipher_valid_s) cipher_o = data_i ^ keystream_128_s;
end

assign cipher_valid_o = cipher_valid_s;


endmodule : chacha20_top
