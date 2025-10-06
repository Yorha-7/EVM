`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 23:12:28
// Design Name: 
// Module Name: encrypter_reg_tb
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

module encrypter_reg_tb;
    
    localparam cmd_reg = 0;
    
    localparam data_byte_0 = 1;
    localparam data_byte_1 = 2;
    localparam data_byte_2 = 3;
    localparam data_byte_3 = 4;
    localparam data_byte_4 = 5;
    localparam data_byte_5 = 6;
    localparam data_byte_6 = 7;
    localparam data_byte_7 = 8;     
    
    localparam read_byte_0 = 9;
    localparam read_byte_1 = 10;
    localparam read_byte_2 = 11;
    localparam read_byte_3 = 12;
    localparam read_byte_4 = 13;
    localparam read_byte_5 = 14;
    localparam read_byte_6 = 15;
    localparam read_byte_7 = 16;
    
    localparam round_key_0 = 17;
    localparam round_key_1 = 18;
    localparam round_key_2 = 19;
    localparam round_key_3 = 20;
    localparam round_key_4 = 21;
    localparam round_key_5 = 22;
    localparam round_key_6 = 23;
    localparam round_key_7 = 24;

    // DUT ports
    reg  [0:7] byte_write;
    reg  [5:0] addr;
    reg        clk;
    reg        we;
    reg        re;
    wire [0:7] byte_read;

    // Instantiate DUT (your top-level register interface)
    encrypter_reg DUT (
        .byte_write(byte_write),
        .addr(addr),
        .clk(clk),
        .we(we),
        .re(re),
        .byte_read(byte_read)
    );

    // clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz-ish -> 10ns period
    end

    // stimulus
    initial begin
        // init
        we = 1;re = 0;
        
        addr = cmd_reg; byte_write = 8'b10000000; #10;
        addr = data_byte_0; byte_write = 8'h01; #10;
        addr = data_byte_1; byte_write = 8'h23; #10;
        addr = data_byte_2; byte_write = 8'h45; #10;
        addr = data_byte_3; byte_write = 8'h67; #10;
        addr = data_byte_4; byte_write = 8'h89; #10;
        addr = data_byte_5; byte_write = 8'hab; #10;
        addr = data_byte_6; byte_write = 8'hcd; #10
        addr = data_byte_7; byte_write = 8'hef; #10;
        
        addr = round_key_0; byte_write = 8'h01; #10;
        addr = round_key_1; byte_write = 8'h02; #10;
        addr = round_key_2; byte_write = 8'h03; #10;
        addr = round_key_3; byte_write = 8'h04; #10;
        addr = round_key_4; byte_write = 8'h05; #10;
        addr = round_key_5; byte_write = 8'h06; #10;
        addr = round_key_6; byte_write = 8'h07; #10;
        addr = round_key_7; byte_write = 8'h08; #10;
        addr = cmd_reg; byte_write = 8'b00000000; #10;
        we = 0;
        #100;
       
       
       re = 1;      
        
        addr = read_byte_0; #10;
        addr = read_byte_1; #10;
        addr = read_byte_2; #10;
        addr = read_byte_3; #10;
        addr = read_byte_4; #10;
        addr = read_byte_5; #10;
        addr = read_byte_6; #10;
        addr = read_byte_7; #10;
        #20 $finish;
                
    end

endmodule

