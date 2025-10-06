`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 11:30:16
// Design Name: 
// Module Name: initial_permutation
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


module initial_permutation(
    input wire [0:63] data_in,
    input clk,
    input set,
    output reg [0:63] data_out,
    output reg status
    );
    
    localparam [0:63] map = {8'd58,8'd60,8'd62,8'd64,8'd57,8'd59,8'd61,8'd63};
    integer i;
    integer k;
    
    initial begin data_out <= 0; status <= 1'b0; end
    
    always @(posedge clk) begin
        
        if (set) begin 
            status <= 1'b0; data_out <= 0;
        end
        if (~set && ~status) begin
            for (i = 0; i < 8; i = i + 1) begin
                for (k = 0; k < 8; k = k + 1) begin
                    data_out[8*i + k] = data_in[(map[8*i +: 8] - 8*k) - 1];
                end 
            end
            status <= 1'b1;
            end    
    end
endmodule
