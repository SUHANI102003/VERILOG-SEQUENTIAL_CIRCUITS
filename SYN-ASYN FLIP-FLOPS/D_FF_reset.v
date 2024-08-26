`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 14:27:20
// Design Name: 
// Module Name: D_FF_reset
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

 //  ASYNCHRONOUS
 // means do not care what the clock value is
 // the moment reset is asserted the ff should be o/p to 0
 //SYNCHRONOUS
 // care about the clock
module D_FF_reset(
input clk,
input d,
input reset_n, // asynchronous
input clear_n, // synchronous
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

always @(d, clear_n)
begin
    q_next = q_reg;
    if(!clear_n)
        q_next = 1'b0;
    else
        q_next = d; 
end

assign q = q_reg;
endmodule
