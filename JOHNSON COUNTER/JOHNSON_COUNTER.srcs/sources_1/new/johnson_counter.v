`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 15:33:01
// Design Name: 
// Module Name: johnson_counter
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


module johnson_counter
# (parameter BITS = 4) (
input clk,
input reset_n,
output [BITS-1:0] Q
    );
    
reg [BITS-1:0] Q_reg, Q_next;

// seq logic
always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 1'b0;
    else         
        Q_reg <= Q_next;
end

// next state logic
always @(Q_reg)
begin
     Q_next[BITS-1] = ~Q_reg[0];
     Q_next = {Q_next[BITS-1],Q_reg[BITS-1:1]};
   
end

// output logic

assign Q = Q_reg;

endmodule
