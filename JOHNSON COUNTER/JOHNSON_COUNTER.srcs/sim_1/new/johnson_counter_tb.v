`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 15:42:31
// Design Name: 
// Module Name: johnson_counter_tb
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


module johnson_counter_tb();
parameter BITS = 4;
reg reset_n;
reg clk;
wire [BITS-1 :0] Q;

johnson_counter #(.BITS(BITS)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .Q(Q)
                                     );
// timer                     
initial 
    #500 $stop;
    
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
