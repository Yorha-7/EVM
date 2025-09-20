`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 19:13:34
// Design Name: 
// Module Name: Encrypter_tb
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


module Encrypter_tb;
reg [0:63] data_in;
reg clk;
reg set;
reg [0:63] key_in;
wire [0:63] data_out;
wire status;

Encrypter DUT( .data_in(data_in), .clk(clk), .set(set), .status(status), .data_out(data_out), .key_in(key_in));

initial clk = 0;

always #5 clk = ~clk;

initial begin 
    data_in = 64'h0123456789abcdef; set = 1; key_in = 64'h0102030405060708; #10; set = 0; #100 $finish; 
end

endmodule
