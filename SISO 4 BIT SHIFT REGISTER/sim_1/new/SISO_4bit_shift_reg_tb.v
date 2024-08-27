`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 21:13:16
// Design Name: 
// Module Name: SISO_4bit_shift_reg_tb
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


module SISO_4bit_shift_reg_tb(

    );
parameter N=4;
reg clk;
reg serial_in;
wire serial_out;

SISO_4bit_shift_reg DUT (.clk(clk), .serial_in(serial_in), .serial_out(serial_out));

initial clk = 1'b1;

always #5 clk = ~clk;

initial
    begin
        
    #11 serial_in=1;    // t=11
    #10 serial_in=0;    // t=21
    #40 serial_in=1;    // t=61
    #10 serial_in=0;    // t=71
    #10 serial_in=1;    // T=81
    #10 serial_in=0;    // T=91
  end      
  
 initial
   #200 $finish;
   
endmodule
