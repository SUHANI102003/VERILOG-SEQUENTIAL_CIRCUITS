`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 15:48:43
// Design Name: 
// Module Name: udl_counter
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

//when up is asserted it is up counter ; otherwise down counter
module udl_counter
#(parameter BITS = 4)(
    input clk,reset_n,up,enable,load,
    output [BITS-1:0] Q,
    input [BITS-1:0] D  // to be loaded
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
always @(*)
begin
    Q_next = Q_reg;
   casex({load,up})
        2'b00 : Q_next = Q_reg - 1;
        2'b01 : Q_next = Q_reg + 1;
        2'b1x : Q_next = D;             // load at 10 or 11
        default :  Q_next = Q_reg;
   endcase
end

// output logic

assign Q = Q_reg;
endmodule
