`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 12:52:06
// Design Name: 
// Module Name: compare_storage_elm
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


module compare_storage_elm(
input d,clk,
output q_a, q_b, q_c
    );
    
D_FF FF0 (.d(d),
          .clk(clk),
          .q(q_b) );
          
D_FF_neg FF1 (.d(d),
              .clk(clk),
              .q(q_c) );
          
D_latch L0 (.d(d),
          .en(clk),
          .q(q_a) );

endmodule
