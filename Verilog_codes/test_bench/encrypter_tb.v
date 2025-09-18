`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 15:38:10
// Design Name: 
// Module Name: encrypter_tb
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


module encrypter_tb;

reg [0:79] data_in;
reg [0:63] master_key, baby_key;
wire [0:79] data_out;
wire [0:7] crc;

encrypter DUT( .data_in(data_in), .master_key(master_key), .baby_key(baby_key), .data_out(data_out), .crc(crc) );
initial begin
    data_in = 80'd4568924; master_key = 64'h7854123695478523; baby_key = 64'h7541689775231405; #100 $finish;
end

endmodule
