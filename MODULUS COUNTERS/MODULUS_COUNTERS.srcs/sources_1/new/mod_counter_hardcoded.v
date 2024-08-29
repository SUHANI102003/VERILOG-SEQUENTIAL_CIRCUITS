`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 19:29:24
// Design Name: 
// Module Name: mod_counter_hardcoded
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


// ---------INFO-----------
//You can change the number of MOD to get the desired mod counter
// remember to change the number of bits required to make that counter
// no. of bits required is calculated by log(2)(mod value)
// if you want to make mod 16 counter then no. of bits is 5
//---------------------------------------------------------------------------

module mod_counter_hardcoded
# (parameter MOD = 3)
(
    input clk,
    input reset_n,
    input enable,
    output [BITS-1:0] Q
    );
localparam BITS = $clog2(MOD);
    
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
assign done = Q_reg == MOD;   // conting done when 9 occurs

always @(*)
begin
    Q_next = done ? 'b0 : Q_reg + 1;
end


//output logic
assign Q = Q_reg;

endmodule

// NOTE::
// This hardcoded module is not very useful ;
//unless we want a very specific mod counter like BCD counter
//So, we can input the final value in a different ways
//(go to other module in this project)