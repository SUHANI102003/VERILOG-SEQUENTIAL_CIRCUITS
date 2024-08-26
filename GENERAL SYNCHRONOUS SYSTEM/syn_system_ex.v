`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 14:03:58
// Design Name: 
// Module Name: syn_system_ex
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

// Define every block in different always block
module syn_system_ex(
input a,b,c,
input clk,
//output f,g
output reg f,g
    );
/*    
reg f_next, f_reg, g_next, g_reg;

// register/memory element
always @(posedge clk)
begin
  f_reg <= f_next; 
  g_reg <= g_next;  
end

// Next state logic (combinational)
always @(*)
begin
   f_next = a & ~g_reg;
   g_next = b|c; 
end

//output logic
assign f = f_reg;
assign g = g_reg;
*/

// A concise way of writing the above code
reg ag,bc;
always @(posedge clk)
begin
    ag = a & ~g; 
    f <= ag;
    
    bc = b|c;
    g <= bc;
end
// We got 2 extra registers 
// WHY??
// bc we used non - blocking assignment 
// it created extra register to store values of ag & bc that is to be assigned later.
// so use blocking assn for combinational ckt.
endmodule
