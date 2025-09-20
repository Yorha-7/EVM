`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 13:06:58
// Design Name: 
// Module Name: xor_decoding
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


module xor_decoding(
        input [0:63] data_in,
        input [0:63] final_key,
        output [0:63] data_out
    );
    
    assign data_out[0:7] = data_in[0:7] ^ final_key[0:7];
    assign data_out[8:15] = data_in[8:15] ^ final_key[8:15];
    assign data_out[16:23] = data_in[16:23] ^ final_key[16:23];
    assign data_out[24:31] = data_in[24:31] ^ final_key[24:31];
    assign data_out[32:39] = data_in[32:39] ^ final_key[32:39];
    assign data_out[40:47] = data_in[40:47] ^ final_key[40:47];
    assign data_out[48:55] = data_in[48:55] ^ final_key[48:55];
    assign data_out[56:63] = data_in[56:63] ^ final_key[56:63];  
    
endmodule
