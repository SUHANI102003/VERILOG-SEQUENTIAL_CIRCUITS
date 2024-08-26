`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 18:06:15
// Design Name: 
// Module Name: D_latch
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


module D_latch(
input d, en,
output reg q, 
output qbar
    );
// BEHAVIORAL  

 assign qbar = ~q;  
 always @(d,en)
 begin
    q = q;
    if(en)
        q = d;
    else
        q = q;
 end
 
 // DATAFLOW
 /*
 assign q = en ? d : q;
 assign qbar = ~q;  
 */
 

endmodule
