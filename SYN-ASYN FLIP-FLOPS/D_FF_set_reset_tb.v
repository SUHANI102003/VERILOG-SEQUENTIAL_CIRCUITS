`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 16:26:28
// Design Name: 
// Module Name: D_FF_set_reset_tb
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


module D_FF_set_reset_tb(

    );
    
reg clk;
reg d;
reg reset_n; // asynchronous
reg set_n; // synchronous
wire q;

D_FF_set_reset dut (.clk(clk), 
                .d(d), 
                .q(q), 
                .reset_n(reset_n), 
                .set_n(set_n));
                
localparam T = 20;
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
        reset_n = 1'b1;
        set_n = 1'b1;
        
        @(posedge clk);
        d = 1'b0;
        
        #2 d = 1'b1;       
        #3 d = 1'b0;
        #4 d = 1'b1;
        
        @(negedge clk);
        #3 reset_n = 1'b0;
           
        #5 reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        #(T / 4)
        reset_n = 1'b0;
        #(T / 2)
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        d = 1'b1;
        reset_n = 1'b1;
        set_n = 1'b1;
               
        @(negedge clk);
        #3 set_n = 1'b0;
           
        #5 set_n = 1'b1;
        
        repeat(2) @(posedge clk);
        #(T / 4)
        set_n = 1'b0;
        #(T / 2)
        set_n = 1'b1;
        #20 $stop;
    end
endmodule
