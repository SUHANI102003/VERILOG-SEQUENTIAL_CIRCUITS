`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 16:23:05
// Design Name: 
// Module Name: ring_counter_tb
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


module ring_counter_tb();
parameter BITS = 4;
reg ORI;
reg clk;
wire [BITS-1 :0] Q;

ring_counter #(.BITS(BITS)) DUT (
                                      .clk(clk),
                                      .ORI(ORI),
                                      .Q(Q)
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
       ORI = 1'b1;
    #2 ORI = 1'b0;
    #2 ORI = 1'b1;
       
 end
 

endmodule
