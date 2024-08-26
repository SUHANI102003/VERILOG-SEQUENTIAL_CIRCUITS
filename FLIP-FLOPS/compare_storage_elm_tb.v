`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 12:57:26
// Design Name: 
// Module Name: compare_storage_elm_tb
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


module compare_storage_elm_tb(

    );
reg d,clk;
wire q_latch, q_ff_p, q_ff_n;

compare_storage_elm dut (.d(d), 
                         .clk(clk), 
                         .q_a(q_latch), 
                         .q_b(q_ff_p), 
                         .q_c(q_ff_n));

localparam T = 20; // clock period
always 
begin
    clk = 1'b0;
    #(T/2);
    clk = 1'b1;
    #(T/2);
end

initial
begin
    d = 1'b1;
    
    #(2*T)
    d = 1'b0;
    
    @(posedge clk);
    d = 1'b1;
    
    #2 d = 1'b0;
    #3 d = 1'b1;
    #4 d = 1'b0;
    
    repeat(2) @(negedge clk);
    d = 1'b1;
    
    #20 $stop;
end
endmodule
