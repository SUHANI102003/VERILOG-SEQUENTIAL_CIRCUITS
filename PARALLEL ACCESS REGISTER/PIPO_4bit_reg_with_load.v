`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 18:14:41
// Design Name: 
// Module Name: PIPO_4bit_reg_with_load
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

//BEHAVIOUR::   If load = 1 , you load the new input values
//              If load = 0 , your loaded value is put it back again at input              
//  ex : you load 1 in one flip flop when LOAD is set to 1
//  now your flip flop has 1 stored in it and output will be 1 (d flip flop)
// now put LOAD = 0, your output value (let's say 1) will be put again at input through feedback 
// So, now your input value is being stored.                          

module PIPO_4bit_reg_with_load
#(parameter N = 4)(
input [N-1:0] I,
input clk,
input load,
output [N-1:0] Q
    );
    
reg [N-1:0] Q_reg, Q_next;

// sequential logic
always @(posedge clk)
begin
   Q_reg <= Q_next; 
end

// combinational logic 'or' next state logic
always @(load, I)
begin
    if (load)
        Q_next = I;
    else
        Q_next = Q_reg;
end

// output logic
assign Q = Q_reg;

endmodule
