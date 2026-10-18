`timescale 1ns / 1ps

module DiagonalRound
	import Package_Round::*;
(
	input state_t Dround_i,
	output state_t Dround_o
);


QuarterRound QuarterRound1 (
	.a_i(Dround_i[0]),
	.b_i(Dround_i[5]),
	.c_i(Dround_i[10]),
	.d_i(Dround_i[15]),
	.a_o(Dround_o[0]),
	.b_o(Dround_o[5]),
	.c_o(Dround_o[10]),
	.d_o(Dround_o[15])
);

QuarterRound QuarterRound2 (
	.a_i(Dround_i[1]),
	.b_i(Dround_i[6]),
	.c_i(Dround_i[11]),
	.d_i(Dround_i[12]),
	.a_o(Dround_o[1]),
	.b_o(Dround_o[6]),
	.c_o(Dround_o[11]),
	.d_o(Dround_o[12])
);

QuarterRound QuarterRound3 (
	.a_i(Dround_i[2]),
	.b_i(Dround_i[7]),
	.c_i(Dround_i[8]),
	.d_i(Dround_i[13]),
	.a_o(Dround_o[2]),
	.b_o(Dround_o[7]),
	.c_o(Dround_o[8]),
	.d_o(Dround_o[13])
);

QuarterRound QuarterRound4 (
	.a_i(Dround_i[3]),
	.b_i(Dround_i[4]),
	.c_i(Dround_i[9]),
	.d_i(Dround_i[14]),
	.a_o(Dround_o[3]),
	.b_o(Dround_o[4]),
	.c_o(Dround_o[9]),
	.d_o(Dround_o[14])
);


endmodule : DiagonalRound
