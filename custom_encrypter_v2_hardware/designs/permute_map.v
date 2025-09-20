`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 19:17:10
// Design Name: 
// Module Name: permute_map
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


module permute_map(
    input wire [0:63] data_in,
    input clk,
    input set,
    output reg status,
    output reg [0:63] data_out
    );
    
    localparam [0:511] map = {8'd43,8'd25,8'd19,8'd29,8'd53,8'd36,8'd58,8'd51,
                         8'd41,8'd34,8'd60,8'd3,8'd6,8'd32,8'd57,8'd61,
                         8'd48,8'd52,8'd18,8'd38,8'd45,8'd14,8'd31,8'd55,
                         8'd16,8'd9,8'd0,8'd44,8'd49,8'd42,8'd54,8'd30,
                         8'd23,8'd20,8'd4,8'd12,8'd21,8'd37,8'd59,8'd40,
                         8'd35,8'd2,8'd27,8'd17,8'd11,8'd50,8'd62,8'd56,
                         8'd47,8'd13,8'd7,8'd1,8'd22,8'd26,8'd33,8'd10,
                         8'd5,8'd28,8'd15,8'd46,8'd63,8'd8,8'd39,8'd24
                         };
        integer i;
        initial begin status <= 0; data_out <= 0; end     
        always @(posedge clk) begin
            if (set) begin 
                status <= 1'b0;
                data_out <= 0; 
            end
            if (~set && ~status) begin
                for(i = 0; i < 64; i = i + 1) begin
                    data_out[i] = data_in[map[8*i +: 8]];
                end
                status <= 1;
            end
        end
endmodule
