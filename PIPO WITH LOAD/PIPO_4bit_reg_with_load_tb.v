`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 18:30:03
// Design Name: 
// Module Name: PIPO_4bit_reg_with_load_tb
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


module PIPO_4bit_reg_with_load_tb(

    );
parameter N= 4;
reg [N-1:0] I;
reg clk;
reg load;
wire [N-1:0] Q;
integer i;

PIPO_4bit_reg_with_load DUT (.I(I),.clk(clk),.Q(Q), .load(load));

   
initial
begin
clk = 1'b0;
end

always #10 clk = ~clk;

always @ (posedge clk or negedge clk)
begin
    
  // for (i=0; i<6; i=i+1)
   // begin
      I=$random%16; 
      #20;
   
//end
end

initial begin
load = 1'b1;
#10 load = 1'b0;
#40 load = 1'b1;
#40 load = 1'b0;
#40 load = 1'b1;
end

initial #200 $finish;

endmodule
