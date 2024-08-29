`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 23:54:06
// Design Name: 
// Module Name: timer_input_tb
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


module timer_input_tb(

    );
localparam BITS = 16;
reg reset_n;
reg clk;
reg enable;
reg[BITS-1:0] FINAL_VALUE;
wire done;

timer_input #(.BITS(BITS)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .done(done),
                                      .enable(enable),
                                      .FINAL_VALUE(FINAL_VALUE)
                                     );
// timer                     
//initial 
   // #300 $stop;
    
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
       enable = 1'b1;
    
       FINAL_VALUE = 255;     //timer of 2.56us
    
       #(FINAL_VALUE * T * 3);
       FINAL_VALUE = 49_999;     // 500us
     
    
       #(FINAL_VALUE * T * 2);
       $stop;
      
      
     end
     
endmodule
