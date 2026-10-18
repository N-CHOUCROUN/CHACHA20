`timescale 1ns / 1ps

module QuarterRound_tb ( //toujours vide pour la simulation
);

//déclaration de variables intermédiaires : autant que d'entrées sorties du circuit à simuler

logic [31:0] ai_s;
logic [31:0] bi_s;
logic [31:0] ci_s;
logic [31:0] di_s;
logic [31:0] ao_s;
logic [31:0] bo_s;
logic [31:0] co_s;
logic [31:0] do_s;

QuarterRound DUT 
(
	.a_i(ai_s),
	.b_i(bi_s),
	.c_i(ci_s),
	.d_i(di_s),
	.a_o(ao_s),
	.b_o(bo_s),
	.c_o(co_s),
	.d_o(do_s)
);

//creation des stimuli
initial
	begin
		ai_s = 32'h00000000;
		bi_s = 32'h00000000;
		ci_s = 32'h00000000;
		di_s = 32'h00000000;
		#10
		ai_s = 32'h11111111;
		bi_s = 32'h01020304;
		ci_s = 32'h9b8d6f43;
		di_s = 32'h01234567;
	end

endmodule : QuarterRound_tb
