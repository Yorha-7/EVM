`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 20:10:34
// Design Name: Encrypter Register Interface
// Module Name: encrypter_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This module acts as a register interface between the external world (CPU/bus)
//   and the Encrypter block. It maps memory-mapped registers to load input data,
//   input keys, control signals (set), and to read encrypted data, round keys,
//   and status once the encryption is completed.
//
// Dependencies: 
//   Requires "Encrypter" block to be defined with the following ports:
//     - data_in [63:0]
//     - key_in  [63:0]
//     - clk
//     - set
//     - status
//     - key_out [63:0]
//     - data_out [63:0]
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
//   - As long as `set=1`, the encrypter block is on hold. When `set=0`,
//     the block starts execution. Once finished, status becomes 1.
//   - Memory map is used for register-style access.
// 
//////////////////////////////////////////////////////////////////////////////////

module encrypter_reg(
    input  [0:7] byte_write,   // data to be written into memory map
    input  [5:0] addr,         // address to select register
    input        clk,          // system clock
    input        we,           // write enable (active high)
    input        re,           // read enable  (active high)
    output reg [0:7] byte_read // data read from memory map
);

    //------------------------------------
    // Register address map definitions
    //------------------------------------
    localparam cmd_reg     = 0;  // command register (bit-0 = set, bit-4 = status)
    localparam set         = 0;  // bit index for "set"
    localparam status      = 4;  // bit index for "status"

    // Data input registers (to feed into Encrypter)
    localparam data_byte_0 = 1;
    localparam data_byte_1 = 2;
    localparam data_byte_2 = 3;
    localparam data_byte_3 = 4;
    localparam data_byte_4 = 5;
    localparam data_byte_5 = 6;
    localparam data_byte_6 = 7;
    localparam data_byte_7 = 8;

    // Data output registers (to read encrypted data)
    localparam read_byte_0 = 9;
    localparam read_byte_1 = 10;
    localparam read_byte_2 = 11;
    localparam read_byte_3 = 12;
    localparam read_byte_4 = 13;
    localparam read_byte_5 = 14;
    localparam read_byte_6 = 15;
    localparam read_byte_7 = 16;

    // Round key output registers
    localparam round_key_0 = 17;
    localparam round_key_1 = 18;
    localparam round_key_2 = 19;
    localparam round_key_3 = 20;
    localparam round_key_4 = 21;
    localparam round_key_5 = 22;
    localparam round_key_6 = 23;
    localparam round_key_7 = 24;

    //------------------------------------
    // Internal registers and memories
    //------------------------------------
    reg [0:7]  mem_map [0:24];  // memory-mapped register file (25 x 8-bit)
    reg [0:63] final_data;      // latched input data for Encrypter
    reg [0:63] final_key;       // latched key for Encrypter

    //------------------------------------
    // Encrypter block instantiation
    //------------------------------------
    wire state;                 // encryption status (1 = complete)
    wire [0:63] key_out;        // round key output from Encrypter
    wire [0:63] data_out;       // encrypted data output

    Encrypter Block (
        .data_in(final_data),
        .key_in(final_key),
        .clk(clk),
        .set(mem_map[cmd_reg][set]),
        .status(state),
        .key_out(key_out),
        .data_out(data_out)
    );

    integer i;

    //------------------------------------
    // Initial block (reset memory map)
    //------------------------------------
    initial begin
        for (i = 0; i < 25; i = i + 1) begin
            mem_map[i] <= 0;
        end
        byte_read  <= 0;
        final_data <= 0;
        final_key  <= 0;
    end

    //------------------------------------
    // Main sequential process
    //------------------------------------
    always @(posedge clk) begin
        //--------------------------------
        // 1. Capture Encrypter output
        //--------------------------------
        if (state && ~we) begin
            // When operation is done, store results into memory map
            mem_map[read_byte_0] <= data_out[0:7];
            mem_map[read_byte_1] <= data_out[8:15];
            mem_map[read_byte_2] <= data_out[16:23];
            mem_map[read_byte_3] <= data_out[24:31];
            mem_map[read_byte_4] <= data_out[32:39];
            mem_map[read_byte_5] <= data_out[40:47];
            mem_map[read_byte_6] <= data_out[48:55];
            mem_map[read_byte_7] <= data_out[56:63];

            mem_map[round_key_0] <= key_out[0:7];
            mem_map[round_key_1] <= key_out[8:15];
            mem_map[round_key_2] <= key_out[16:23];
            mem_map[round_key_3] <= key_out[24:31];
            mem_map[round_key_4] <= key_out[32:39];
            mem_map[round_key_5] <= key_out[40:47];
            mem_map[round_key_6] <= key_out[48:55];
            mem_map[round_key_7] <= key_out[56:63];

            // Update status bit
            mem_map[cmd_reg][status] <= state;
        end

        //--------------------------------
        // 2. Read operation
        //--------------------------------
        if (re) begin
            byte_read <= mem_map[addr];
        end

        //--------------------------------
        // 3. Write operation
        //--------------------------------
        if (we) begin
            mem_map[addr] <= byte_write;
        end

        //--------------------------------
        // 4. Latch input data and key when set=1
        //--------------------------------
        if (mem_map[cmd_reg][set]) begin
            // Data bytes
            final_data[0:7]   <= mem_map[data_byte_0];
            final_data[8:15]  <= mem_map[data_byte_1];
            final_data[16:23] <= mem_map[data_byte_2];
            final_data[24:31] <= mem_map[data_byte_3];
            final_data[32:39] <= mem_map[data_byte_4];
            final_data[40:47] <= mem_map[data_byte_5];
            final_data[48:55] <= mem_map[data_byte_6];
            final_data[56:63] <= mem_map[data_byte_7];

            // Key bytes
            final_key[0:7]    <= mem_map[round_key_0];
            final_key[8:15]   <= mem_map[round_key_1];
            final_key[16:23]  <= mem_map[round_key_2];
            final_key[24:31]  <= mem_map[round_key_3];
            final_key[32:39]  <= mem_map[round_key_4];
            final_key[40:47]  <= mem_map[round_key_5];
            final_key[48:55]  <= mem_map[round_key_6];
            final_key[56:63]  <= mem_map[round_key_7];
        end
    end

endmodule

