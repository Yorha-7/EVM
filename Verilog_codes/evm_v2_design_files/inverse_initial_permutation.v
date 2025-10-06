`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 20:13:01
// Design Name: 
// Module Name: inverse_initial_permutation
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


module inverse_initial_permutation(
    input wire [0:63] data_in,
    input clk,
    input set,
    output reg status,
    output reg [0:63] data_out
    );
    
    localparam [0:63] map = { 8'd40,8'd8,8'd48,8'd16,8'd56,8'd24,8'd64,8'd32 };
    
    integer i,k;
    
    initial begin data_out <= 0; status <= 0; end
    
    always @(posedge clk) begin
        if (set) begin
            data_out <= 0;
            status <= 0;
        end
        else if (~status) begin
            for (i = 0; i < 8; i = i + 1) begin
                for (k = 0; k < 8; k = k + 1)begin
                    data_out[8*i + k] = data_in[map[8*k +: 8] - i - 1];  
                end
            end
            status <= 1;
        end
    end       
endmodule
