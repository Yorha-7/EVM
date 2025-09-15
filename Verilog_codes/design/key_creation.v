`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2025 08:13:45
// Design Name: 
// Module Name: key_creation
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


module key_creation(
    input [0:63] master_key,
    input [0:63] baby_key,
    output [0:63] final_key
    );
    
    assign final_key[0:7] = (master_key[0:7] > baby_key[0:7])? master_key[0:7]:baby_key[0:7];
    assign final_key[8:15] = (master_key[8:15] > baby_key[8:15])? master_key[8:15]:baby_key[8:15];
    assign final_key[16:23] = (master_key[16:23] > baby_key[16:23])? master_key[16:23]:baby_key[16:23];
    assign final_key[24:31] = (master_key[24:31] > baby_key[24:31])? master_key[24:31]:baby_key[24:31];
    assign final_key[32:39] = (master_key[32:39] > baby_key[32:39])? master_key[32:39]:baby_key[32:39];
    assign final_key[40:47] = (master_key[40:47] > baby_key[40:47])? master_key[40:47]:baby_key[40:47];
    assign final_key[48:55] = (master_key[48:55] > baby_key[48:55])? master_key[48:55]:baby_key[48:55];
    assign final_key[56:63] = (master_key[56:63] > baby_key[56:63])? master_key[56:63]:baby_key[56:63];
    
endmodule
