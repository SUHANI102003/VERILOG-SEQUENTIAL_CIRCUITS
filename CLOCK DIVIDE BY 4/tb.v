module tb_clock_divider_by_4;
    // Testbench signals
    reg clk_in;            // Input clock
    reg reset;             // Reset signal
    wire clk_out;          // Output divided clock

    // Instantiate the clock divider
    clock_divider_by_4 uut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

    // Generate input clock with 10 ns period (100 MHz)
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // Toggle every 5 ns
    end

    // Stimulus block
    initial begin
        // Initialize reset
        $dumpfile("clock_divider_by_4.vcd");
        $dumpvars(0, tb_clock_divider_by_4);

        reset = 1;         // Assert reset
        #20 reset = 0;     // Deassert reset after 20 ns

        // Run simulation for 200 ns
        #200;
        $finish;           // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0dns | clk_in: %b | reset: %b | clk_out: %b", 
                 $time, clk_in, reset, clk_out);
    end
endmodule
