`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 13:09:11
// Design Name: 
// Module Name: CRC_verifier
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


module CRC_verifier(
    input wire [0:63] data_in,
    input clk,
    input wire set,
    input wire [7:0] crc_in,
    output reg [7:0] crc,
    output reg status
);

    localparam [7:0] POLY = 8'b01010101;
    wire [0:70] c_data_in = {data_in,crc_in};
    reg [7:0] crc_reg = 0;
    reg data_bit_in,crc_bit_out;
    reg [6:0] tracker = 0;
    initial crc = 8'hff;
    initial status = 0;
    always @(posedge set) begin
        tracker <= 0; crc_reg <= 0; status <= 0;
    end
    always @(posedge clk && ~status) begin
            if (tracker > 71) begin crc <= crc_reg; status <= 1'b1; end
            data_bit_in <= c_data_in[tracker];
            crc_bit_out <= crc_reg[7];
            if (crc_bit_out) crc_reg <= ((crc_reg << 1) | data_bit_in) ^ POLY;
            else crc_reg <= (crc_reg << 1) | data_bit_in;
            tracker <= tracker + 1; 
    end
endmodule

