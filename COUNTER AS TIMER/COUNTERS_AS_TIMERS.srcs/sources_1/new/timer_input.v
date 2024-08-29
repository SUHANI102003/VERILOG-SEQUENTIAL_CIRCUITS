`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 23:51:08
// Design Name: 
// Module Name: timer_input
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


module timer_input
# (parameter BITS = 4)
(
    input clk,
    input reset_n,
    input enable,
    input [BITS-1:0] FINAL_VALUE,
   // output [BITS-1:0] Q
   output done
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
assign done = Q_reg == FINAL_VALUE;   

always @(*)
begin
    Q_next = done ? 'b0 : Q_reg + 1;
end


//output logic
//assign Q = Q_reg;
    
    
endmodule
