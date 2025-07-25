module clock_divider_by_3(
    input wire clk_in,    // Input clock
    input wire reset,     // Reset signal
    output reg clk_out    // Output divided clock
);
    reg [1:0] counter = 0;  // 2-bit counter to track input clock cycles

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;  // Initialize output clock
        end else begin
          if (counter == 0) begin  // Toggle output after 3 input cycles
                clk_out <= ~clk_out;
                counter <= counter + 1;       // Reset counter
          end else if  (counter == 2) begin
                clk_out <= ~clk_out;
                counter <= 0;  // Increment counter
            end
          else begin
                counter <= counter + 1;  // Increment counter
          end
        end
    end
endmodule
