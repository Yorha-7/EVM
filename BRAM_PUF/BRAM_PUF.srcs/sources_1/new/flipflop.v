`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 10:56:42
// Design Name: 
// Module Name: flipflop
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


module flipflop(
    input d,we,
    output reg dout
    );
    
    initial dout <= 1'b0;
    always @(posedge we) begin
        dout <= 1'b1;
    end
endmodule
