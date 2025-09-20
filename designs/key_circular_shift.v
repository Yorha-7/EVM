`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 19:45:35
// Design Name: 
// Module Name: key_circular_shift
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



module key_circular_shift(
    input wire [0:63] key_in,
    input clk,
    input set,
    output reg status,
    output reg [0:63] key_out
    );
        initial begin
            key_out <= 0;
            status <= 1'b0;
        end
        always @(posedge clk) begin 
            if (set) begin 
                status <= 0;
                key_out <= 0;
            end
            if (~set && ~status) begin
                key_out[0:31] <= (key_in[0:31] << 2) | (key_in[0:31] >> 62);
                key_out[32:63] <= (key_in[32:63] << 2) | (key_in[32:63] >> 62);   
                status <= 1;   
            end  
        end

endmodule
