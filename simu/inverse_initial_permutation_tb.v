`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 20:33:27
// Design Name: 
// Module Name: inverse_initial_permutation_tb
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


module inverse_initial_permutation_tb;
reg [0:63] data_in;
wire [0:63] data_out;
reg clk,set;
wire status;
inverse_initial_permutation DUT( .data_in(data_in), .clk(clk), .set(set), .status(status), .data_out(data_out));

initial clk = 0;
always #5 clk = ~clk;

initial begin 
    set = 1; data_in = 64'h6332af83b4aeb468; #10; set = 0; #40 $finish; 
end

endmodule
