`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 15:25:26
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb(

    );
parameter BITS = 4;
reg reset_n;
reg clk;
reg up;
reg enable;
wire [BITS-1 :0] Q;

up_down_counter #(.BITS(BITS)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .Q(Q),
                                      .up(up),
                                      .enable(enable)
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
       enable = 1'b0;
       up = 1'b1;
    #2 reset_n = 1'b1;
    
    repeat(2) @(negedge clk);
    enable = 1'b1;
    
    wait (Q == 15)  // wait till final value reaches 15
    enable = 1'b0;   // then stop the enable
    
    repeat(2) @(negedge clk);
    up = 1'b0;
    enable = 1'b1;
end 

endmodule
