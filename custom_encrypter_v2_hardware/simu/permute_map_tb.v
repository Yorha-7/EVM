`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 19:39:48
// Design Name: 
// Module Name: permute_map_tb
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


module permute_map_tb;

reg [0:63] data_in;
wire [0:63] data_out;
reg set;
wire status;
reg clk;

permute_map DUT( .data_in(data_in), .clk(clk), .set(set), .status(status), .data_out(data_out));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    data_in = 64'h0123456789abcdef ;set = 1; #10 set = 0; #100 $finish;
end

endmodule
