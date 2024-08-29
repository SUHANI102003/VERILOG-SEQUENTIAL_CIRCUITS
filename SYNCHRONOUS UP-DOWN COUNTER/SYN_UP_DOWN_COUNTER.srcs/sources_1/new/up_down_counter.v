`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 15:14:06
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter
# (parameter BITS = 4) (
input clk,
input reset_n,
input enable,
input up,     // when asserted the counter is up counter; otherwise dowm counter
output [BITS-1:0] Q
    );
    
reg [BITS-1:0] Q_reg, Q_next;

// seq logic
always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 1'b0;
    else if(enable)          // if enable then change the value(synchronous)
        Q_reg <= Q_next;
    else 
        Q_reg <= Q_reg;
end

// next state logic
always @(Q_reg,up)
begin
    Q_next = Q_reg;
    if(up)
        Q_next = Q_reg + 1;
    else
         Q_next = Q_reg - 1;
end

// output logic

assign Q = Q_reg;
endmodule
