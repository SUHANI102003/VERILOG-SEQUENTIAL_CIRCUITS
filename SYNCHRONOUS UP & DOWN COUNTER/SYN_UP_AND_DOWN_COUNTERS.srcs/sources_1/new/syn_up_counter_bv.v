`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 22:54:56
// Design Name: 
// Module Name: syn_up_counter_bv
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


module syn_up_counter_bv
#(parameter BITS = 4)(
input clk,reset_n,
output [BITS-1:0] Q
    );
    
reg [BITS-1:0] Q_next, Q_reg;

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
    Q_next = Q_reg + 1;
end


// output logic
assign Q = Q_reg;
endmodule
