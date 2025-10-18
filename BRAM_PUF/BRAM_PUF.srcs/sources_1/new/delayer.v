`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 09:22:59
// Design Name: 
// Module Name: delayer
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

module delayer #(parameter N = 12)(
    input  [N-1:0] chal_i,
    input  start_i,
    output sig0_o,
    output sig1_o
);
    (* keep = "true", dont_touch = "true" *) wire [N:0] path0, path1;

    assign path0[0] = start_i;
    assign path1[0] = start_i;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin
            assign path0[i+1] = chal_i[i] ? path1[i] : path0[i];
            assign path1[i+1] = chal_i[i] ? path0[i] : path1[i];
        end
    endgenerate

    assign sig0_o = path0[N];
    assign sig1_o = path1[N];
endmodule
