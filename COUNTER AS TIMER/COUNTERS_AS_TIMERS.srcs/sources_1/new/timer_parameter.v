`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 22:54:06
// Design Name: 
// Module Name: timer_parameter
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

// counts 0 to 255----MOD 256 counter
// in timer we don't (majority times)care about the actual count number 
// constructed using modulus counter but don't care about content of the counter

module timer_parameter
# (parameter MOD = 255)
(
    input clk,
    input reset_n,
    input enable,
    //output [BITS-1:0] Q
    output done
    );
localparam BITS = $clog2(MOD);
    
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
assign done = Q_reg == MOD;   

always @(*)
begin
    Q_next = done ? 'b0 : Q_reg + 1;
end

    
endmodule
