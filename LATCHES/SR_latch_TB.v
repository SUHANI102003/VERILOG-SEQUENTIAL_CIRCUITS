`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 18:33:21
// Design Name: 
// Module Name: SR_latch_TB
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


module SR_latch_TB(

    );
reg S,R;
wire q , qbar;

SR_latch dut (.S(S), .R(R), .q(q), .qbar(qbar));

initial #60 $finish;

initial 
begin
    S = 1'B1; R = 1'B0;
#10 S = 1'B1; R = 1'B1;
#10 S = 1'B0; R = 1'B1;
#10 S = 1'B1; R = 1'B1;
#10 S = 1'B0; R = 1'B0;
end

initial
$monitor ($time, " S = %B, R = %B, Q = %B, QBAR = %B,", S,R,q,qbar);
endmodule
