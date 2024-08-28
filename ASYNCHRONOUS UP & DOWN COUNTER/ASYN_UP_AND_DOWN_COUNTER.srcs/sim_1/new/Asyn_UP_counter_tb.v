`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 19:17:10
// Design Name: 
// Module Name: Asyn_UP_counter_tb
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


module Asyn_UP_counter_tb();
reg reset_n;
reg clk;
wire [3:0] Q;

Asyn_UP_counter DUT (.clk(clk),
                     .reset_n(reset_n),
                     .Q(Q)
                     );
// timer                     
initial 
    #200 $stop;
    
 // generate clk signal
 localparam T = 10;
 always
 begin
    clk = 1'b0;
    #(T/2);
     clk = 1'b1;
    #(T/2); 
 end   
 
 // a quick reset for 2ns
 initial
 begin
       reset_n = 1'b0;
    #2 reset_n = 1'b1;
 end
 
endmodule