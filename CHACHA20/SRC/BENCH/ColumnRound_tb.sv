`timescale 1ns / 1ps

module ColumnRound_tb
	import Package_Round::*;
( //toujours vide pour la simulation 
);

//déclaration de variables intermédiaires : autant que d'entrées sorties du circuit à simuler

state_t Croundi_s;
state_t Croundo_s;

ColumnRound DUT 
(
	.Cround_i(Croundi_s),
	.Cround_o(Croundo_s)
);

//creation des stimuli
initial
	begin
		Croundi_s[0] = 32'h00000000;
		Croundi_s[1] = 32'h00000000;
		Croundi_s[2] = 32'h00000000;
		Croundi_s[3] = 32'h00000000;
		Croundi_s[4] = 32'h00000000;
		Croundi_s[5] = 32'h00000000;
		Croundi_s[6] = 32'h00000000;
		Croundi_s[7] = 32'h00000000;
		Croundi_s[8] = 32'h00000000;
		Croundi_s[9] = 32'h00000000;
		Croundi_s[10] = 32'h00000000;
		Croundi_s[11] = 32'h00000000;
		Croundi_s[12] = 32'h00000000;
		Croundi_s[13] = 32'h00000000;
		Croundi_s[14] = 32'h00000000;
		Croundi_s[15] = 32'h00000000;
		
		#10
		
		Croundi_s[0] = 32'h61707865;
		Croundi_s[1] = 32'h3320646e;
		Croundi_s[2] = 32'h79622d32;
		Croundi_s[3] = 32'h6b206574;
		Croundi_s[4] = 32'he921c73a;
		Croundi_s[5] = 32'h76a2b5ea;
		Croundi_s[6] = 32'h322fdc9a;
		Croundi_s[7] = 32'h27a09386;
		Croundi_s[8] = 32'hd52a3eec;
		Croundi_s[9] = 32'hd3a53fef;
		Croundi_s[10] = 32'h860e69ae;
		Croundi_s[11] = 32'h4e7ced7e;
		Croundi_s[12] = 32'h00000001;
		Croundi_s[13] = 32'h06e46ce3;
		Croundi_s[14] = 32'hcaccf259;
		Croundi_s[15] = 32'hd4ac91b9;
	end

endmodule : ColumnRound_tb
