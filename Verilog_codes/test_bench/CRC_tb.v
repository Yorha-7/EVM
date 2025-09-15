`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 14:34:01
// Design Name: 
// Module Name: CRC_tb
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


module CRC_tb;
    reg [0:79] data_in;
    wire [0:7] crc;
    CRC DUT(.data_in(data_in), .crc(crc));
    

    
    initial begin 
      data_in = 80'd7989645789; #10
      $finish;       
    end
    
endmodule
