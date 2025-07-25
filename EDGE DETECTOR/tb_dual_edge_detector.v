module tb_dual_edge_detector;
    reg clk;
    reg signal_in;
    wire edge_detected;

    dual_edge_detector uut (
        .clk(clk),
        .signal_in(signal_in),
        .edge_detected(edge_detected)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    initial begin
        signal_in = 0;
        #12 signal_in = 1;  // Rising edge at 12 ns
        #10 signal_in = 0;  // Falling edge at 22 ns
        #10 signal_in = 1;  // Rising edge at 32 ns
        #10 signal_in = 1;  // No edge at 42 ns
        #10 signal_in = 0;  // Falling edge at 52 ns
        #10 $stop;
    end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
