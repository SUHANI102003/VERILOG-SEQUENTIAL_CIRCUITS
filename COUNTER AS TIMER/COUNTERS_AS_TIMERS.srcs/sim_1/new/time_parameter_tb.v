`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 23:07:01
// Design Name: 
// Module Name: time_parameter_tb
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


module time_parameter_tb();
localparam MOD = 255;          // Timer of 2.5us(micro sec)
localparam BITS = $clog2(MOD);

reg reset_n;
reg clk;
reg enable;
wire done;

timer_parameter #(.MOD(MOD)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .done(done),
                                      .enable(enable)
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
 
 initial # (MOD * T * 3) $stop;
 
 // a quick reset for 2ns
 initial
 begin
       reset_n = 1'b0;
    #2 reset_n = 1'b1;
     enable = 1'b1;
    
end 
endmodule
