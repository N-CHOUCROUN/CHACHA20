`timescale 1ns / 1ps

module arx_tb ( //toujours vide pour la simulation
);

//déclaration de variables intermédiaires : autant que d'entrées sorties du circuit à simuler

logic [31:0] augend_s;
logic [31:0] addend_s;
logic [31:0] xor_s;
logic [31:0] sum_s;
logic [31:0] shift_s;

arx #(.nb_bits(7)) DUT 
(
	.augend_i(augend_s),
	.addend_i(addend_s),
	.xor_i(xor_s),
	.sum_o(sum_s),
	.shift_o(sift_s)
);

//creation des stimuli
initial
	begin
		augend_s = 32'h00000000;
		addend_s = 32'h00000000;
		xor_s = 32'h00000000;
		#10
		augend_s = 32'h01234567;
		addend_s = 32'h77777777;
		xor_s = 32'h01020304;
		#10
		augend_s = 32'hf2e1a126;
		addend_s = 32'h2b3e4456;
		xor_s = 32'h12b7f568;
	end

endmodule : arx_tb
