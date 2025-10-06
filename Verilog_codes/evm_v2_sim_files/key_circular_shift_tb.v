`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 19:52:04
// Design Name: 
// Module Name: key_circular_shift_tb
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


module key_circular_shift_tb;

reg clk,set;
wire status;
reg [0:63] data_in;
wire [0:63] data_out;

key_circular_shift DUT( .key_in(data_in), .clk(clk), .set(set), .status(status), .key_out(data_out));

initial clk = 0;

always #5 clk = ~clk;

always @(posedge clk) begin
    data_in = 64'h0123456789abcdef; set = 1; #10 set = 0; #30 $finish;
end

endmodule
