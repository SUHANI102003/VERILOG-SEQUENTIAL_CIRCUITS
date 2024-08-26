`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 18:45:34
// Design Name: 
// Module Name: D_latch_TB
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


module D_latch_TB(

    );
reg d,en;
wire q , qbar;

D_latch dut (.en(en), .d(d), .q(q), .qbar(qbar));

initial #40 $finish;

initial 
begin
    en = 1'B0; 
#10 d = 1'B0; en = 1'B1;
#10 d = 1'B1; en = 1'B1;
end
//display on console
initial
$monitor ($time, " D = %B, Q = %B, QBAR = %B,", d,q,qbar);
endmodule
