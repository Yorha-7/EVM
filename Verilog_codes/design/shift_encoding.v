`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2025 08:27:11
// Design Name: 
// Module Name: shift_encoding
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
module shift_encoding(
    input  [0:79] data_in,
    input  [0:63] final_key,
    output [0:79] data_out
);

    wire [3:0] start;
    assign start = (final_key[0:7]   + final_key[8:15]  + 
                    final_key[16:23] + final_key[24:31] + 
                    final_key[32:39] + final_key[40:47] + 
                    final_key[48:55] + final_key[56:63]) % 10;

    wire [7:0] raw_step = final_key[0:7];
    wire [7:0] step_odd  = (raw_step[0] == 1'b0) ? raw_step + 1 : raw_step; 
    wire [7:0] step      = (step_odd % 5 == 0) ? step_odd + 2 : step_odd;  

    wire [0:7] bytes_in[0:9];
    genvar i;
    generate
        for (i=0; i<10; i=i+1) begin
            assign bytes_in[i] = data_in[8*i +: 8]; 
        end
    endgenerate

    wire [3:0] idx[0:9];
    genvar j;
    generate
        for (j=0; j<10; j=j+1) begin 
            wire [7:0] tmp = start + j*step;
            assign idx[j] = tmp % 10;  
        end
    endgenerate

    reg [0:79] data_out_reg;
    integer k;
    always @(*) begin
        data_out_reg = 80'b0;
        for (k=0; k<10; k=k+1) begin
            case(idx[k])
                0: data_out_reg[0:7]    = bytes_in[k];
                1: data_out_reg[8:15]   = bytes_in[k];
                2: data_out_reg[16:23]  = bytes_in[k];
                3: data_out_reg[24:31]  = bytes_in[k];
                4: data_out_reg[32:39]  = bytes_in[k];
                5: data_out_reg[40:47]  = bytes_in[k];
                6: data_out_reg[48:55]  = bytes_in[k];
                7: data_out_reg[56:63]  = bytes_in[k];
                8: data_out_reg[64:71]  = bytes_in[k];
                9: data_out_reg[72:79]  = bytes_in[k];
            endcase
        end
    end

    assign data_out = data_out_reg;

endmodule
