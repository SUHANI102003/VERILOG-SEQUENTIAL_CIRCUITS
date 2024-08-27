`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 23:09:04
// Design Name: 
// Module Name: PASR_tb
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


module PASR_tb();
parameter N = 4;
reg clk,serial_in;
reg [N-1:0] I;
reg load, reset_n; //asynchronous
wire [N-1:0] q; // if we care about the content of each ff
wire serial_out;
integer i;

PASR DUT (.clk(clk),
          .serial_in(serial_in),
          .I(I),
          .load(load),
          .q(q),
          .serial_out(serial_out),
          .reset_n(reset_n) );
          
initial 
begin
clk = 1'b1;
reset_n = 1'b1;
end

always #10 clk = ~clk;

initial
begin
    load = 1'b0;
    #70 load = 1'b1;
     #70 load = 1'b0;
      #80 load = 1'b1;     
end

initial 
begin
    serial_in = 1'b0;
    #10  serial_in = 1'b1;
     #20  serial_in = 1'b0;
      #10  serial_in = 1'b1;
       #10  serial_in = 1'b1;
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
#400 $finish;
endmodule
