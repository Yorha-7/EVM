`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2025 08:34:54
// Design Name: 
// Module Name: bit_level_mixing_encode
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

module bit_level_mixing_encode(
    input  [0:79] data_in,
    input  [0:63] final_key,
    output [0:79] data_out
);

    (* keep = "true", dont_touch = "true" *) assign data_out[0:7]   = (data_in[0:7]   >> (final_key[0:7]   & 3'b111)) | (data_in[0:7]   << (8 - (final_key[0:7]   & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[8:15]  = (data_in[8:15]  >> (final_key[8:15]  & 3'b111)) | (data_in[8:15]  << (8 - (final_key[8:15]  & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[16:23] = (data_in[16:23] >> (final_key[16:23] & 3'b111)) | (data_in[16:23] << (8 - (final_key[16:23] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[24:31] = (data_in[24:31] >> (final_key[24:31] & 3'b111)) | (data_in[24:31] << (8 - (final_key[24:31] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[32:39] = (data_in[32:39] >> (final_key[32:39] & 3'b111)) | (data_in[32:39] << (8 - (final_key[32:39] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[40:47] = (data_in[40:47] >> (final_key[40:47] & 3'b111)) | (data_in[40:47] << (8 - (final_key[40:47] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[48:55] = (data_in[48:55] >> (final_key[48:55] & 3'b111)) | (data_in[48:55] << (8 - (final_key[48:55] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[56:63] = (data_in[56:63] >> (final_key[56:63] & 3'b111)) | (data_in[56:63] << (8 - (final_key[56:63] & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[64:71] = (data_in[64:71] >> (final_key[0:7]   & 3'b111)) | (data_in[64:71] << (8 - (final_key[0:7]   & 3'b111)));
    (* keep = "true", dont_touch = "true" *) assign data_out[72:79] = (data_in[72:79] >> (final_key[8:15]  & 3'b111)) | (data_in[72:79] << (8 - (final_key[8:15]  & 3'b111)));

endmodule

