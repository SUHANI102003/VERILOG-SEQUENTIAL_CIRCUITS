`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 16:22:08
// Design Name: 
// Module Name: D_FF_set_reset
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


module D_FF_set_reset(
input clk,
input d,
input reset_n, // asynchronous
input set_n, // synchronous
output q
    );
  
reg q_reg, q_next; 

always@(negedge clk, negedge reset_n)
begin
    q_reg <= q_reg;
    if(!reset_n)
        q_reg <= 1'b0;
    else
        q_reg <= q_next;
end

always @(d,set_n)
begin
    q_next = q_reg;
    if(!set_n)
        q_next = 1'b1;
    else
        q_next = d; 
end

assign q = q_reg;
endmodule
