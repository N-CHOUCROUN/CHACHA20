`timescale 1ns / 1ps

module DiagonalRound_tb
	import Package_Round::*;
( //toujours vide pour la simulation
);

//déclaration de variables intermédiaires : autant que d'entrées sorties du circuit à simuler

state_t Droundi_s;
state_t Droundo_s;

DiagonalRound DUT 
(
	.Dround_i(Droundi_s),
	.Dround_o(Droundo_s)
);

//creation des stimuli
initial
	begin
		Droundi_s[0] = 32'h00000000;
		Droundi_s[1] = 32'h00000000;
		Droundi_s[2] = 32'h00000000;
		Droundi_s[3] = 32'h00000000;
		Droundi_s[4] = 32'h00000000;
		Droundi_s[5] = 32'h00000000;
		Droundi_s[6] = 32'h00000000;
		Droundi_s[7] = 32'h00000000;
		Droundi_s[8] = 32'h00000000;
		Droundi_s[9] = 32'h00000000;
		Droundi_s[10] = 32'h00000000;
		Droundi_s[11] = 32'h00000000;
		Droundi_s[12] = 32'h00000000;
		Droundi_s[13] = 32'h00000000;
		Droundi_s[14] = 32'h00000000;
		Droundi_s[15] = 32'h00000000;
		
		#10
		
		Droundi_s[0] = 32'hdf768f7d;
		Droundi_s[1] = 32'hcf72de24;
		Droundi_s[2] = 32'h6d0b7504;
		Droundi_s[3] = 32'h9cc7c200;
		Droundi_s[4] = 32'hb51b4034;
		Droundi_s[5] = 32'h3f18819b;
		Droundi_s[6] = 32'h60a74d6f;
		Droundi_s[7] = 32'h2134ec9b;
		Droundi_s[8] = 32'hfd8e795e;
		Droundi_s[9] = 32'h13d1f2cf;
		Droundi_s[10] = 32'h1fb825a2;
		Droundi_s[11] = 32'h3c44a0df;
		Droundi_s[12] = 32'he8c5efe0;
		Droundi_s[13] = 32'hc97103b9;
		Droundi_s[14] = 32'h9e145a96;
		Droundi_s[15] = 32'h84846cf5;
	end

endmodule : DiagonalRound_tb
