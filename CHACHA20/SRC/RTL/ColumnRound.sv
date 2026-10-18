`timescale 1ns / 1ps

module ColumnRound
	import Package_Round::*;
(
	input state_t Cround_i,
	output state_t Cround_o
);


QuarterRound QuarterRound1 (
	.a_i(Cround_i[0]),
	.b_i(Cround_i[4]),
	.c_i(Cround_i[8]),
	.d_i(Cround_i[12]),
	.a_o(Cround_o[0]),
	.b_o(Cround_o[4]),
	.c_o(Cround_o[8]),
	.d_o(Cround_o[12])
);

QuarterRound QuarterRound2 (
	.a_i(Cround_i[1]),
	.b_i(Cround_i[5]),
	.c_i(Cround_i[9]),
	.d_i(Cround_i[13]),
	.a_o(Cround_o[1]),
	.b_o(Cround_o[5]),
	.c_o(Cround_o[9]),
	.d_o(Cround_o[13])
);

QuarterRound QuarterRound3 (
	.a_i(Cround_i[2]),
	.b_i(Cround_i[6]),
	.c_i(Cround_i[10]),
	.d_i(Cround_i[14]),
	.a_o(Cround_o[2]),
	.b_o(Cround_o[6]),
	.c_o(Cround_o[10]),
	.d_o(Cround_o[14])
);

QuarterRound QuarterRound4 (
	.a_i(Cround_i[3]),
	.b_i(Cround_i[7]),
	.c_i(Cround_i[11]),
	.d_i(Cround_i[15]),
	.a_o(Cround_o[3]),
	.b_o(Cround_o[7]),
	.c_o(Cround_o[11]),
	.d_o(Cround_o[15])
);


endmodule : ColumnRound
