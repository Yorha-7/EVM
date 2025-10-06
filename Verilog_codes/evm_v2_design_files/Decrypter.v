`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 12:07:42
// Design Name: 
// Module Name: Decrypter
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


module Decrypter(
    input wire [0:63] data_in,
    input wire [0:63] round_key,
    input clk,
    input set,
    output status,
    output [0:63] data_out
    );
    
            
    wire [0:63] round_key_0;
    wire [0:63] round_key_1;
    wire [0:63] round_key_2;
    
    wire [0:63] cipher_0;
    wire [0:63] cipher_1;
    wire [0:63] cipher_2;
    wire [0:63] cipher_3;
    
    wire status_0;
    wire status_1;
    wire status_2;
    wire status_3;
    wire status_4;

    wire next_state_0;
    wire next_state_1;
    wire next_state_2;
    wire next_state_3;
    wire next_state_4;
    
    
    
    //////////////////////                       KEY CREATION             ///////////////////////
    key_circular_shift layer_0_key( .key_in(round_key), .clk(clk), .set(set), .status(status_0), .key_out(round_key_0) );
    mux mux_0( .status(status_0), .out(next_state_0) );
    permute_map layer_1_key( .data_in(round_key_0), .data_out(round_key_1), .clk(clk), .set(next_state_0), .status(status_1) );
    mux mux_1( .status(status_1), .out(next_state_1) );
    initial_permutation layer_2_key( .data_in(round_key_1), .set(next_state_1), .status(status_2), .data_out(round_key_2), .clk(clk) );
    mux mux_2( .status(status_2), .out(next_state_2) );   
    
    
    //////////////////////                     DATA ENCRYPTION             /////////////////////////
    bit_level_mixing_decode layer_4_data( .data_in(data_in), .final_key(round_key_2), .data_out(cipher_0));
    inverse_permute_map layer_3_data( .data_in(cipher_0), .set(next_state_2), .clk(clk), .status(status_3), .data_out(cipher_1));
    mux mux_4( .status(status_3), .out(next_state_3) );
    xor_decoding layer_2_data( .data_in(cipher_1), .final_key(round_key_2), .data_out(cipher_2) );
    inverse_initial_permutation layer_1_data( .data_in(cipher_2), .set(next_state_3), .status(status_4), .clk(clk), .data_out(cipher_3) );
    mux mux_3( .status(status_4), .out(next_state_4) );
    inverse_shift_encoding layer_0_data( .data_in(cipher_3), .clk(clk), .set(next_state_4), .status(status), .key(round_key_2), .data_out(data_out) );
    
    
endmodule
