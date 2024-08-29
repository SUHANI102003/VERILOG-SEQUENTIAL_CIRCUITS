`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 19:36:29
// Design Name: 
// Module Name: mod_counter_hardwired_tb
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
// We mentioned 4 bits in tb that means it should count till 15; 
//but since we wrote the code to stop at count 7 it will not count to 15
// That is why called hardcoded.

module mod_counter_hardwired_tb();

localparam MOD = 11;
localparam BITS = $clog2(MOD);

reg reset_n;
reg clk;
reg enable;
wire [BITS-1 :0] Q;

mod_counter_hardcoded #(.MOD(MOD)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .Q(Q),
                                      .enable(enable)
                                     );
// timer                     
initial 
    #300 $stop;
    
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
    #2 enable = 1'b1;
    
    repeat(MOD + 3)@(negedge clk);
    #20 $stop;
end 

endmodule
