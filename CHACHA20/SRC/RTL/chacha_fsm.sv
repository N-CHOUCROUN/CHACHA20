`timescale 1ns / 1ps

module chacha_fsm (
	input logic clock_i,
	input logic resetb_i,
	input logic start_i,
	input logic data_valid_i,
	input logic [4:0] cpt_i,
	output logic init_o, // vers chacha_block
	output logic reg_sel_o, // vers chacha_block
	output logic en_cpt_o, // vers compteur_init
	output logic init_cpt_o, // vers compteur_init
	output logic rotation_o,
	output logic end_o,
	output logic cipher_valid_o
);

// FSM_Moore
typedef enum logic [3:0] {
	IDLE = 4'd0,
        INIT_CPT = 4'd1,
        ROUND_COL = 4'd2,
        ROUND_DIAG = 4'd3,
        KEYSTREAM = 4'd4,
        WAIT_DATA = 4'd5,
        XOR_CIPHER = 4'd6,
        CIPHER_VALID = 4'd7,
        END = 4'd8
} state_fsm_t;

state_fsm_t current_state, next_state;


// Registre d'état
always_ff @(posedge clock_i or negedge resetb_i) begin : seq_0
	if (resetb_i == 1'b0) current_state <= IDLE;
	else current_state <= next_state;
end : seq_0


// Logique de transition
always_comb begin : comb_0
	case (current_state)
		IDLE: begin
			if (start_i == 1'b1) next_state = INIT_CPT;
			else next_state = IDLE;
		end
		INIT_CPT: begin
			next_state = ROUND_DIAG;
		end
		ROUND_COL: begin
			if (cpt_i == 5'd18) next_state = KEYSTREAM;
			else next_state = ROUND_DIAG;
		end
		ROUND_DIAG: begin
			if (cpt_i == 5'd18) next_state = KEYSTREAM;
			else next_state = ROUND_COL;
		end
		KEYSTREAM: begin
			next_state = WAIT_DATA;
		end
		WAIT_DATA: begin
			if (data_valid_i == 1'b1) next_state = XOR_CIPHER;
			else next_state = WAIT_DATA;
		end
		XOR_CIPHER: begin
			next_state = CIPHER_VALID;
		end
		CIPHER_VALID: begin
			if (cpt_i == 5'd3) next_state = END;
			else next_state = WAIT_DATA;
		end
		END: begin
			if (start_i == 1'b0) next_state = IDLE;
			else next_state = END;
		end
		default: begin
			next_state = IDLE;
		end
	endcase
end : comb_0


/// Logique de sortie (Moore)
always_comb begin : comb_1
	init_o = 1'b0;
	reg_sel_o = 1'b0;
	en_cpt_o = 1'b0;
	init_cpt_o = 1'b0;
	rotation_o = 1'b0;
	end_o = 1'b0;
	cipher_valid_o = 1'b0;
	case (current_state)
		IDLE: begin
		end
		INIT_CPT: begin
			init_o = 1'b1;
			init_cpt_o = 1'b1;
			en_cpt_o = 1'b1;
			reg_sel_o = 1'b1;
		end
		ROUND_COL: begin
			en_cpt_o = 1'b1;
			init_cpt_o = 1'b0;
			reg_sel_o = 1'b1;
			rotation_o = 1'b0;
		end
		ROUND_DIAG: begin
			en_cpt_o = 1'b1;
			init_cpt_o = 1'b0;
			reg_sel_o = 1'b1;
			rotation_o = 1'b1;
		end
		KEYSTREAM: begin
			reg_sel_o = 1'b1;
			en_cpt_o = 1'b1;
			init_cpt_o = 1'b1;
			end_o = 1'b1;
		end
		WAIT_DATA: begin
			init_cpt_o = 1'b0;
			cipher_valid_o = 1'b0;
		end
		XOR_CIPHER: begin
		end
		CIPHER_VALID: begin
			en_cpt_o = 1'b1;
			init_cpt_o = 1'b0;
			cipher_valid_o = 1'd1;
		end
		END: begin
			cipher_valid_o = 1'b0;
		end
		default: begin
		end
	endcase
end : comb_1

endmodule : chacha_fsm
