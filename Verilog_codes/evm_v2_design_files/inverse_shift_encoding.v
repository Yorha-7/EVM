`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 10:38:29
// Design Name: 
// Module Name: inverse_shift_encoding
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

module inverse_shift_encoding (
    input  wire [0:63] data_in,   // 8 characters (bytes)
    input  wire [0:63] key,       // 8 characters (bytes)
    input  wire clk,
    input  wire set,
    output reg status,
    output reg [0:63] data_out    // permuted characters
);

    integer i;
    reg [2:0] start;
    reg [2:0] idx;
    localparam PRIME = 7;
    
    initial begin data_out <= 0; status <= 1'b0; end
    
    always @(posedge clk) begin
        if (set) begin
            start   <= 3'd0;
            data_out <= 64'd0;
            status  <= 1'b0;
        end else if (~status) begin
            start = 3'd0;
            for (i = 0; i < 8; i = i + 1) begin
                start = start + key[i*8 +: 8];
            end
            start = start % 8;

            for (i = 0; i < 8; i = i + 1) begin
                idx = (start + i*PRIME) % 8;
                data_out[i*8 +: 8] <= data_in[idx*8 +: 8];
            end
            status <= 1'b1; 
        end
    end

endmodule
