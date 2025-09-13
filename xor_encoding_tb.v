`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 08:20:14
// Design Name: 
// Module Name: xor_encoding_tb
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


module xor_encoding_tb;
reg [0:79] data_in;
reg [0:63] final_key;
wire [0:79] data_out;

xor_encoding DUT( .data_in(data_in), .data_out(data_out), .final_key(final_key));

initial begin 
    data_in = 80'h00000000000000000000; final_key = 64'h1111111111111111; #10 $finish;
end

endmodule
