`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 19:59:23
// Design Name: 
// Module Name: mod_counter_input
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

// This module can be used to make different mod counters
// like MOD-3, MOD-6, MOD-5 
// --> 0,1,2,3,1,2,3,4,5,6,1,2,3,4,5
//// remember to change the number of bits required to make that counter


module mod_counter_input
# (parameter BITS = 4)
(
    input clk,
    input reset_n,
    input enable,
    input [BITS-1:0] FINAL_VALUE,
    output [BITS-1:0] Q
    );

reg [BITS-1:0] Q_reg, Q_next;
wire done;  // this tells me when the conting is done
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
assign Q = Q_reg;
    
endmodule
