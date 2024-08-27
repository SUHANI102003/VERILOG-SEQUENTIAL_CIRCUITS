`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 00:19:49
// Design Name: 
// Module Name: USR_tb
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


module USR_tb();
    
parameter N = 4;
reg clk;
reg [N-1:0] I;
reg reset_n; //asynchronous
reg [1:0] s;
reg MSB_in, LSB_in;
wire [N-1:0] q; 

integer i;

USR_4bit DUT (.clk(clk),
          .s(s),
          .I(I),
          .q(q),
          .MSB_in(MSB_in),
          .LSB_in(LSB_in),
          .reset_n(reset_n) );
          
initial 
begin
clk = 1'b1;
reset_n = 1'b1;
end

always #10 clk = ~clk;

initial 
begin
    MSB_in = 1'b0;
    #10  MSB_in = 1'b1;
     #50  MSB_in = 1'b0;
      #80  MSB_in = 1'b1;
       #90  MSB_in = 1'b1;
end

initial 
begin
    LSB_in = 1'b1;
    #20  LSB_in = 1'b1;
     #40  LSB_in = 1'b0;
      #90  LSB_in = 1'b1;
       #60  LSB_in = 1'b0;
end

always 
begin
    @(negedge clk);
    reset_n = 1'b0;
    #10  reset_n = 1'b1;
    repeat(2) @ (negedge clk);
    #20 reset_n = 1'b0;
    #5 reset_n = 1'b1;
end

always @(posedge clk , negedge clk)
begin
    for (i=0; i<8; i=i+1)
    begin
    I = $random%15;
    #20;
end
end

initial
begin
    s = 2'b00;
    #20 s = 2'b10;
    #40 s = 2'b11;
    #60 s = 2'b10;
    #30 s = 2'b01;
    #70 s = 2'b00;
    #20 s = 2'b11;
    #40 s = 2'b10;
end

initial
#400 $finish;
endmodule

