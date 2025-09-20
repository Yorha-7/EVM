`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 13:13:23
// Design Name: 
// Module Name: CRC_verfier_tb
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

module CRC_verifier_tb;
    reg [0:63] data_in;
    reg clk;
    reg set;
    reg [7:0] crc_in;
    wire status;
    wire [0:7] crc;
    CRC_verifier DUT(.data_in(data_in), .crc(crc),.crc_in(crc_in), .clk(clk), .status(status), .set(set));
    
    initial clk = 0;
    
    always #5 clk = ~clk;
    
    initial begin 
      data_in = 64'h0123456789abcdef;crc_in = 8'he0 ;set = 1; #10; set = 0;
      #1000 $finish;       
    end
endmodule
