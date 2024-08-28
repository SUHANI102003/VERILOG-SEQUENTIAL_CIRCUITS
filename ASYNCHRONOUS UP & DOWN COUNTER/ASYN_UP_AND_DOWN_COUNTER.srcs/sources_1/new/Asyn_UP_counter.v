`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 19:09:00
// Design Name: 
// Module Name: Asyn_UP_counter
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


module Asyn_UP_counter(
input clk,
input reset_n,
output [3:0] Q
    );
   // STRUCTURAL MODEL 
T_FF FF1 (
        .clk(clk),
        .reset_n(reset_n),
        .T(1'b1),
        .Q(Q[0])
        );
      
T_FF FF2 (
        .clk(~Q[0]),
        .reset_n(reset_n),
        .T(1'b1),
        .Q(Q[1])
        );
      
T_FF FF3 (
         .clk(~Q[1]),
        .reset_n(reset_n),
        .T(1'b1),
        .Q(Q[2])
        );
      
T_FF FF4 (
        .clk(~Q[2]),
        .reset_n(reset_n),
        .T(1'b1),
        .Q(Q[3])
        );
      
endmodule
