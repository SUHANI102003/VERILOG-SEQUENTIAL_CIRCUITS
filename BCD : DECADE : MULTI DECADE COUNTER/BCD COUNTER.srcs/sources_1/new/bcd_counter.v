`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 21:27:17
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
input clk, reset_n,enable,
output done,
output [3:0] Q
    );
    
reg [3:0] Q_reg, Q_next;

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
assign done = Q_reg == 9;   // conting done when 9 occurs

always @(*)
begin
    Q_next = done ? 'b0 : Q_reg + 1;
end


//output logic
assign Q = Q_reg;

endmodule
