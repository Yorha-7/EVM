`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 19:10:28
// Design Name: 
// Module Name: arbitar
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


module arbitar(
    input signal0,
    input signal1,
    output reg out
);
    initial out <= 0;
    always @(*) begin
        if (signal0 & ~signal1)
            out = 1;
        else if (~signal0 & signal1)
            out = 0;
        else
            out = out; // hold (metastable case)
    end
endmodule
