`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 20:16:19
// Design Name: 
// Module Name: mod_counter_input_tb
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


module mod_counter_input_tb(

    );
parameter BITS = 4;
reg reset_n;
reg clk;
reg enable;
reg[BITS-1:0] FINAL_VALUE;
wire [BITS-1 :0] Q;

mod_counter_input #(.BITS(BITS)) DUT (
                                      .clk(clk),
                                      .reset_n(reset_n),
                                      .Q(Q),
                                      .enable(enable),
                                      .FINAL_VALUE(FINAL_VALUE)
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
    
    FINAL_VALUE = 'D5;
    
     repeat(FINAL_VALUE + 3) @(negedge clk);
     FINAL_VALUE = 'D7;
     
     repeat(FINAL_VALUE + 3) @(negedge clk);
     FINAL_VALUE = 'D11;
     
     repeat(FINAL_VALUE + 3) @(negedge clk);
     #20 $stop;
end 

endmodule
