module rising_edge_detector (
    input clk,
    input signal_in,
    output reg edge_detected
);
    reg signal_prev;

    always @(posedge clk) begin
        edge_detected <= ~signal_prev & signal_in; // 0-to-1 transition
        signal_prev <= signal_in;                 // Store current signal
    end
  
endmodule
