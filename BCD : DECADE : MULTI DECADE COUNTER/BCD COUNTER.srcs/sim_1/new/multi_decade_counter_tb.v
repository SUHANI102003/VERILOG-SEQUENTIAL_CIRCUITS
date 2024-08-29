`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 22:20:49
// Design Name: 
// Module Name: multi_decade_counter_tb
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


module multi_decade_counter_tb();
reg clk, reset_n,enable;
wire done;                  
wire [3:0] ones, tens, hundreds;

multi_decade_counter DUT (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds)
  );
  
                                      
// timer                     
//initial 
   // #300 $stop;
    
 // generate clk signal
 localparam T = 4;
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
    
    repeat(115)@(negedge clk);
    #20 $stop;
end  
endmodule
