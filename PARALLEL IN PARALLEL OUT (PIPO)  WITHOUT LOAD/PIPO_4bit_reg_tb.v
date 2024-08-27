`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 22:50:29
// Design Name: 
// Module Name: PIPO_4bit_reg_tb
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


module PIPO_4bit_reg_tb();
parameter N= 4;
reg [N-1:0] I;
reg clk;
wire [N-1:0] Q;
integer i;

PIPO_4bit_reg DUT (I,clk,Q);




initial
begin
clk = 1'b0;
end

always #10 clk = ~clk;

always @ (posedge clk or negedge clk)
begin
    
   for (i=0; i<6; i=i+1)
    begin
      I=$random%10; 
      #20;
     $display("I =  %d",I);    
   
end
end


endmodule
