`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 16:22:46
// Design Name: 
// Module Name: ring_counter
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


module ring_counter
# (parameter BITS = 4) (
input clk,
input ORI,    //overriding input
output [BITS-1:0] Q
    );
    
reg [BITS-1:0] Q_reg, Q_next;

// seq logic
always @(posedge clk, negedge ORI)
begin
    if(!ORI)
        Q_reg <= 4'b1000;
    else         
        Q_reg <= Q_next;
end

// next state logic
always @(*)
begin
     Q_next[BITS-1] = Q_reg[0];
     Q_next = {Q_next[BITS-1],Q_reg[BITS-1:1]};
   
end

// output logic

assign Q = Q_reg;

    
endmodule
