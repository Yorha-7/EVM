`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 10:41:59
// Design Name: 
// Module Name: inverse_shift_encoding_tb
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


module inverse_shift_encoding_tb;
    reg [0:63] data_in;
    reg [0:63] final_key;
    wire [0:63] data_out;
    wire status;
    reg clk;
    reg set;
    shift_encoding DUT( .data_in(data_in),.clk(clk), .set(set), .status(status), .data_out(data_out), .key(final_key));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        set = 1; data_in = 64'h8967452301efcdab; final_key = 64'h0102030405060708; #10; set = 0; #660 $finish;
    end
    
endmodule
