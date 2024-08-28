`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 01:07:43
// Design Name: 
// Module Name: PISO_4bit_shift_reg
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


module PISO_4bit_shift_reg
#(parameter N = 4)(
input [N-1:0] I,
input clk,
input reset_n,
input load,//serial_in,
output serial_out
    );
    
reg [N-1:0] Q_reg, Q_next;

// sequential logic
always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 1'b0;
    else
         Q_reg <= Q_next; 
end

// combinational logic 'or' next state logic
always @(I,load,Q_reg)
begin
    Q_next = Q_reg; // default
    if (!load)
        Q_next = I;
    else
        Q_next = {I[N-1], Q_reg[N-1:1]};
end

//assign serial_in = I[N-1];
// output logic
assign serial_out = Q_reg[0];   
endmodule
