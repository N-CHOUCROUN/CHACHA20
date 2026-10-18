`timescale 1ns / 1ps

module Reg_512
	import Package_Round::*;
(
	input logic clock_i,
	input logic resetb_i,
	input logic enable_i,
	input state_t reg_i,
	output logic[511:0] reg_o
);

	
always_ff @(posedge clock_i or negedge resetb_i) begin
	if (resetb_i == 1'b0) reg_o <= '0;
	else if (enable_i == 1'b1) begin
		reg_o[31:0] <= reg_i[0];
		reg_o[63:32] <= reg_i[1];
		reg_o[95:64] <= reg_i[2];
		reg_o[127:96] <= reg_i[3];
		reg_o[159:128] <= reg_i[4];
		reg_o[191:160] <= reg_i[5];
		reg_o[223:192] <= reg_i[6];
		reg_o[255:224] <= reg_i[7];
		reg_o[287:256] <= reg_i[8];
		reg_o[319:288] <= reg_i[9];
		reg_o[351:320] <= reg_i[10];
		reg_o[383:352] <= reg_i[11];
		reg_o[415:384] <= reg_i[12];
		reg_o[447:416] <= reg_i[13];
		reg_o[479:448] <= reg_i[14];
		reg_o[511:480] <= reg_i[15];
	end
end


endmodule : Reg_512
