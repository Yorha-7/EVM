`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 11:53:47
// Design Name: 
// Module Name: initial_permutation_tb
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


module initial_permutation_tb;
    
    reg [0:63] data_in;
    reg clk;
    reg set;
    wire status;
    wire [0:63] data_out;
    initial_permutation DUT(.data_in(data_in), .clk(clk), .set(set), .data_out(data_out), .status(status));
    
    initial clk = 1;
    always #5 clk = ~clk;
    
    initial begin
        set = 1; data_in = 64'h0123456789abcdef; # 10 ; set = 0; #30 $finish;
    end
        
endmodule
