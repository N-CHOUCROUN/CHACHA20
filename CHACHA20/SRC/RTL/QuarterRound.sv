`timescale 1ns / 1ps

module QuarterRound
#(parameter nb_bits = 16)
(
	input logic [31:0] a_i,
	input logic [31:0] b_i,
	input logic [31:0] c_i,
	input logic [31:0] d_i,
	output logic [31:0] a_o,
	output logic [31:0] b_o,
	output logic [31:0] c_o,
	output logic [31:0] d_o
);

logic [31:0] a1_s, a2_s;
logic [31:0] b1_s, b2_s;
logic [31:0] c1_s, c2_s;
logic [31:0] d1_s, d2_s;



arx #(.nb_bits(16)) arx1 (
	.augend_i(a_i),
	.addend_i(b_i),
	.xor_i(d_i),
	.sum_o(a1_s),
	.shift_o(d1_s)
);

arx #(.nb_bits(12)) arx2 (
	.augend_i(c_i),
	.addend_i(d1_s),
	.xor_i(b_i),
	.sum_o(c1_s),
	.shift_o(b1_s)
);

arx #(.nb_bits(8)) arx3 (
	.augend_i(a1_s),
	.addend_i(b1_s),
	.xor_i(d1_s),
	.sum_o(a2_s),
	.shift_o(d2_s)
);

arx #(.nb_bits(7)) arx4 (
	.augend_i(c1_s),
	.addend_i(d2_s),
	.xor_i(b1_s),
	.sum_o(c2_s),
	.shift_o(b2_s)
);



assign a_o = a2_s;
assign b_o = b2_s;
assign c_o = c2_s;
assign d_o = d2_s;

endmodule : QuarterRound
