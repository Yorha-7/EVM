`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 14:20:37
// Design Name: 
// Module Name: CRC
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
module CRC(
    input  [0:79] data_in,
    output [0:7]  crc
);

    localparam [7:0] POLY = 8'b01010101;

    wire [7:0] crc_chain [0:80];
    assign crc_chain[0] = 8'b0;

    genvar k;
    generate
        for (k = 0; k < 80; k = k + 1) begin : CRC_LOOP
            wire msb = crc_chain[k][7];
            wire msb_xor = data_in[k] ^ crc_chain[k][7];
            assign crc_chain[k+1] = msb ? ((crc_chain[k] << 1) | data_in[k]) ^ POLY : ((crc_chain[k] << 1) | data_in[k]);
        end
    endgenerate

    assign crc = crc_chain[80];

endmodule

