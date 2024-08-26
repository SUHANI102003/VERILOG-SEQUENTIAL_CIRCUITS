`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 18:22:22
// Design Name: 
// Module Name: SR_latch
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


module SR_latch(
    input S,R,
    output q,qbar
    );
    
assign q = ~(S & qbar);
assign qbar = ~(R & q);


endmodule
