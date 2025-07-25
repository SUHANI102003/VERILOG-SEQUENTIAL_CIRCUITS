module clock_divider_by_4(
    input wire clk_in,    // Input clock (100 MHz)
    input wire reset,     // Reset signal
    output reg clk_out    // Output clock (25 MHz)
);
    reg [1:0] counter = 0;  // 2-bit counter to track input clock cycles

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;  // Initialize output clock
        end else begin
          if(counter == 1)
            begin
              clk_out <= ~clk_out;
              counter <= counter + 1;
            end
          else if(counter == 3)
            begin
              clk_out <= ~clk_out;
              counter <= counter + 1;
            end
          else 
            begin
              counter <= counter + 1;
            end
        end
    end
endmodule
