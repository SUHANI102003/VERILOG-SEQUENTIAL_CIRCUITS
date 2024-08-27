`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 21:59:43
// Design Name: 
// Module Name: PIPO_4bit_reg
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


module PIPO_4bit_reg
#(parameter N = 4)(
input [N-1:0] I,
input clk,
output [N-1:0] Q
    );
//STRUCTURAL 
/*    
genvar k;
generate

    for (k=0; k<N; k=k+1)
    begin : D_FF
        D_FF_reset (.clk(clk),
                    .d(I[k]),
                    .q(Q[k]),
                    .reset_n(),
                    .clear_n());
    end
endgenerate
*/
reg [N-1:0] Q_reg, Q_next;

always @(posedge clk)
begin
   Q_reg <= Q_next; 
end

always @(I)
begin
    Q_next = I;
end

assign Q = Q_reg;
endmodule

/*This register is not very useful as it cannot hold any of its data.
So if we change the data , the output will change.
So, we can modify this circuit so that it either holds the older value or loads 
the new value regardless of what happens to the input.
*/
