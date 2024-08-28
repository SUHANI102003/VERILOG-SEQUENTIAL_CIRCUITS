`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 01:24:42
// Design Name: 
// Module Name: PISO_test
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


module PISO_test();
parameter N = 4;
reg clk;//serial_in;
reg [N-1:0] I;
reg load, reset_n; //asynchronous
wire serial_out;
integer i;

PISO_4bit_shift_reg  DUT (.clk(clk),
                          .I(I),
                          .load(load),
                          .reset_n(reset_n),
                          //.serial_in(serial_in),
                          .serial_out(serial_out)
                          );
          
initial 
begin
clk = 1'b1;
end

always #10 clk = ~clk;

initial
begin
    load = 1'b0;
    #80 load = 1'b1;
    #80 load = 1'b0;
    #80 load = 1'b1;   
    #80 load = 1'b0;
    #20 load = 1'b1;  
end


always @(posedge clk , negedge clk)
begin
    for (i=0; i<8; i=i+1)
    begin
    I = $random%15;
    #100;
end
end

always 
begin
    @(negedge clk);
    reset_n = 1'b1;
    #90  reset_n = 1'b0;
    #20 reset_n = 1'b1;
    #90 reset_n = 1'b0;
end

initial
#400 $finish;

initial
$monitor ($time, " :  load = %b, reset = %b, I = %b, out = %b", load,reset_n,I,serial_out);
endmodule

