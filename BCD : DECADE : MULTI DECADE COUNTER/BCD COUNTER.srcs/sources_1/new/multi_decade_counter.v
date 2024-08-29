`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2024 21:33:29
// Design Name: 
// Module Name: multi_decade_counter
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

// counts from 000 to 999

module multi_decade_counter(
input clk, reset_n,enable,
output done,                  // to cascade it even more
output [3:0] ones, tens, hundreds
    );
    
wire done0, done1, done2;
wire a0, a1, a2;

bcd_counter bc0 (.clk(clk),
                 .reset_n(reset_n),
                 .enable(enable),
                 .done(done0),
                 .Q(ones)
                    );

assign a0 = done0 & enable;                    
bcd_counter bc1 (.clk(clk),
                 .reset_n(reset_n),
                 .enable(a0),
                 .done(done1),
                 .Q(tens)
                    );
 
 assign a1 = done1 & a0;                   
bcd_counter bc2 (.clk(clk),
                 .reset_n(reset_n),
                 .enable(a1),
                 .done(done2),
                 .Q(hundreds)
                    );
                    
assign a2 = done2 & a1;

assign done = a2;
                    
endmodule
