`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 17:59:47
// Design Name: 
// Module Name: BRAM_PUF
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
module BRAM_PUF (
    input clk,
    input [7:0] challenge,
    input start,
    output [2:0] LED
);
    (* keep = "true" *)parameter N = 128;
    (* keep = "true" *)reg [N:0] stage0,stage1;
    (* keep = "true" *)reg [2:0] led_temp;
    (* keep = "true" *)integer i;
    (* keep = "true" *)wire response,err;
    (* keep = "true" *)arbitar DUT( .signal0(stage0[N]), .signal1(stage1[N]), .out(response), .err(err) );
    always @(posedge clk) begin
        if(start) begin
            stage0 <= 1'b1;
            stage1 <= 1'b1;
            for(i = 0; i < N; i = i + 1) begin
                if (challenge[i] == 1'b0) begin
                    stage0[i+1] <= stage0[i];
                    stage1[i+1] <= stage1[i];
                end else begin
                    stage0[i+1] <= stage1[i];
                    stage1[i+1] <= stage0[i];
                end
            end 
            
            (* keep = "true" *)if(response)begin led_temp[0] <= 1'b1;
                led_temp[1] <= 1'b0;
            end
            (* keep = "true" *)if(~response)begin led_temp[1] <= 1'b1;
                led_temp[0] <= 1'b0;
            end
            (* keep = "true" *)if (err) led_temp[2] <= 1'b1;
            else led_temp[2] <= 1'b0;      
        end         
    end
    assign LED = led_temp;
endmodule
