`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 09:50:40
// Design Name: 
// Module Name: top
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

//module delayer #(parameter N = 8) (,
//    input start_i,
//    input clk,
//    input [N:0] chal_i,
//    output sig0_o,sig1_o
//    );

//module arbitar(
//    input signal0,
//    input signal1,
//    output out,
//    output err
//    );
module top #(parameter N = 12, parameter M = 16) (
    input wire start,
    input wire [N:0] chal_i,
    output [M-1:0] LED
    );
    
    (* keep = "true", dont_touch = "true" *) wire [M-1:0] sig0_t,sig1_t;
    (* keep = "true", dont_touch = "true" *) wire [M-1:0] response;
    genvar z;
    generate
        for (z = 0; z < M; z = z + 1)begin
            delayer DUT_1( .start_i(start), .chal_i(chal_i), .sig0_o(sig0_t[z]), .sig1_o(sig1_t[z]) );
            arbitar DUT_2( .signal0(sig0_t[z]), .signal1(sig1_t[z]), .out(response[z]) );
        end
    endgenerate
    assign LED = response;
endmodule
