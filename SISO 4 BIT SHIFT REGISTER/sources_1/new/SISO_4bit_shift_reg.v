`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 19:47:34
// Design Name: 
// Module Name: SISO_4bit_shift_reg
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


module SISO_4bit_shift_reg
#(parameter N=4)(
input clk,
input serial_in,
//output [N-1:0] q, // if we care about the content of each ff
output serial_out
    );
 // STRUCTURAL MODELLING
 /*
 wire [N:0] c;   
 assign c[N] = serial_out;
 assign c[0] = serial_in;
 
 genvar k;
 generate 
 begin
    for (k=0; k<N; k=k+1)
    begin : DFF
        D_FF FF (.d(c[k]),
                 .q(c[k+1]),
                 .clk(clk));
    end
 end
 
 endgenerate
 */
 //*************************************************
 // BEHAVIORAL MODELLING
 
 reg [N-1:0] q_reg, q_next;
 
 // sequential logic
 always @ (posedge clk)
 begin
    q_reg <= q_next;
 end
 
  // next state logic
  always @(serial_in, q_reg)
  begin
  // Right shift
    q_next = {serial_in, q_reg[N-1:1]};
  end
  
  // left shift
//  q_next = {q_reg[N-2:0], serial_in};

  // output logic
  assign serial_out = q_reg[0];
  //assign q = q_reg;
  
endmodule
