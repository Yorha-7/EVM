`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2025 08:25:30
// Design Name: 
// Module Name: key_creation_tb
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


module key_creation_tb;
    wire [0:63] final_key;
    reg [0:63] master_key;
    reg [0:63] baby_key;
    key_creation DUT(.master_key(master_key) , .baby_key(baby_key), .final_key(final_key));
    initial begin
        master_key = 64'h617859626A636431; baby_key = 64'h426162656967796C;
        #20 $finish;  
    end
endmodule
