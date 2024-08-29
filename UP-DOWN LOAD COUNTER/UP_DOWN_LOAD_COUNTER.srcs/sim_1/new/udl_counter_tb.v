`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 15:57:52
// Design Name: 
// Module Name: udl_counter_tb
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


module udl_counter_tb();
parameter BITS = 5;
reg reset_n;
reg clk;
reg up;
reg enable;
reg load;
reg [BITS-1:0] D;
wire [BITS-1 :0] Q;

udl_counter #(.BITS(BITS)) DUT (      .D(D),
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .Q(Q),
                                      .up(up),
                                      .enable(enable),
                                      .load(load)
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
       enable = 1'b0;
       up = 1'b1;
       load = 1'b0;
    #2 reset_n = 1'b1;
    
    repeat(2) @(negedge clk);
    enable = 1'b1;
    
    wait (Q == 15)  // wait till final value reaches 15
    enable = 1'b0;   // then stop the enable
    
    repeat(2) @(negedge clk);
    up = 1'b0;
    enable = 1'b1;
    
    repeat(2) @(negedge clk);
    D=9;
    load = 1'b1;
    
    @(negedge clk);
    load = 1'b0;
    
    wait(Q==2)
    D = 7;
    load = 1'b1;
    
    repeat(2) @(negedge clk);
    load = 1'b0;
    
    repeat(5) @(negedge clk);
    D = 11;
    up = 1'b1;
    load = 1'b1;
    
    repeat(2) @(negedge clk);
    load = 1'b0;
end 

endmodule
