`timescale 1ns / 1ps

module arx 
#(parameter nb_bits = 16)
(
	input logic [31:0] augend_i,
	input logic [31:0] addend_i,
	input logic [31:0] xor_i,
	output logic [31:0] sum_o,
	output logic [31:0] shift_o
);

logic [31:0] resadd_s;
logic [31:0] resxor_s;

assign resadd_s = (augend_i + addend_i);
assign resxor_s = (xor_i ^ resadd_s);
assign sum_o = resadd_s;
assign shift_o = {resxor_s[31-nb_bits:0], resxor_s[31:32-nb_bits]};

endmodule : arx
