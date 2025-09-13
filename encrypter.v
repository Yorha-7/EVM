`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 15:25:02
// Design Name: 
// Module Name: encrypter
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


module encrypter(
    input [0:79] data_in,
    input [0:63] master_key,
    input [0:63] baby_key,
    output [0:79] data_out,
    output [0:7] crc
    );
    wire [0:63] final_key;
    wire [0:79] stage_1_in = data_in;
    wire [0:79] stage_1_out;
    CRC stage_crc( .data_in(stage_1_in), .crc(crc));
    key_creation creat_key( .master_key(master_key), .baby_key(baby_key), .final_key(final_key) );
    bit_level_mixing_encode stage_1( .data_in(stage_1_in), .data_out(stage_1_out), .final_key(final_key));
    wire [0:79] stage_2_out;
    shift_encoding stage_2( .data_in(stage_1_out), .final_key(final_key), .data_out(stage_2_out));
    xor_encoding stage_3( .data_in(stage_2_out), .final_key(final_key), .data_out(data_out));
        
endmodule
