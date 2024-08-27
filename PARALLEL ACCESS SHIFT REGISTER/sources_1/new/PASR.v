`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 22:42:08
// Design Name: 
// Module Name: PASR
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
//load = 0 ==> shift
//load = 1 ==> load input

module PASR
#(parameter N = 4)(
input clk,
input serial_in,
input [N-1:0] I,
input load,
input reset_n, //asynchronous
output [N-1:0] q, // if we care about the content of each ff
output serial_out
    );
    
 // BEHAVIORAL MODELLING
 
 reg [N-1:0] q_reg, q_next;
 
 // sequential logic
 always @ (posedge clk , negedge reset_n)
 begin
    if(!reset_n)
        q_reg <= 1'b0;
    else
        q_reg <= q_next;
 end
 
  // next state logic
  always @(serial_in, q_reg)
  begin
    if(load)
        q_next = I;
    else
  // Right shift
    q_next = {serial_in, q_reg[N-1:1]};
  end
  

  // output logic
  assign serial_out = q_reg[0];
  assign q = q_reg;
  
endmodule
