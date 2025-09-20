`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 10:48:09
// Design Name: 
// Module Name: bit_level_mixing_decode_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bit_level_mixing_decode_tb;

reg [0:63] data_in;
reg [0:63] final_key;
wire [0:63] data_out;

bit_level_mixing_decode DUT( .data_in(data_in), .data_out(data_out), .final_key(final_key) );

initial begin 
    data_in = 64'h80c8a8764cae9bef; final_key = 64'h0102030405060708; #10 $finish;
end

endmodule
