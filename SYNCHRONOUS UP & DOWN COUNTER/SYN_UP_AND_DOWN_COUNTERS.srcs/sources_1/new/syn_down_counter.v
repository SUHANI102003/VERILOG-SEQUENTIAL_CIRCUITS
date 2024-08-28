`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 20:54:28
// Design Name: 
// Module Name: syn_down_counter
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


module syn_down_counter(
input clk,
input reset_n,
output [3:0] Q
    );
wire q0_next, q1_next;
// STRUCTURAL MODEL
T_FF FF1 (
        .clk(clk),
        .reset_n(reset_n),
        .T(1'b1),
        .Q(Q[0])
        );

T_FF FF2 (
        .clk(clk),
        .reset_n(reset_n),
        .T(~Q[0]),
        .Q(Q[1])
        );

assign q0_next = ~Q[0] & ~Q[1];    
T_FF FF3 (
         .clk(clk),
        .reset_n(reset_n),
        .T(q0_next),
        .Q(Q[2])
        );
 
assign q1_next =  ~Q[0] & ~Q[1] & ~Q[2];       
T_FF FF4 (
        .clk(clk),
        .reset_n(reset_n),
        .T(q1_next),
        .Q(Q[3])
        );
      
    
endmodule
