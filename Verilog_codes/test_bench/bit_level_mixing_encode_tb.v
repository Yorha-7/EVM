`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 05:02:46
// Design Name: 
// Module Name: bit_level_mixing_encode_tb
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


module bit_level_mixing_encode_tb;

reg [0:79] data_in;
reg [0:63] final_key;
wire [0:79] data_out;

bit_level_mixing_encode DUT( .data_in(data_in), .data_out(data_out), .final_key(final_key) );

initial begin 
    data_in = 80'h78556327897855632789; final_key = 789456123; #10 $finish;
end

endmodule
