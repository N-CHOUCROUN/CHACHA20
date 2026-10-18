`timescale 1ns / 1ps

module Splitter
(
	input logic[1:0] sel_i,
	input logic[511:0] keystream_i,
	output logic[127:0] keystream_128_o
);

always_comb begin
	if (sel_i == 2'b00) assign keystream_128_o = keystream_i[127:0];
	else if (sel_i == 2'b01) assign keystream_128_o = keystream_i[255:128];
	else if (sel_i == 2'b10) assign keystream_128_o = keystream_i[383:256];
	else assign keystream_128_o = 128'h0;
end


endmodule : Splitter
