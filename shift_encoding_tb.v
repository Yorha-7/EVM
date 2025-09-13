`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 10:08:56
// Design Name: 
// Module Name: shift_encoding_tb
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


module shift_encoding_tb;
    reg [0:79] data_in;
    reg [0:63] final_key;
    wire [0:79] data_out;
    
    shift_encoding DUT( .data_in(data_in), .data_out(data_out), .final_key(final_key));
    
    initial begin
        data_in = 80'h78554abc478acbdef789; final_key = 64'h0102030405060708; #10 $finish;
    end
    
endmodule
