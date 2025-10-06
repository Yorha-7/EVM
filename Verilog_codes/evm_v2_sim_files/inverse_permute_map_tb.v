`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 11:06:30
// Design Name: 
// Module Name: inverse_permute_map_tb
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


module inverse_permute_map_tb;

reg [0:63] data_in;
wire [0:63] data_out;
reg set;
wire status;
reg clk;

inverse_permute_map DUT( .data_in(data_in), .clk(clk), .set(set), .status(status), .data_out(data_out));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    data_in = 64'h5e27c71d8913a53a ;set = 1; #10 set = 0; #100 $finish;
end

endmodule