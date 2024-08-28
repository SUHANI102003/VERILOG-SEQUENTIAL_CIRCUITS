`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 18:28:36
// Design Name: 
// Module Name: T_FF
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


module T_FF(
input T,clk,
input reset_n,
output Q
    );
    
// C2Q == clock to Q
// because of delay of ff )(cumulative delay)
// ignored in FPGA
localparam C2Q_DELAY = 2;  // for simulation only  

reg Q_reg;
wire Q_next;

always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 1'b0;
    else 
        #C2Q_DELAY Q_reg <= Q_next;
end

// next state logic
assign Q_next = T ? ~Q_reg : Q_reg;

// output logic
assign Q = Q_reg;
endmodule
