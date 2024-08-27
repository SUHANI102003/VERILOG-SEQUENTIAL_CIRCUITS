`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 23:51:30
// Design Name: 
// Module Name: USR_4bit
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


module USR_4bit
#(parameter N = 4)(
input [N-1:0] I,  // parallel in
input clk,reset_n,
input MSB_in, LSB_in,  // right & left shift
input [1:0] s,  // control input
output [N-1:0] q   // parallel out
    );
    
reg [N-1:0] q_reg, q_next;

// sequential logic
always @(posedge clk , negedge reset_n)
begin
    if(!reset_n)
        q_reg <= 0;
    else
         q_reg <= q_next; 
end

//  next state logic
always @(*)
begin
        q_next = q_reg;  // default value
        case(s)
        2'b00 : q_next = q_reg;
        2'b01 : q_next = {MSB_in, q_reg[N-1:1]};
        2'b10 : q_next = {q_reg[N-2:0], LSB_in};
        2'b11 : q_next = I;
        default : q_next = q_reg;
        endcase
end

// output logic
assign q = q_reg;
 
endmodule
