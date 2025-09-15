`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 06:36:23
// Design Name: 
// Module Name: my_sha_tb
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


module my_sha_tb;
    reg clk,reset_n,cs,we;
    reg [7:0] address;
    reg [31:0] write_data;
    wire [31:0] read_data;
    wire error;    
    sha256 DUT(.clk(clk), 
                .reset_n(reset_n),
                .cs(cs), .we(we), 
                .address(address), 
                .write_data(write_data), 
                .read_data(read_data), 
                .error(error));
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        reset_n = 0; #20; reset_n = 1;
        cs = 1; we = 1; address = 8'h10; write_data = 32'h45612387; #10;
        address = 8'h08; write_data = 32'h00000005; #10;
        address = 8'h08; write_data = 32'h00000000; #10;
        address = 8'h09; we = 0; #710;
        address = 8'h20; #10;
        address = 8'h21; #10;
        address = 8'h22; #10;
        address = 8'h23; #10;
        address = 8'h24; #10;
        address = 8'h25; #10;
        address = 8'h26; #10;
        address = 8'h27; #10;       
        
    end
endmodule
